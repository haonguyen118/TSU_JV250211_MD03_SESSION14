USE session14;

-- Tạo bảng employees
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,            
    position VARCHAR(50) NOT NULL,              
    salary DECIMAL(10, 2) NOT NULL,             
    hire_date DATE NOT NULL,                    
    department VARCHAR(50) NOT NULL            
);

-- Thêm bản ghi vào employees
INSERT INTO employees (full_name, position, salary, hire_date, department)
VALUES
('Nguyen Van An', 'Software Engineer', 15000000.00, '2022-05-01', 'IT'),
('Tran Thi Bich', 'HR Specialist', 12000000.00, '2021-03-15', 'Human Resources'),
('Le Van Cuong', 'Sales Manager', 18000000.00, '2020-11-20', 'Sales'),
('Pham Minh Hoang', 'Marketing Specialist', 14000000.00, '2023-01-10', 'Marketing'),
('Do Thi Ha', 'Accountant', 13000000.00, '2021-07-25', 'Finance'),
('Hoang Quang Huy', 'Project Manager', 20000000.00, '2019-06-05', 'IT');

#2) Tìm các nhân viên có mức lương cao hơn mức lương trung bình của tất cả các nhân viên.
select * from employees where salary > (select avg(salary) from employees);

select avg(salary) from employees;

#3) Tìm tên các nhân viên và phòng ban của họ, 
# nơi tổng số nhân viên trong phòng ban đó lớn hơn hoặc bằng 2.
select full_name, department from employees where department in
 (select department from employees group by department having count(employee_id)>=2);
select department from employees group by department having count(employee_id)>=2;

# 4) Tìm nhân viên có mức lương cao nhất trong từng phòng ban.
select full_name, department, salary from employees where salary in
 (select max(salary) from employees group by department);
select max(salary) from employees group by department; 

#5) Tìm phòng ban có ngày tuyển dụng sớm nhất (ngày cũ nhất) và
# hiển thị thông tin nhân viên được tuyển dụng đầu tiên trong từng phòng ban.

select full_name, department, hire_date from employees where hire_date in 
(select min(hire_date) from employees group by department);

select min(hire_date) from employees group by department;
