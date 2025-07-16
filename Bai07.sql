create table Library_member (
id int primary key auto_increment,
name varchar (50),
email varchar (50)
);
insert into Library_member (name, email)
values ('Nguyễn Thị Hào','nth@gmail.com'),
('Phạm Thị Ngân','ptn@gmail.com'),
('Nguyễn Thùy Duyên','ntd@gmail.com');
alter table books drop column category;
alter table books add column Price double not null;
update books set Price = 12000 where bookId = 1;
update books set Price = 15000 where bookId = 2;
update books set Price = 10000 where bookId = 3;
update books set Price = 20000 where bookId = 4;
update books set Price = 11000 where bookId = 5;
update books set Price = 13000 where bookId = 6;
update books set Price = 11000 where bookId = 7;
update books set Price = 19000 where bookId = 8;
update books set Price = 18000 where bookId = 9;
update books set Price = 17000 where bookId = 10;

#1.Viết truy vấn để lấy tất cả sách có giá lớn hơn 15000.

select * from books where Price > 15000;

#2.Sắp xếp danh sách sách theo giá từ thấp đến cao.
select * from books order by Price ASC;

#3.Đếm số lượng sách do mỗi tác giả viết.
select author, count(*) as book_count from books group by author;
