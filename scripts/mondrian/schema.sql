CREATE TABLE sale
(
  saleid integer NOT NULL,
  proid integer,
  cusid integer,
  unitprice double precision,
  num integer,
  CONSTRAINT sale_pkey PRIMARY KEY (saleid)
);

CREATE TABLE customer
(
  cusid integer NOT NULL,
  gender character(1),
  CONSTRAINT customer_pkey PRIMARY KEY (cusid)
);
CREATE TABLE product
(
  proid integer NOT NULL,
  protypeid integer,
  proname character varying(32),
  CONSTRAINT product_pkey PRIMARY KEY (proid)
);
CREATE TABLE producttype
(
  protypeid integer NOT NULL,
  protypename character varying(32),
  CONSTRAINT producttype_pkey PRIMARY KEY (protypeid)
);

start transaction;
insert into Customer(cusId,gender) values(1,'F');
insert into Customer(cusId,gender) values(2,'M');
insert into Customer(cusId,gender) values(3,'M');
insert into Customer(cusId,gender) values(4,'F');
insert into producttype(proTypeId,proTypeName)values(1,'电器');
insert into producttype(proTypeId,proTypeName)values(2,'数码');
insert into producttype(proTypeId,proTypeName)values(3,'家具');
insert into product(proId,proTypeId,proName)values(1,1,'洗衣机');
insert into product(proId,proTypeId,proName)values(2,1,'电视机');
insert into product(proId,proTypeId,proName)values(3,2,'mp3');
insert into product(proId,proTypeId,proName)values(4,2,'mp4');
insert into product(proId,proTypeId,proName) values(5,2,'数码相机');
insert into product(proId,proTypeId,proName)values(6,3,'椅子');
insert into product(proId,proTypeId,proName)values(7,3,'桌子');
insert into sale(saleId,proId,cusId,unitPrice,number)values(1,1,1,340.34,2);
insert into sale(saleId,proId,cusId,unitPrice,number)values(2,1,2,140.34,1);
insert into sale(saleId,proId,cusId,unitPrice,number)values(3,2,3,240.34,3);
insert into sale(saleId,proId,cusId,unitPrice,number)values(4,3,4,540.34,4);
insert into sale(saleId,proId,cusId,unitPrice,number)values(5,4,1,80.34,5);
insert into sale(saleId,proId,cusId,unitPrice,number)values(6,5,2,90.34,26);
insert into sale(saleId,proId,cusId,unitPrice,number)values(7,6,3,140.34,7);
insert into sale(saleId,proId,cusId,unitPrice,number)values(8,7,4,640.34,28);
insert into sale(saleId,proId,cusId,unitPrice,number)values(9,6,1,140.34,29);
insert into sale(saleId,proId,cusId,unitPrice,number)values(10,7,2,740.34,29);
insert into sale(saleId,proId,cusId,unitPrice,number)values(11,5,3,30.34,28);
insert into sale(saleId,proId,cusId,unitPrice,number)values(12,4,4,1240.34,72);
insert into sale(saleId,proId,cusId,unitPrice,number)values(13,3,1,314.34,27);
insert into sale(saleId,proId,cusId,unitPrice,number)values(14,3,2,45.34,27);
COMMIT;
