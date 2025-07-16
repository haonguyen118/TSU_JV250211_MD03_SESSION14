create table OrderDetail (
id int primary key auto_increment,
priceBuy decimal,
product_id int,
 foreign key (product_id) references products(id),
 quantity int not null
);
insert into OrderDetail (priceBuy, product_id, quantity)
values (120.00, 1, 12),
(150.00,2,15),
(250.00,3,25);
alter table OrderDetail add column order_id int not null references orders (id) ;


#1.Viết truy vấn để lấy thông tin đơn hàng cùng với tên khách hàng và tổng giá trị đơn hàng.
select  distinct o.*, c.customername, sum( od.priceBuy*od.quantity) as total_money
	from orders o
	join orderdetail od on o.id = od.order_id
	join customers c on o.customer_id = c.id
    group by od.order_id;

#.Tìm tất cả sản phẩm có giá trên 100 và đã được đặt hàng.
select p.id, p.productname, p.price,p.stock_quantity
   from products p join orders o on p.id = o.product_id
   where  p.price > 100 and 
   (select count(product_id) as count from orders group by product_id having count(product_id) >0);
   # lấy các product_id có số lần đặt hàng > 0
select count(product_id) as count from orders group by product_id having count(product_id) >0; 

SELECT 
    p.id, 
    p.productname, 
    p.price, 
    p.stock_quantity,
    count(product_id) as count
FROM 
    products p 
JOIN 
    orders o ON p.id = o.product_id
WHERE 
    p.price > 100
GROUP BY 
    p.id, p.productname, p.price, p.stock_quantity;
    
    #3.Đếm số lượng đơn hàng của mỗi khách hàng.
    select p.id,p.productname, count(o.product_id) as count 
    from orders o join products p on p.id = o.product_id 
    group by p.id, p.productname having count(o.product_id) >0; 