use ecommerce;

show tables;

insert into clients(fname, Minit, Lname, CPF, Address) values
				('Maria', 'M', 'Silva', 12345678911, 'R silva da prata 29, Carangola - Cidade das Flores'),
				('Matheus', 'O', 'Pimentel', 98765432199, 'R alemeda 289, Centro - Cidade das Flores'),
                ('Ricardo','F','Silva', 45678912344, 'Av alameda 785, Centro - Cidade das Flores'),
                ('Julia', 'S', 'França', 78912345677, 'R laranjeiras 216, Centro - Cidade das Flores'),
                ('Roberta', 'G', 'Assis', 89012345678, 'Av Koller 19, Centro - Flores'),
                ('Isabel', 'M', 'Cruz', 34567890123, 'R alameda das flores 48, Centro - Flores');
                

insert into product(Pname, classification_kids, category, avaliação, size) values
						('Fone de ouvido', false, 'Eletrônico', 4, null),
                        ('Barbie Elsa', true, 'Brinquedos', '3', null),
                        ('Body Carters', true, 'Vestuário', '5', null),
                        ('Microfone Vedo - YouTube', False, 'Eletrônico', '4', null),
                        ('Sofá retrátil', False, 'Móveis', '3', '3x57x80'),
                        ('Fire Stick Amazon', False, 'Eletrônico', '3', null);
                        
insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
					(1, default, 'compra via aplicativo', null, 1),
                    (2, default, 'compra via aplicativo', 50, 0),
                    (3, 'Confirmado', null, null, 1),
                    (4, default, 'compra via web site', 150, 0);
                    
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
						(1,1,2,null),
                        (2,1,1,null),
                        (3,2,1,null);

insert into productStorage(storageLocation, quantity) values
							('Rio de Janeiro', 1000),
                            ('Rio de Janeiro', 500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
                            
insert into storageLocation(idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
insert into supplier(SocialName, CNPJ, contact) values
						('Almeida e filhos',123456789012345,'21985474'),
                        ('Eletrônicos Silva',234567890123456,'21985464'),
                        ('Eletrônicos Valma',345678901234567,'219754749');

insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);

insert into seller(SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics',null,123456789012345,null,'Rio de Janeiro',21994628799),
                    ('Botique Durgas',null,null,12345678900,'Rio de Janeiro',21956789500),
                    ('Kids World',null,987654321098765,null,'São Paulo',11986574844);

select * from seller;

insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(1,6,80),
                            (2,2,10);
                            

select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (2, default,'compra via aplicativo',null,1);
                             
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select * from orders;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 