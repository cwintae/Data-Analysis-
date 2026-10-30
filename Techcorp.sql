create database techcorp;
create table Product(
	product_id INT auto_increment primary key,
    product_name varchar (100) not null,
    category varchar (50),
    price decimal (10,2),
    stock_quantity int
    );
    
    select*from Product;
    
    create table Customer(
		customer_id int auto_increment primary key,
        first_name varchar (20) not null,
        last_name varchar (20) not null,
        email varchar (30) unique,
        phone varchar (30),
        adress varchar (100)
        );
        
	select*from Customer;
    
create table Orders(
	order_id int auto_increment primary key,
    customer_id int, 
    order_date date,
    total_amount decimal (10,2),
    foreign key (customer_id) references Customer (customer_id)
	);

Select*from Orders;

create table OrderDetails(
	order_detail_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price decimal (10,2),
    foreign key (order_id) references Orders (order_id),
    foreign key (product_id) references Product (product_id)
    );
    
select*from OrderDetails;

create table Employee(
	employee_id int auto_increment primary key,
    first_name int (20),
    last_name int (20),
    email varchar (30) unique,
    phone varchar (20),
    hire_date date,
    departement varchar(50)
    );
 select*from Employee;

create table SupportTickets(
	ticket_id int auto_increment primary key,
    customer_id int,
    employee_id int,
    issue text,
    status varchar (20),
    created_at datetime,
    resolved_at datetime,
    foreign key (customer_id) references Customer (customer_id),
    foreign key (employee_id) references Employee (employee_id)
    );
select*from SupportTickets;

alter table product add discount decimal (5,2) default 0;
select*from product;
    
    
        