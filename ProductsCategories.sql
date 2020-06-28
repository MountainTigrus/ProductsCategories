-- Создаём таблицы Продуктов, Категорий и связи между продуктами и категориями
create table #Products
(
	ID	int  not null primary key identity,
	Name	varchar(30) not null unique
)

create table #Categories
(
	ID	int not null primary key identity,
	Name	varchar(30) not null unique
)

create table #ProductCategories
(
	ID_Product	int not null references #Products  (ID),
	ID_Category	int not null references #Categories(ID)
)


-- Заполняем таблицы продуктов и категорий, выводим их
insert into #Products values
('Мясо'),('Хлеб'),('Йогурт'),('Макароны'),('Лимонад'),('Сырники');

insert into #Categories values
('Молочные продукты'),('Напитки'),('Бакалея'),('Выпечка');

select * from #Products order by ID;
select * from #Categories order by ID;


-- Заполняем в соответствии с ID таблицу связей, выводим её
insert into #ProductCategories values 
(2,4),(3,1),(3,2),(4,3),(5,2),(6,1),(6,4);

select * from #ProductCategories order by ID_Product;


-- Соединяем таблицы
select P.Name as Product, C.Name as Category
from #Products as P 
	full join	#ProductCategories as PC on P.ID = PC.ID_Product
	full join	#Categories as C on PC.ID_Category = C.ID;
