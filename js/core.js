// 缓存
jQuery(function($){ jQuery.ajaxSetup({cache:false});});
// 表单序列化
(function($) {
	$.fn.serializeJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		var str = this.serialize();
		$(array).each(
				function() {
					if (serializeObj[this.name]) {
						if ($.isArray(serializeObj[this.name])) {
							serializeObj[this.name].push(this.value);
						} else {
							serializeObj[this.name] = [
									serializeObj[this.name], this.value ];
						}
					} else {
						serializeObj[this.name] = this.value;
					}
				});
		return serializeObj;
	};
})(jQuery);
// 日期格式化 原型
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
// js面向对象编程
{
		enabled: false,
		innerSeconds: 30,
		pid:null,
		start:(function(){
			if (!this.enabled){
				innerSeconds = $('#union_refreshSeconds').val();
				this.pid = window.setInterval(limix.union.search, innerSeconds*1000);
				limix.showMessage("自动刷新","刷新频率:" + innerSeconds + "秒");
			} else {
				limix.showMessage("自动刷新","已设置过自动刷新频率" + innerSeconds + "秒");
				this.stop();
				this.start();
			}
			this.enabled = true;
		}),
		stop: (function(){
			if (this.enabled){
				clearInterval(this.pid);
				this.pid = null;
				limix.showMessage("自动刷新","已清除自动刷新");
				this.enabled = false;
			} else {
				limix.showMessage("自动刷新","已清除自动刷新");
			}
		})
}

// 表单信息提交
submit: (function(){
	var isValid = $("#formId").form('validate');
	if (!isValid){
		limix.showMessage("错误","表单数据不完整");
		return;
	}
	var jsonData = $("#formId").serializeJson();
	if (jsonData.index){
		jsonData.index = jsonData.index.join(",");
	}
	$.ajax({
		url: '/limix/rule',
		type: "POST",
		data: JSON.stringify(jsonData),
		dataType:"JSON",
		contentType:"application/json; charset=utf-8",
		success: function(result) {
			limix.showMessage("保存成功","已提交到服务器");
		},
		error: function(){
			limix.showMessage("保存失败","未成功提交服务器");
		}
	});
})

// 删除
clear: (function(){$('#formId').form('clear');})
