


CREATE TABLE categories (
    category_id smallint NOT NULL PRIMARY KEY,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);




CREATE TABLE customer_demographics (
    customer_type_id varchar NOT NULL PRIMARY KEY,
    customer_desc text
);



CREATE TABLE customers (
    customer_id varchar NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


CREATE TABLE customer_customer_demo (
    customer_id varchar NOT NULL,
    customer_type_id varchar NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_demographics,
    FOREIGN KEY (customer_id) REFERENCES customers
);



CREATE TABLE employees (
    employee_id smallint NOT NULL PRIMARY KEY,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255),
	FOREIGN KEY (reports_to) REFERENCES employees
);




CREATE TABLE suppliers (
    supplier_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);




CREATE TABLE products (
    product_id smallint NOT NULL PRIMARY KEY,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories,
	FOREIGN KEY (supplier_id) REFERENCES suppliers
);




CREATE TABLE region (
    region_id smallint NOT NULL PRIMARY KEY,
    region_description varchar NOT NULL
);




CREATE TABLE shippers (
    shipper_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);




CREATE TABLE orders (
    order_id smallint NOT NULL PRIMARY KEY,
    customer_id varchar,
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15),
    FOREIGN KEY (customer_id) REFERENCES customers,
    FOREIGN KEY (employee_id) REFERENCES employees,
    FOREIGN KEY (ship_via) REFERENCES shippers
);




CREATE TABLE territories (
    territory_id character varying(20) NOT NULL PRIMARY KEY,
    territory_description varchar NOT NULL,
    region_id smallint NOT NULL,
	FOREIGN KEY (region_id) REFERENCES region
);




CREATE TABLE employee_territories (
    employee_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories,
    FOREIGN KEY (employee_id) REFERENCES employees
);




CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products,
    FOREIGN KEY (order_id) REFERENCES orders
);




CREATE TABLE us_states (
    state_id smallint NOT NULL PRIMARY KEY,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';

SET default_with_oids = false;
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO categories VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL);
INSERT INTO categories VALUES (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', NULL);
INSERT INTO categories VALUES (3, 'Confections', 'Desserts, candies, and sweet breads', NULL);
INSERT INTO categories VALUES (4, 'Dairy Products', 'Cheeses', NULL);
INSERT INTO categories VALUES (5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', NULL);
INSERT INTO categories VALUES (6, 'Meat/Poultry', 'Prepared meats', NULL);
INSERT INTO categories VALUES (7, 'Produce', 'Dried fruit and bean curd', NULL);
INSERT INTO categories VALUES (8, 'Seafood', 'Seaweed and fish', NULL);

INSERT INTO customers VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO customers VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la ConstituciÃ³n 2222', 'MÃ©xico D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customers VALUES ('ANTON', 'Antonio Moreno TaquerÃ­a', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO customers VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO customers VALUES ('BERGS', 'Berglunds snabbkÃ¶p', 'Christina Berglund', 'Order Administrator', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO customers VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO customers VALUES ('BLONP', 'Blondesddsl pÃ¨re et fils', 'FrÃ©dÃ©rique Citeaux', 'Marketing Manager', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO customers VALUES ('BOLID', 'BÃ³lido Comidas preparadas', 'MartÃ­n Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO customers VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO customers VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO customers VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO customers VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO customers VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'MÃ©xico D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO customers VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO customers VALUES ('COMMI', 'ComÃ©rcio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO customers VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO customers VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO customers VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO customers VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO customers VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO customers VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO customers VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO customers VALUES ('FOLIG', 'Folies gourmandes', 'Martine RancÃ©', 'Assistant Sales Agent', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO customers VALUES ('FOLKO', 'Folk och fÃ¤ HB', 'Maria Larsson', 'Owner', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO customers VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO customers VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO customers VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO customers VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO customers VALUES ('GALED', 'GalerÃ­a del gastrÃ³nomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO customers VALUES ('GODOS', 'Godos Cocina TÃ­pica', 'JosÃ© Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO customers VALUES ('GOURL', 'Gourmet Lanchonetes', 'AndrÃ© Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO customers VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO customers VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5Âª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO customers VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO customers VALUES ('HILAA', 'HILARION-Abastos', 'Carlos HernÃ¡ndez', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO customers VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO customers VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO customers VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO customers VALUES ('KOENE', 'KÃ¶niglich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO customers VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO customers VALUES ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO customers VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO customers VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO customers VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO customers VALUES ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO customers VALUES ('LILAS', 'LILA-Supermercado', 'Carlos GonzÃ¡lez', 'Accounting Manager', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO customers VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO customers VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO customers VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO customers VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO customers VALUES ('MEREP', 'MÃ¨re Paillarde', 'Jean FresniÃ¨re', 'Marketing Assistant', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO customers VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL);
INSERT INTO customers VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO customers VALUES ('OCEAN', 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO customers VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO customers VALUES ('OTTIK', 'Ottilies KÃ¤seladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO customers VALUES ('PARIS', 'Paris spÃ©cialitÃ©s', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO customers VALUES ('PERIC', 'Pericles Comidas clÃ¡sicas', 'Guillermo FernÃ¡ndez', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO customers VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO customers VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO customers VALUES ('QUEDE', 'Que DelÃ­cia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO customers VALUES ('QUEEN', 'Queen Cozinha', 'LÃºcia Carvalho', 'Marketing Assistant', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO customers VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL);
INSERT INTO customers VALUES ('RANCH', 'Rancho grande', 'Sergio GutiÃ©rrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO customers VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO customers VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO customers VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO customers VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'GenÃ¨ve', NULL, '1203', 'Switzerland', '0897-034214', NULL);
INSERT INTO customers VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO customers VALUES ('SANTG', 'SantÃ© Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO customers VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL);
INSERT INTO customers VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO customers VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO customers VALUES ('SPECD', 'SpÃ©cialitÃ©s du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO customers VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO customers VALUES ('SUPRD', 'SuprÃªmes dÃ©lices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO customers VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL);
INSERT INTO customers VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO customers VALUES ('TOMSP', 'Toms SpezialitÃ¤ten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO customers VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO customers VALUES ('TRADH', 'TradiÃ§Ã£o Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO customers VALUES ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO customers VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO customers VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO customers VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO customers VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita MÃ¼ller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO customers VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO customers VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO customers VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO customers VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO customers VALUES ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');


INSERT INTO region VALUES (1, 'Eastern');
INSERT INTO region VALUES (2, 'Western');
INSERT INTO region VALUES (3, 'Northern');
INSERT INTO region VALUES (4, 'Southern');

INSERT INTO territories VALUES ('01581', 'Westboro', 1);
INSERT INTO territories VALUES ('01730', 'Bedford', 1);
INSERT INTO territories VALUES ('01833', 'Georgetow', 1);
INSERT INTO territories VALUES ('02116', 'Boston', 1);
INSERT INTO territories VALUES ('02139', 'Cambridge', 1);
INSERT INTO territories VALUES ('02184', 'Braintree', 1);
INSERT INTO territories VALUES ('02903', 'Providence', 1);
INSERT INTO territories VALUES ('03049', 'Hollis', 3);
INSERT INTO territories VALUES ('03801', 'Portsmouth', 3);
INSERT INTO territories VALUES ('06897', 'Wilton', 1);
INSERT INTO territories VALUES ('07960', 'Morristown', 1);
INSERT INTO territories VALUES ('08837', 'Edison', 1);
INSERT INTO territories VALUES ('10019', 'New York', 1);
INSERT INTO territories VALUES ('10038', 'New York', 1);
INSERT INTO territories VALUES ('11747', 'Mellvile', 1);
INSERT INTO territories VALUES ('14450', 'Fairport', 1);
INSERT INTO territories VALUES ('19428', 'Philadelphia', 3);
INSERT INTO territories VALUES ('19713', 'Neward', 1);
INSERT INTO territories VALUES ('20852', 'Rockville', 1);
INSERT INTO territories VALUES ('27403', 'Greensboro', 1);
INSERT INTO territories VALUES ('27511', 'Cary', 1);
INSERT INTO territories VALUES ('29202', 'Columbia', 4);
INSERT INTO territories VALUES ('30346', 'Atlanta', 4);
INSERT INTO territories VALUES ('31406', 'Savannah', 4);
INSERT INTO territories VALUES ('32859', 'Orlando', 4);
INSERT INTO territories VALUES ('33607', 'Tampa', 4);
INSERT INTO territories VALUES ('40222', 'Louisville', 1);
INSERT INTO territories VALUES ('44122', 'Beachwood', 3);
INSERT INTO territories VALUES ('45839', 'Findlay', 3);
INSERT INTO territories VALUES ('48075', 'Southfield', 3);
INSERT INTO territories VALUES ('48084', 'Troy', 3);
INSERT INTO territories VALUES ('48304', 'Bloomfield Hills', 3);
INSERT INTO territories VALUES ('53404', 'Racine', 3);
INSERT INTO territories VALUES ('55113', 'Roseville', 3);
INSERT INTO territories VALUES ('55439', 'Minneapolis', 3);
INSERT INTO territories VALUES ('60179', 'Hoffman Estates', 2);
INSERT INTO territories VALUES ('60601', 'Chicago', 2);
INSERT INTO territories VALUES ('72716', 'Bentonville', 4);
INSERT INTO territories VALUES ('75234', 'Dallas', 4);
INSERT INTO territories VALUES ('78759', 'Austin', 4);
INSERT INTO territories VALUES ('80202', 'Denver', 2);
INSERT INTO territories VALUES ('80909', 'Colorado Springs', 2);
INSERT INTO territories VALUES ('85014', 'Phoenix', 2);
INSERT INTO territories VALUES ('85251', 'Scottsdale', 2);
INSERT INTO territories VALUES ('90405', 'Santa Monica', 2);
INSERT INTO territories VALUES ('94025', 'Menlo Park', 2);
INSERT INTO territories VALUES ('94105', 'San Francisco', 2);
INSERT INTO territories VALUES ('95008', 'Campbell', 2);
INSERT INTO territories VALUES ('95054', 'Santa Clara', 2);
INSERT INTO territories VALUES ('95060', 'Santa Cruz', 2);
INSERT INTO territories VALUES ('98004', 'Bellevue', 2);
INSERT INTO territories VALUES ('98052', 'Redmond', 2);
INSERT INTO territories VALUES ('98104', 'Seattle', 2);

INSERT INTO employees VALUES (2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', NULL, 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees VALUES (3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', NULL, 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees VALUES (4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', NULL, 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees VALUES (5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', NULL, 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees VALUES (6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', NULL, 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', NULL, 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', NULL, 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', NULL, 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', NULL, 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');


INSERT INTO employee_territories VALUES (1, '06897');
INSERT INTO employee_territories VALUES (1, '19713');
INSERT INTO employee_territories VALUES (2, '01581');
INSERT INTO employee_territories VALUES (2, '01730');
INSERT INTO employee_territories VALUES (2, '01833');
INSERT INTO employee_territories VALUES (2, '02116');
INSERT INTO employee_territories VALUES (2, '02139');
INSERT INTO employee_territories VALUES (2, '02184');
INSERT INTO employee_territories VALUES (2, '40222');
INSERT INTO employee_territories VALUES (3, '30346');
INSERT INTO employee_territories VALUES (3, '31406');
INSERT INTO employee_territories VALUES (3, '32859');
INSERT INTO employee_territories VALUES (3, '33607');
INSERT INTO employee_territories VALUES (4, '20852');
INSERT INTO employee_territories VALUES (4, '27403');
INSERT INTO employee_territories VALUES (4, '27511');
INSERT INTO employee_territories VALUES (5, '02903');
INSERT INTO employee_territories VALUES (5, '07960');
INSERT INTO employee_territories VALUES (5, '08837');
INSERT INTO employee_territories VALUES (5, '10019');
INSERT INTO employee_territories VALUES (5, '10038');
INSERT INTO employee_territories VALUES (5, '11747');
INSERT INTO employee_territories VALUES (5, '14450');
INSERT INTO employee_territories VALUES (6, '85014');
INSERT INTO employee_territories VALUES (6, '85251');
INSERT INTO employee_territories VALUES (6, '98004');
INSERT INTO employee_territories VALUES (6, '98052');
INSERT INTO employee_territories VALUES (6, '98104');
INSERT INTO employee_territories VALUES (7, '60179');
INSERT INTO employee_territories VALUES (7, '60601');
INSERT INTO employee_territories VALUES (7, '80202');
INSERT INTO employee_territories VALUES (7, '80909');
INSERT INTO employee_territories VALUES (7, '90405');
INSERT INTO employee_territories VALUES (7, '94025');
INSERT INTO employee_territories VALUES (7, '94105');
INSERT INTO employee_territories VALUES (7, '95008');
INSERT INTO employee_territories VALUES (7, '95054');
INSERT INTO employee_territories VALUES (7, '95060');
INSERT INTO employee_territories VALUES (8, '19428');
INSERT INTO employee_territories VALUES (8, '44122');
INSERT INTO employee_territories VALUES (8, '45839');
INSERT INTO employee_territories VALUES (8, '53404');
INSERT INTO employee_territories VALUES (9, '03049');
INSERT INTO employee_territories VALUES (9, '03801');
INSERT INTO employee_territories VALUES (9, '48075');
INSERT INTO employee_territories VALUES (9, '48084');
INSERT INTO employee_territories VALUES (9, '48304');
INSERT INTO employee_territories VALUES (9, '55113');
INSERT INTO employee_territories VALUES (9, '55439');

INSERT INTO suppliers VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES (4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO suppliers VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES (6, 'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES (7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO suppliers VALUES (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES (9, 'PB KnÃ¤ckebrÃ¶d AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'GÃ¶teborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO suppliers VALUES (10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO suppliers VALUES (11, 'Heli SÃ¼ÃŸwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'TiergartenstraÃŸe 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO suppliers VALUES (12, 'Plutzer LebensmittelgroÃŸmÃ¤rkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO suppliers VALUES (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES (15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO suppliers VALUES (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);
INSERT INTO suppliers VALUES (17, 'Svensk SjÃ¶fÃ¶da AB', 'Michael BjÃ¶rn', 'Sales Representative', 'BrovallavÃ¤gen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL);
INSERT INTO suppliers VALUES (18, 'Aux joyeux ecclÃ©siastiques', 'GuylÃ¨ne Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL);
INSERT INTO suppliers VALUES (19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO suppliers VALUES (20, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO suppliers VALUES (21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL);
INSERT INTO suppliers VALUES (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL);
INSERT INTO suppliers VALUES (23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL);
INSERT INTO suppliers VALUES (24, 'G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO suppliers VALUES (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL);
INSERT INTO suppliers VALUES (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL);
INSERT INTO suppliers VALUES (27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL);
INSERT INTO suppliers VALUES (28, 'Gai pÃ¢turage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL);
INSERT INTO suppliers VALUES (29, 'ForÃªts d''Ã©rables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'QuÃ©bec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);

INSERT INTO products VALUES (1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO products VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO products VALUES (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO products VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO products VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500004, 0, 0, 0, 1);
INSERT INTO products VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO products VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO products VALUES (8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO products VALUES (9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);
INSERT INTO products VALUES (10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO products VALUES (11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO products VALUES (12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO products VALUES (13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO products VALUES (14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO products VALUES (15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0);
INSERT INTO products VALUES (16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.4500008, 29, 0, 10, 0);
INSERT INTO products VALUES (17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1);
INSERT INTO products VALUES (18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO products VALUES (19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.19999981, 25, 0, 5, 0);
INSERT INTO products VALUES (20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO products VALUES (21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO products VALUES (22, 'Gustaf''s KnÃ¤ckebrÃ¶d', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO products VALUES (23, 'TunnbrÃ¶d', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO products VALUES (24, 'GuaranÃ¡ FantÃ¡stica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, 1);
INSERT INTO products VALUES (25, 'NuNuCa NuÃŸ-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO products VALUES (26, 'GumbÃ¤r GummibÃ¤rchen', 11, 3, '100 - 250 g bags', 31.2299995, 15, 0, 0, 0);
INSERT INTO products VALUES (27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9000015, 49, 0, 30, 0);
INSERT INTO products VALUES (28, 'RÃ¶ssle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, 0, 0, 1);
INSERT INTO products VALUES (29, 'ThÃ¼ringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790001, 0, 0, 0, 1);
INSERT INTO products VALUES (30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8899994, 10, 0, 15, 0);
INSERT INTO products VALUES (31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO products VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO products VALUES (33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO products VALUES (34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO products VALUES (35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO products VALUES (36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO products VALUES (37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO products VALUES (38, 'CÃ´te de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO products VALUES (39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO products VALUES (40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, 0, 30, 0);
INSERT INTO products VALUES (41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, 0, 10, 0);
INSERT INTO products VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO products VALUES (43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO products VALUES (44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.4500008, 27, 0, 15, 0);
INSERT INTO products VALUES (45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO products VALUES (46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO products VALUES (47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO products VALUES (48, 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO products VALUES (49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO products VALUES (50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO products VALUES (51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO products VALUES (52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO products VALUES (53, 'Perth Pasties', 24, 6, '48 pieces', 32.7999992, 0, 0, 0, 1);
INSERT INTO products VALUES (54, 'TourtiÃ¨re', 25, 6, '16 pies', 7.44999981, 21, 0, 10, 0);
INSERT INTO products VALUES (55, 'PÃ¢tÃ© chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO products VALUES (56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO products VALUES (57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO products VALUES (58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO products VALUES (59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO products VALUES (60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO products VALUES (61, 'Sirop d''Ã©rable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO products VALUES (62, 'Tarte au sucre', 29, 3, '48 pies', 49.2999992, 17, 0, 0, 0);
INSERT INTO products VALUES (63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9000015, 24, 0, 5, 0);
INSERT INTO products VALUES (64, 'Wimmers gute SemmelknÃ¶del', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO products VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.0499992, 76, 0, 0, 0);
INSERT INTO products VALUES (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO products VALUES (67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO products VALUES (68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO products VALUES (69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO products VALUES (70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO products VALUES (71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO products VALUES (72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.7999992, 14, 0, 0, 0);
INSERT INTO products VALUES (73, 'RÃ¶d Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO products VALUES (74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO products VALUES (75, 'RhÃ¶nbrÃ¤u Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO products VALUES (76, 'LakkalikÃ¶Ã¶ri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO products VALUES (77, 'Original Frankfurter grÃ¼ne SoÃŸe', 12, 2, '12 boxes', 13, 32, 0, 15, 0);



--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippers VALUES (1, 'Speedy Express', '(503) 555-9831');
INSERT INTO shippers VALUES (2, 'United Package', '(503) 555-3199');
INSERT INTO shippers VALUES (3, 'Federal Shipping', '(503) 555-9931');
INSERT INTO shippers VALUES (4, 'Alliance Shippers', '1-800-222-0451');
INSERT INTO shippers VALUES (5, 'UPS', '1-800-782-7892');
INSERT INTO shippers VALUES (6, 'DHL', '1-800-225-5345');



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (10248, 'VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10249, 'TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10250, 'HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300018, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10251, 'VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10252, 'SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.2999992, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10253, 'HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10254, 'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10255, 'RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.330002, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10256, 'WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10257, 'HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100037, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10258, 'ERNSH', 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.509995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10259, 'CENTC', 4, '1996-07-18', '1996-08-15', '1996-07-25', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'MÃ©xico D.F.', NULL, '05022', 'Mexico');
INSERT INTO orders VALUES (10260, 'OTTIK', 4, '1996-07-19', '1996-08-16', '1996-07-29', 1, 55.0900002, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10261, 'QUEDE', 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.04999995, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10262, 'RATTC', 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.2900009, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10263, 'ERNSH', 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.059998, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10264, 'FOLKO', 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.67000008, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10265, 'BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.2799988, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10266, 'WARTH', 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.7299995, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10267, 'FRANK', 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.580002, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10268, 'GROSR', 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.2900009, 'GROSELLA-Restaurante', '5Âª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES (10269, 'WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.55999994, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10270, 'WARTH', 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.539993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10271, 'SPLIR', 6, '1996-08-01', '1996-08-29', '1996-08-30', 2, 4.53999996, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10272, 'RATTC', 6, '1996-08-02', '1996-08-30', '1996-08-06', 2, 98.0299988, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10273, 'QUICK', 3, '1996-08-05', '1996-09-02', '1996-08-12', 3, 76.0699997, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10274, 'VINET', 6, '1996-08-06', '1996-09-03', '1996-08-16', 1, 6.01000023, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10275, 'MAGAA', 1, '1996-08-07', '1996-09-04', '1996-08-09', 1, 26.9300003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10276, 'TORTU', 8, '1996-08-08', '1996-08-22', '1996-08-14', 3, 13.8400002, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10277, 'MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 125.769997, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10278, 'BERGS', 8, '1996-08-12', '1996-09-09', '1996-08-16', 2, 92.6900024, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10279, 'LEHMS', 8, '1996-08-13', '1996-09-10', '1996-08-16', 2, 25.8299999, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10280, 'BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 8.97999954, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10281, 'ROMEY', 4, '1996-08-14', '1996-08-28', '1996-08-21', 1, 2.94000006, 'Romero y tomillo', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10282, 'ROMEY', 4, '1996-08-15', '1996-09-12', '1996-08-21', 1, 12.6899996, 'Romero y tomillo', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10283, 'LILAS', 3, '1996-08-16', '1996-09-13', '1996-08-23', 3, 84.8099976, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10284, 'LEHMS', 4, '1996-08-19', '1996-09-16', '1996-08-27', 1, 76.5599976, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10285, 'QUICK', 1, '1996-08-20', '1996-09-17', '1996-08-26', 2, 76.8300018, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10286, 'QUICK', 8, '1996-08-21', '1996-09-18', '1996-08-30', 3, 229.240005, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10287, 'RICAR', 8, '1996-08-22', '1996-09-19', '1996-08-28', 3, 12.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10288, 'REGGC', 4, '1996-08-23', '1996-09-20', '1996-09-03', 1, 7.44999981, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10289, 'BSBEV', 7, '1996-08-26', '1996-09-23', '1996-08-28', 3, 22.7700005, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10290, 'COMMI', 8, '1996-08-27', '1996-09-24', '1996-09-03', 1, 79.6999969, 'ComÃ©rcio Mineiro', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (10291, 'QUEDE', 6, '1996-08-27', '1996-09-24', '1996-09-04', 2, 6.4000001, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10292, 'TRADH', 1, '1996-08-28', '1996-09-25', '1996-09-02', 2, 1.35000002, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10293, 'TORTU', 1, '1996-08-29', '1996-09-26', '1996-09-11', 3, 21.1800003, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10294, 'RATTC', 4, '1996-08-30', '1996-09-27', '1996-09-05', 2, 147.259995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10295, 'VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1.14999998, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10296, 'LILAS', 6, '1996-09-03', '1996-10-01', '1996-09-11', 1, 0.119999997, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10297, 'BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 5.73999977, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10298, 'HUNGO', 6, '1996-09-05', '1996-10-03', '1996-09-11', 2, 168.220001, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10299, 'RICAR', 4, '1996-09-06', '1996-10-04', '1996-09-13', 2, 29.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10300, 'MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 17.6800003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10301, 'WANDK', 8, '1996-09-09', '1996-10-07', '1996-09-17', 2, 45.0800018, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10302, 'SUPRD', 4, '1996-09-10', '1996-10-08', '1996-10-09', 2, 6.26999998, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10303, 'GODOS', 7, '1996-09-11', '1996-10-09', '1996-09-18', 2, 107.830002, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10304, 'TORTU', 1, '1996-09-12', '1996-10-10', '1996-09-17', 2, 63.7900009, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10305, 'OLDWO', 8, '1996-09-13', '1996-10-11', '1996-10-09', 3, 257.619995, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10306, 'ROMEY', 1, '1996-09-16', '1996-10-14', '1996-09-23', 3, 7.55999994, 'Romero y tomillo', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10307, 'LONEP', 2, '1996-09-17', '1996-10-15', '1996-09-25', 2, 0.560000002, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10308, 'ANATR', 7, '1996-09-18', '1996-10-16', '1996-09-24', 3, 1.61000001, 'Ana Trujillo Emparedados y helados', 'Avda. de la ConstituciÃ³n 2222', 'MÃ©xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10309, 'HUNGO', 3, '1996-09-19', '1996-10-17', '1996-10-23', 1, 47.2999992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10310, 'THEBI', 8, '1996-09-20', '1996-10-18', '1996-09-27', 2, 17.5200005, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (10311, 'DUMON', 1, '1996-09-20', '1996-10-04', '1996-09-26', 3, 24.6900005, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10312, 'WANDK', 2, '1996-09-23', '1996-10-21', '1996-10-03', 2, 40.2599983, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10313, 'QUICK', 2, '1996-09-24', '1996-10-22', '1996-10-04', 2, 1.96000004, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10314, 'RATTC', 1, '1996-09-25', '1996-10-23', '1996-10-04', 2, 74.1600037, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10315, 'ISLAT', 4, '1996-09-26', '1996-10-24', '1996-10-03', 2, 41.7599983, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10316, 'RATTC', 1, '1996-09-27', '1996-10-25', '1996-10-08', 3, 150.149994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10317, 'LONEP', 6, '1996-09-30', '1996-10-28', '1996-10-10', 1, 12.6899996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10318, 'ISLAT', 8, '1996-10-01', '1996-10-29', '1996-10-04', 2, 4.73000002, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10319, 'TORTU', 7, '1996-10-02', '1996-10-30', '1996-10-11', 3, 64.5, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10320, 'WARTH', 5, '1996-10-03', '1996-10-17', '1996-10-18', 3, 34.5699997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10321, 'ISLAT', 3, '1996-10-03', '1996-10-31', '1996-10-11', 2, 3.43000007, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10322, 'PERIC', 7, '1996-10-04', '1996-11-01', '1996-10-23', 3, 0.400000006, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10323, 'KOENE', 4, '1996-10-07', '1996-11-04', '1996-10-14', 1, 4.88000011, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10324, 'SAVEA', 9, '1996-10-08', '1996-11-05', '1996-10-10', 1, 214.270004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10325, 'KOENE', 1, '1996-10-09', '1996-10-23', '1996-10-14', 3, 64.8600006, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10326, 'BOLID', 4, '1996-10-10', '1996-11-07', '1996-10-14', 2, 77.9199982, 'BÃ³lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (10327, 'FOLKO', 2, '1996-10-11', '1996-11-08', '1996-10-14', 1, 63.3600006, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10328, 'FURIB', 4, '1996-10-14', '1996-11-11', '1996-10-17', 3, 87.0299988, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10329, 'SPLIR', 4, '1996-10-15', '1996-11-26', '1996-10-23', 2, 191.669998, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10330, 'LILAS', 3, '1996-10-16', '1996-11-13', '1996-10-28', 1, 12.75, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10331, 'BONAP', 9, '1996-10-16', '1996-11-27', '1996-10-21', 1, 10.1899996, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10332, 'MEREP', 3, '1996-10-17', '1996-11-28', '1996-10-21', 2, 52.8400002, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10333, 'WARTH', 5, '1996-10-18', '1996-11-15', '1996-10-25', 3, 0.589999974, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10334, 'VICTE', 8, '1996-10-21', '1996-11-18', '1996-10-28', 2, 8.56000042, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10335, 'HUNGO', 7, '1996-10-22', '1996-11-19', '1996-10-24', 2, 42.1100006, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10336, 'PRINI', 7, '1996-10-23', '1996-11-20', '1996-10-25', 2, 15.5100002, 'Princesa Isabel Vinhos', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (10337, 'FRANK', 4, '1996-10-24', '1996-11-21', '1996-10-29', 3, 108.260002, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10338, 'OLDWO', 4, '1996-10-25', '1996-11-22', '1996-10-29', 3, 84.2099991, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10339, 'MEREP', 2, '1996-10-28', '1996-11-25', '1996-11-04', 2, 15.6599998, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10340, 'BONAP', 1, '1996-10-29', '1996-11-26', '1996-11-08', 3, 166.309998, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10341, 'SIMOB', 7, '1996-10-29', '1996-11-26', '1996-11-05', 3, 26.7800007, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10342, 'FRANK', 4, '1996-10-30', '1996-11-13', '1996-11-04', 2, 54.8300018, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10343, 'LEHMS', 4, '1996-10-31', '1996-11-28', '1996-11-06', 1, 110.370003, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10344, 'WHITC', 4, '1996-11-01', '1996-11-29', '1996-11-05', 2, 23.2900009, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10345, 'QUICK', 2, '1996-11-04', '1996-12-02', '1996-11-11', 2, 249.059998, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10346, 'RATTC', 3, '1996-11-05', '1996-12-17', '1996-11-08', 3, 142.080002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10347, 'FAMIA', 4, '1996-11-06', '1996-12-04', '1996-11-08', 3, 3.0999999, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10348, 'WANDK', 4, '1996-11-07', '1996-12-05', '1996-11-15', 2, 0.779999971, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10349, 'SPLIR', 7, '1996-11-08', '1996-12-06', '1996-11-15', 1, 8.63000011, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10350, 'LAMAI', 6, '1996-11-11', '1996-12-09', '1996-12-03', 2, 64.1900024, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10351, 'ERNSH', 1, '1996-11-11', '1996-12-09', '1996-11-20', 1, 162.330002, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10352, 'FURIB', 3, '1996-11-12', '1996-11-26', '1996-11-18', 3, 1.29999995, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10353, 'PICCO', 7, '1996-11-13', '1996-12-11', '1996-11-25', 3, 360.630005, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10354, 'PERIC', 8, '1996-11-14', '1996-12-12', '1996-11-20', 3, 53.7999992, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10355, 'AROUT', 6, '1996-11-15', '1996-12-13', '1996-11-20', 1, 41.9500008, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10356, 'WANDK', 6, '1996-11-18', '1996-12-16', '1996-11-27', 2, 36.7099991, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10357, 'LILAS', 1, '1996-11-19', '1996-12-17', '1996-12-02', 3, 34.8800011, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10358, 'LAMAI', 5, '1996-11-20', '1996-12-18', '1996-11-27', 1, 19.6399994, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10359, 'SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10360, 'BLONP', 4, '1996-11-22', '1996-12-20', '1996-12-02', 3, 131.699997, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10361, 'QUICK', 1, '1996-11-22', '1996-12-20', '1996-12-03', 2, 183.169998, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10362, 'BONAP', 3, '1996-11-25', '1996-12-23', '1996-11-28', 1, 96.0400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10363, 'DRACD', 4, '1996-11-26', '1996-12-24', '1996-12-04', 3, 30.5400009, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (10364, 'EASTC', 1, '1996-11-26', '1997-01-07', '1996-12-04', 1, 71.9700012, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (10365, 'ANTON', 3, '1996-11-27', '1996-12-25', '1996-12-02', 2, 22, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10366, 'GALED', 8, '1996-11-28', '1997-01-09', '1996-12-30', 2, 10.1400003, 'GalerÃ­a del gastronÃ³mo', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (10367, 'VAFFE', 7, '1996-11-28', '1996-12-26', '1996-12-02', 3, 13.5500002, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10368, 'ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-02', 2, 101.949997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10369, 'SPLIR', 8, '1996-12-02', '1996-12-30', '1996-12-09', 2, 195.679993, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10370, 'CHOPS', 6, '1996-12-03', '1996-12-31', '1996-12-27', 2, 1.16999996, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10371, 'LAMAI', 1, '1996-12-03', '1996-12-31', '1996-12-24', 1, 0.449999988, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10372, 'QUEEN', 5, '1996-12-04', '1997-01-01', '1996-12-09', 2, 890.780029, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10373, 'HUNGO', 4, '1996-12-05', '1997-01-02', '1996-12-11', 3, 124.120003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10374, 'WOLZA', 1, '1996-12-05', '1997-01-02', '1996-12-09', 3, 3.94000006, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10375, 'HUNGC', 3, '1996-12-06', '1997-01-03', '1996-12-09', 2, 20.1200008, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (10376, 'MEREP', 1, '1996-12-09', '1997-01-06', '1996-12-13', 2, 20.3899994, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10377, 'SEVES', 1, '1996-12-09', '1997-01-06', '1996-12-13', 3, 22.2099991, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10378, 'FOLKO', 5, '1996-12-10', '1997-01-07', '1996-12-19', 3, 5.44000006, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10379, 'QUEDE', 2, '1996-12-11', '1997-01-08', '1996-12-13', 1, 45.0299988, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10380, 'HUNGO', 8, '1996-12-12', '1997-01-09', '1997-01-16', 3, 35.0299988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10381, 'LILAS', 3, '1996-12-12', '1997-01-09', '1996-12-13', 3, 7.98999977, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10382, 'ERNSH', 4, '1996-12-13', '1997-01-10', '1996-12-16', 1, 94.7699966, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10383, 'AROUT', 8, '1996-12-16', '1997-01-13', '1996-12-18', 3, 34.2400017, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10384, 'BERGS', 3, '1996-12-16', '1997-01-13', '1996-12-20', 3, 168.639999, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10385, 'SPLIR', 1, '1996-12-17', '1997-01-14', '1996-12-23', 2, 30.9599991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10386, 'FAMIA', 9, '1996-12-18', '1997-01-01', '1996-12-25', 3, 13.9899998, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10387, 'SANTG', 1, '1996-12-18', '1997-01-15', '1996-12-20', 2, 93.6299973, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (10388, 'SEVES', 2, '1996-12-19', '1997-01-16', '1996-12-20', 1, 34.8600006, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10389, 'BOTTM', 4, '1996-12-20', '1997-01-17', '1996-12-24', 2, 47.4199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10390, 'ERNSH', 6, '1996-12-23', '1997-01-20', '1996-12-26', 1, 126.379997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10391, 'DRACD', 3, '1996-12-23', '1997-01-20', '1996-12-31', 3, 5.44999981, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (10392, 'PICCO', 2, '1996-12-24', '1997-01-21', '1997-01-01', 3, 122.459999, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10393, 'SAVEA', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 126.559998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10394, 'HUNGC', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 30.3400002, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (10395, 'HILAA', 6, '1996-12-26', '1997-01-23', '1997-01-03', 1, 184.410004, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10396, 'FRANK', 1, '1996-12-27', '1997-01-10', '1997-01-06', 3, 135.350006, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10397, 'PRINI', 5, '1996-12-27', '1997-01-24', '1997-01-02', 1, 60.2599983, 'Princesa Isabel Vinhos', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (10398, 'SAVEA', 2, '1996-12-30', '1997-01-27', '1997-01-09', 3, 89.1600037, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10399, 'VAFFE', 8, '1996-12-31', '1997-01-14', '1997-01-08', 3, 27.3600006, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10400, 'EASTC', 1, '1997-01-01', '1997-01-29', '1997-01-16', 3, 83.9300003, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (10401, 'RATTC', 1, '1997-01-01', '1997-01-29', '1997-01-10', 1, 12.5100002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10402, 'ERNSH', 8, '1997-01-02', '1997-02-13', '1997-01-10', 2, 67.8799973, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10403, 'ERNSH', 4, '1997-01-03', '1997-01-31', '1997-01-09', 3, 73.7900009, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10404, 'MAGAA', 2, '1997-01-03', '1997-01-31', '1997-01-08', 1, 155.970001, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10405, 'LINOD', 1, '1997-01-06', '1997-02-03', '1997-01-22', 1, 34.8199997, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10406, 'QUEEN', 7, '1997-01-07', '1997-02-18', '1997-01-13', 1, 108.040001, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10407, 'OTTIK', 2, '1997-01-07', '1997-02-04', '1997-01-30', 2, 91.4800034, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10408, 'FOLIG', 8, '1997-01-08', '1997-02-05', '1997-01-14', 1, 11.2600002, 'Folies gourmandes', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (10409, 'OCEAN', 3, '1997-01-09', '1997-02-06', '1997-01-14', 1, 29.8299999, 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10410, 'BOTTM', 3, '1997-01-10', '1997-02-07', '1997-01-15', 3, 2.4000001, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10411, 'BOTTM', 9, '1997-01-10', '1997-02-07', '1997-01-21', 3, 23.6499996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10412, 'WARTH', 8, '1997-01-13', '1997-02-10', '1997-01-15', 2, 3.76999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10413, 'LAMAI', 3, '1997-01-14', '1997-02-11', '1997-01-16', 2, 95.6600037, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10414, 'FAMIA', 2, '1997-01-14', '1997-02-11', '1997-01-17', 3, 21.4799995, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10415, 'HUNGC', 3, '1997-01-15', '1997-02-12', '1997-01-24', 1, 0.200000003, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (10416, 'WARTH', 8, '1997-01-16', '1997-02-13', '1997-01-27', 3, 22.7199993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10417, 'SIMOB', 4, '1997-01-16', '1997-02-13', '1997-01-28', 3, 70.2900009, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10418, 'QUICK', 4, '1997-01-17', '1997-02-14', '1997-01-24', 1, 17.5499992, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10419, 'RICSU', 4, '1997-01-20', '1997-02-17', '1997-01-30', 2, 137.350006, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10420, 'WELLI', 3, '1997-01-21', '1997-02-18', '1997-01-27', 1, 44.1199989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10421, 'QUEDE', 8, '1997-01-21', '1997-03-04', '1997-01-27', 1, 99.2300034, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10422, 'FRANS', 2, '1997-01-22', '1997-02-19', '1997-01-31', 1, 3.01999998, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (10423, 'GOURL', 6, '1997-01-23', '1997-02-06', '1997-02-24', 3, 24.5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10424, 'MEREP', 7, '1997-01-23', '1997-02-20', '1997-01-27', 2, 370.609985, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10425, 'LAMAI', 6, '1997-01-24', '1997-02-21', '1997-02-14', 2, 7.92999983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10426, 'GALED', 4, '1997-01-27', '1997-02-24', '1997-02-06', 1, 18.6900005, 'GalerÃ­a del gastronÃ³mo', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (10427, 'PICCO', 4, '1997-01-27', '1997-02-24', '1997-03-03', 2, 31.2900009, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10428, 'REGGC', 7, '1997-01-28', '1997-02-25', '1997-02-04', 1, 11.0900002, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10429, 'HUNGO', 3, '1997-01-29', '1997-03-12', '1997-02-07', 2, 56.6300011, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10430, 'ERNSH', 4, '1997-01-30', '1997-02-13', '1997-02-03', 1, 458.779999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10431, 'BOTTM', 4, '1997-01-30', '1997-02-13', '1997-02-07', 2, 44.1699982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10432, 'SPLIR', 3, '1997-01-31', '1997-02-14', '1997-02-07', 2, 4.34000015, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10433, 'PRINI', 3, '1997-02-03', '1997-03-03', '1997-03-04', 3, 73.8300018, 'Princesa Isabel Vinhos', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (10434, 'FOLKO', 3, '1997-02-03', '1997-03-03', '1997-02-13', 2, 17.9200001, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10435, 'CONSH', 8, '1997-02-04', '1997-03-18', '1997-02-07', 2, 9.21000004, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (10436, 'BLONP', 3, '1997-02-05', '1997-03-05', '1997-02-11', 2, 156.660004, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10437, 'WARTH', 8, '1997-02-05', '1997-03-05', '1997-02-12', 1, 19.9699993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10438, 'TOMSP', 3, '1997-02-06', '1997-03-06', '1997-02-14', 2, 8.23999977, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10439, 'MEREP', 6, '1997-02-07', '1997-03-07', '1997-02-10', 3, 4.07000017, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10440, 'SAVEA', 4, '1997-02-10', '1997-03-10', '1997-02-28', 2, 86.5299988, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10441, 'OLDWO', 3, '1997-02-10', '1997-03-24', '1997-03-14', 2, 73.0199966, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10442, 'ERNSH', 3, '1997-02-11', '1997-03-11', '1997-02-18', 2, 47.9399986, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10443, 'REGGC', 8, '1997-02-12', '1997-03-12', '1997-02-14', 1, 13.9499998, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10444, 'BERGS', 3, '1997-02-12', '1997-03-12', '1997-02-21', 3, 3.5, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10445, 'BERGS', 3, '1997-02-13', '1997-03-13', '1997-02-20', 1, 9.30000019, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10446, 'TOMSP', 6, '1997-02-14', '1997-03-14', '1997-02-19', 1, 14.6800003, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10447, 'RICAR', 4, '1997-02-14', '1997-03-14', '1997-03-07', 2, 68.6600037, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10448, 'RANCH', 4, '1997-02-17', '1997-03-17', '1997-02-24', 2, 38.8199997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10449, 'BLONP', 3, '1997-02-18', '1997-03-18', '1997-02-27', 2, 53.2999992, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10450, 'VICTE', 8, '1997-02-19', '1997-03-19', '1997-03-11', 2, 7.23000002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10451, 'QUICK', 4, '1997-02-19', '1997-03-05', '1997-03-12', 3, 189.089996, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10452, 'SAVEA', 8, '1997-02-20', '1997-03-20', '1997-02-26', 1, 140.259995, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10453, 'AROUT', 1, '1997-02-21', '1997-03-21', '1997-02-26', 2, 25.3600006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10454, 'LAMAI', 4, '1997-02-21', '1997-03-21', '1997-02-25', 3, 2.74000001, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10455, 'WARTH', 8, '1997-02-24', '1997-04-07', '1997-03-03', 2, 180.449997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10456, 'KOENE', 8, '1997-02-25', '1997-04-08', '1997-02-28', 2, 8.11999989, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10457, 'KOENE', 2, '1997-02-25', '1997-03-25', '1997-03-03', 1, 11.5699997, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10458, 'SUPRD', 7, '1997-02-26', '1997-03-26', '1997-03-04', 3, 147.059998, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10459, 'VICTE', 4, '1997-02-27', '1997-03-27', '1997-02-28', 2, 25.0900002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10460, 'FOLKO', 8, '1997-02-28', '1997-03-28', '1997-03-03', 1, 16.2700005, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10461, 'LILAS', 1, '1997-02-28', '1997-03-28', '1997-03-05', 3, 148.610001, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10462, 'CONSH', 2, '1997-03-03', '1997-03-31', '1997-03-18', 1, 6.17000008, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (10463, 'SUPRD', 5, '1997-03-04', '1997-04-01', '1997-03-06', 3, 14.7799997, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10464, 'FURIB', 4, '1997-03-04', '1997-04-01', '1997-03-14', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10465, 'VAFFE', 1, '1997-03-05', '1997-04-02', '1997-03-14', 3, 145.039993, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10466, 'COMMI', 4, '1997-03-06', '1997-04-03', '1997-03-13', 1, 11.9300003, 'ComÃ©rcio Mineiro', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (10467, 'MAGAA', 8, '1997-03-06', '1997-04-03', '1997-03-11', 2, 4.92999983, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10468, 'KOENE', 3, '1997-03-07', '1997-04-04', '1997-03-12', 3, 44.1199989, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10469, 'WHITC', 1, '1997-03-10', '1997-04-07', '1997-03-14', 1, 60.1800003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10470, 'BONAP', 4, '1997-03-11', '1997-04-08', '1997-03-14', 2, 64.5599976, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10471, 'BSBEV', 2, '1997-03-11', '1997-04-08', '1997-03-18', 3, 45.5900002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10472, 'SEVES', 8, '1997-03-12', '1997-04-09', '1997-03-19', 1, 4.19999981, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10473, 'ISLAT', 1, '1997-03-13', '1997-03-27', '1997-03-21', 3, 16.3700008, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10474, 'PERIC', 5, '1997-03-13', '1997-04-10', '1997-03-21', 2, 83.4899979, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10475, 'SUPRD', 9, '1997-03-14', '1997-04-11', '1997-04-04', 1, 68.5199966, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10476, 'HILAA', 8, '1997-03-17', '1997-04-14', '1997-03-24', 3, 4.40999985, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10477, 'PRINI', 5, '1997-03-17', '1997-04-14', '1997-03-25', 2, 13.0200005, 'Princesa Isabel Vinhos', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (10478, 'VICTE', 2, '1997-03-18', '1997-04-01', '1997-03-26', 3, 4.80999994, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10479, 'RATTC', 3, '1997-03-19', '1997-04-16', '1997-03-21', 3, 708.950012, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10480, 'FOLIG', 6, '1997-03-20', '1997-04-17', '1997-03-24', 2, 1.35000002, 'Folies gourmandes', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (10481, 'RICAR', 8, '1997-03-20', '1997-04-17', '1997-03-25', 2, 64.3300018, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10482, 'LAZYK', 1, '1997-03-21', '1997-04-18', '1997-04-10', 3, 7.48000002, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (10483, 'WHITC', 7, '1997-03-24', '1997-04-21', '1997-04-25', 2, 15.2799997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10484, 'BSBEV', 3, '1997-03-24', '1997-04-21', '1997-04-01', 3, 6.88000011, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10485, 'LINOD', 4, '1997-03-25', '1997-04-08', '1997-03-31', 2, 64.4499969, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10486, 'HILAA', 1, '1997-03-26', '1997-04-23', '1997-04-02', 2, 30.5300007, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10487, 'QUEEN', 2, '1997-03-26', '1997-04-23', '1997-03-28', 2, 71.0699997, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10488, 'FRANK', 8, '1997-03-27', '1997-04-24', '1997-04-02', 2, 4.92999983, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10489, 'PICCO', 6, '1997-03-28', '1997-04-25', '1997-04-09', 2, 5.28999996, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10490, 'HILAA', 7, '1997-03-31', '1997-04-28', '1997-04-03', 2, 210.190002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10491, 'FURIB', 8, '1997-03-31', '1997-04-28', '1997-04-08', 3, 16.9599991, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10492, 'BOTTM', 3, '1997-04-01', '1997-04-29', '1997-04-11', 1, 62.8899994, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10493, 'LAMAI', 4, '1997-04-02', '1997-04-30', '1997-04-10', 3, 10.6400003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10494, 'COMMI', 4, '1997-04-02', '1997-04-30', '1997-04-09', 2, 65.9899979, 'ComÃ©rcio Mineiro', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (10495, 'LAUGB', 3, '1997-04-03', '1997-05-01', '1997-04-11', 3, 4.6500001, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (10496, 'TRADH', 7, '1997-04-04', '1997-05-02', '1997-04-07', 2, 46.7700005, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10497, 'LEHMS', 7, '1997-04-04', '1997-05-02', '1997-04-07', 1, 36.2099991, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10498, 'HILAA', 8, '1997-04-07', '1997-05-05', '1997-04-11', 2, 29.75, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10499, 'LILAS', 4, '1997-04-08', '1997-05-06', '1997-04-16', 2, 102.019997, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10500, 'LAMAI', 6, '1997-04-09', '1997-05-07', '1997-04-17', 1, 42.6800003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10501, 'BLAUS', 9, '1997-04-09', '1997-05-07', '1997-04-16', 3, 8.85000038, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10502, 'PERIC', 2, '1997-04-10', '1997-05-08', '1997-04-29', 1, 69.3199997, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10503, 'HUNGO', 6, '1997-04-11', '1997-05-09', '1997-04-16', 2, 16.7399998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10504, 'WHITC', 4, '1997-04-11', '1997-05-09', '1997-04-18', 3, 59.1300011, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10505, 'MEREP', 3, '1997-04-14', '1997-05-12', '1997-04-21', 3, 7.13000011, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10506, 'KOENE', 9, '1997-04-15', '1997-05-13', '1997-05-02', 2, 21.1900005, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10507, 'ANTON', 7, '1997-04-15', '1997-05-13', '1997-04-22', 1, 47.4500008, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10508, 'OTTIK', 1, '1997-04-16', '1997-05-14', '1997-05-13', 2, 4.98999977, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10509, 'BLAUS', 4, '1997-04-17', '1997-05-15', '1997-04-29', 1, 0.150000006, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10510, 'SAVEA', 6, '1997-04-18', '1997-05-16', '1997-04-28', 3, 367.630005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10511, 'BONAP', 4, '1997-04-18', '1997-05-16', '1997-04-21', 3, 350.640015, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10512, 'FAMIA', 7, '1997-04-21', '1997-05-19', '1997-04-24', 2, 3.52999997, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10513, 'WANDK', 7, '1997-04-22', '1997-06-03', '1997-04-28', 1, 105.650002, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10514, 'ERNSH', 3, '1997-04-22', '1997-05-20', '1997-05-16', 2, 789.950012, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10515, 'QUICK', 2, '1997-04-23', '1997-05-07', '1997-05-23', 1, 204.470001, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10516, 'HUNGO', 2, '1997-04-24', '1997-05-22', '1997-05-01', 3, 62.7799988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10517, 'NORTS', 3, '1997-04-24', '1997-05-22', '1997-04-29', 3, 32.0699997, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (10518, 'TORTU', 4, '1997-04-25', '1997-05-09', '1997-05-05', 2, 218.149994, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10519, 'CHOPS', 6, '1997-04-28', '1997-05-26', '1997-05-01', 3, 91.7600021, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10520, 'SANTG', 7, '1997-04-29', '1997-05-27', '1997-05-01', 1, 13.3699999, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (10521, 'CACTU', 8, '1997-04-29', '1997-05-27', '1997-05-02', 2, 17.2199993, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10522, 'LEHMS', 4, '1997-04-30', '1997-05-28', '1997-05-06', 1, 45.3300018, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10523, 'SEVES', 7, '1997-05-01', '1997-05-29', '1997-05-30', 2, 77.6299973, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10524, 'BERGS', 1, '1997-05-01', '1997-05-29', '1997-05-07', 2, 244.789993, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10525, 'BONAP', 1, '1997-05-02', '1997-05-30', '1997-05-23', 2, 11.0600004, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10526, 'WARTH', 4, '1997-05-05', '1997-06-02', '1997-05-15', 2, 58.5900002, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10527, 'QUICK', 7, '1997-05-05', '1997-06-02', '1997-05-07', 1, 41.9000015, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10528, 'GREAL', 6, '1997-05-06', '1997-05-20', '1997-05-09', 2, 3.3499999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10529, 'MAISD', 5, '1997-05-07', '1997-06-04', '1997-05-09', 2, 66.6900024, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10530, 'PICCO', 3, '1997-05-08', '1997-06-05', '1997-05-12', 2, 339.220001, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10531, 'OCEAN', 7, '1997-05-08', '1997-06-05', '1997-05-19', 1, 8.11999989, 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10532, 'EASTC', 7, '1997-05-09', '1997-06-06', '1997-05-12', 3, 74.4599991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (10533, 'FOLKO', 8, '1997-05-12', '1997-06-09', '1997-05-22', 1, 188.039993, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10534, 'LEHMS', 8, '1997-05-12', '1997-06-09', '1997-05-14', 2, 27.9400005, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10535, 'ANTON', 4, '1997-05-13', '1997-06-10', '1997-05-21', 1, 15.6400003, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10536, 'LEHMS', 3, '1997-05-14', '1997-06-11', '1997-06-06', 2, 58.8800011, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10537, 'RICSU', 1, '1997-05-14', '1997-05-28', '1997-05-19', 1, 78.8499985, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10538, 'BSBEV', 9, '1997-05-15', '1997-06-12', '1997-05-16', 3, 4.86999989, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10539, 'BSBEV', 6, '1997-05-16', '1997-06-13', '1997-05-23', 3, 12.3599997, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10540, 'QUICK', 3, '1997-05-19', '1997-06-16', '1997-06-13', 3, 1007.64001, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10541, 'HANAR', 2, '1997-05-19', '1997-06-16', '1997-05-29', 1, 68.6500015, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10542, 'KOENE', 1, '1997-05-20', '1997-06-17', '1997-05-26', 3, 10.9499998, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10543, 'LILAS', 8, '1997-05-21', '1997-06-18', '1997-05-23', 2, 48.1699982, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10544, 'LONEP', 4, '1997-05-21', '1997-06-18', '1997-05-30', 1, 24.9099998, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10545, 'LAZYK', 8, '1997-05-22', '1997-06-19', '1997-06-26', 2, 11.9200001, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (10546, 'VICTE', 1, '1997-05-23', '1997-06-20', '1997-05-27', 3, 194.720001, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10547, 'SEVES', 3, '1997-05-23', '1997-06-20', '1997-06-02', 2, 178.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10548, 'TOMSP', 3, '1997-05-26', '1997-06-23', '1997-06-02', 2, 1.42999995, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10549, 'QUICK', 5, '1997-05-27', '1997-06-10', '1997-05-30', 1, 171.240005, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10550, 'GODOS', 7, '1997-05-28', '1997-06-25', '1997-06-06', 3, 4.32000017, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10551, 'FURIB', 4, '1997-05-28', '1997-07-09', '1997-06-06', 3, 72.9499969, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10552, 'HILAA', 2, '1997-05-29', '1997-06-26', '1997-06-05', 1, 83.2200012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10553, 'WARTH', 2, '1997-05-30', '1997-06-27', '1997-06-03', 2, 149.490005, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10554, 'OTTIK', 4, '1997-05-30', '1997-06-27', '1997-06-05', 3, 120.970001, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10555, 'SAVEA', 6, '1997-06-02', '1997-06-30', '1997-06-04', 3, 252.490005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10556, 'SIMOB', 2, '1997-06-03', '1997-07-15', '1997-06-13', 1, 9.80000019, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10557, 'LEHMS', 9, '1997-06-03', '1997-06-17', '1997-06-06', 2, 96.7200012, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10558, 'AROUT', 1, '1997-06-04', '1997-07-02', '1997-06-10', 2, 72.9700012, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10559, 'BLONP', 6, '1997-06-05', '1997-07-03', '1997-06-13', 1, 8.05000019, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10560, 'FRANK', 8, '1997-06-06', '1997-07-04', '1997-06-09', 1, 36.6500015, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10561, 'FOLKO', 2, '1997-06-06', '1997-07-04', '1997-06-09', 2, 242.210007, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10562, 'REGGC', 1, '1997-06-09', '1997-07-07', '1997-06-12', 1, 22.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10563, 'RICAR', 2, '1997-06-10', '1997-07-22', '1997-06-24', 2, 60.4300003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10564, 'RATTC', 4, '1997-06-10', '1997-07-08', '1997-06-16', 3, 13.75, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10565, 'MEREP', 8, '1997-06-11', '1997-07-09', '1997-06-18', 2, 7.1500001, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10566, 'BLONP', 9, '1997-06-12', '1997-07-10', '1997-06-18', 1, 88.4000015, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10567, 'HUNGO', 1, '1997-06-12', '1997-07-10', '1997-06-17', 1, 33.9700012, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10568, 'GALED', 3, '1997-06-13', '1997-07-11', '1997-07-09', 3, 6.53999996, 'GalerÃ­a del gastronÃ³mo', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (10569, 'RATTC', 5, '1997-06-16', '1997-07-14', '1997-07-11', 1, 58.9799995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10570, 'MEREP', 3, '1997-06-17', '1997-07-15', '1997-06-19', 3, 188.990005, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10571, 'ERNSH', 8, '1997-06-17', '1997-07-29', '1997-07-04', 3, 26.0599995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10572, 'BERGS', 3, '1997-06-18', '1997-07-16', '1997-06-25', 2, 116.43, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10573, 'ANTON', 7, '1997-06-19', '1997-07-17', '1997-06-20', 3, 84.8399963, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10574, 'TRAIH', 4, '1997-06-19', '1997-07-17', '1997-06-30', 2, 37.5999985, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (10575, 'MORGK', 5, '1997-06-20', '1997-07-04', '1997-06-30', 1, 127.339996, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10576, 'TORTU', 3, '1997-06-23', '1997-07-07', '1997-06-30', 3, 18.5599995, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10577, 'TRAIH', 9, '1997-06-23', '1997-08-04', '1997-06-30', 2, 25.4099998, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (10578, 'BSBEV', 4, '1997-06-24', '1997-07-22', '1997-07-25', 3, 29.6000004, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10579, 'LETSS', 1, '1997-06-25', '1997-07-23', '1997-07-04', 2, 13.7299995, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (10580, 'OTTIK', 4, '1997-06-26', '1997-07-24', '1997-07-01', 3, 75.8899994, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10581, 'FAMIA', 3, '1997-06-26', '1997-07-24', '1997-07-02', 1, 3.00999999, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10582, 'BLAUS', 3, '1997-06-27', '1997-07-25', '1997-07-14', 2, 27.7099991, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10583, 'WARTH', 2, '1997-06-30', '1997-07-28', '1997-07-04', 2, 7.28000021, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10584, 'BLONP', 4, '1997-06-30', '1997-07-28', '1997-07-04', 1, 59.1399994, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10585, 'WELLI', 7, '1997-07-01', '1997-07-29', '1997-07-10', 1, 13.4099998, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10586, 'REGGC', 9, '1997-07-02', '1997-07-30', '1997-07-09', 1, 0.479999989, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10587, 'QUEDE', 1, '1997-07-02', '1997-07-30', '1997-07-09', 1, 62.5200005, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10588, 'QUICK', 2, '1997-07-03', '1997-07-31', '1997-07-10', 3, 194.669998, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10589, 'GREAL', 8, '1997-07-04', '1997-08-01', '1997-07-14', 2, 4.42000008, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10590, 'MEREP', 4, '1997-07-07', '1997-08-04', '1997-07-14', 3, 44.7700005, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10591, 'VAFFE', 1, '1997-07-07', '1997-07-21', '1997-07-16', 1, 55.9199982, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10592, 'LEHMS', 3, '1997-07-08', '1997-08-05', '1997-07-16', 1, 32.0999985, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10593, 'LEHMS', 7, '1997-07-09', '1997-08-06', '1997-08-13', 2, 174.199997, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10594, 'OLDWO', 3, '1997-07-09', '1997-08-06', '1997-07-16', 2, 5.23999977, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10595, 'ERNSH', 2, '1997-07-10', '1997-08-07', '1997-07-14', 1, 96.7799988, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10596, 'WHITC', 8, '1997-07-11', '1997-08-08', '1997-08-12', 1, 16.3400002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10597, 'PICCO', 7, '1997-07-11', '1997-08-08', '1997-07-18', 3, 35.1199989, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10598, 'RATTC', 1, '1997-07-14', '1997-08-11', '1997-07-18', 3, 44.4199982, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10599, 'BSBEV', 6, '1997-07-15', '1997-08-26', '1997-07-21', 3, 29.9799995, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10600, 'HUNGC', 4, '1997-07-16', '1997-08-13', '1997-07-21', 1, 45.1300011, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (10601, 'HILAA', 7, '1997-07-16', '1997-08-27', '1997-07-22', 1, 58.2999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10602, 'VAFFE', 8, '1997-07-17', '1997-08-14', '1997-07-22', 2, 2.92000008, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10603, 'SAVEA', 8, '1997-07-18', '1997-08-15', '1997-08-08', 2, 48.7700005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10604, 'FURIB', 1, '1997-07-18', '1997-08-15', '1997-07-29', 1, 7.46000004, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10605, 'MEREP', 1, '1997-07-21', '1997-08-18', '1997-07-29', 2, 379.130005, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10606, 'TRADH', 4, '1997-07-22', '1997-08-19', '1997-07-31', 3, 79.4000015, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10607, 'SAVEA', 5, '1997-07-22', '1997-08-19', '1997-07-25', 1, 200.240005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10608, 'TOMSP', 4, '1997-07-23', '1997-08-20', '1997-08-01', 2, 27.7900009, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10609, 'DUMON', 7, '1997-07-24', '1997-08-21', '1997-07-30', 2, 1.85000002, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10610, 'LAMAI', 8, '1997-07-25', '1997-08-22', '1997-08-06', 1, 26.7800007, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10611, 'WOLZA', 6, '1997-07-25', '1997-08-22', '1997-08-01', 2, 80.6500015, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10612, 'SAVEA', 1, '1997-07-28', '1997-08-25', '1997-08-01', 2, 544.080017, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10613, 'HILAA', 4, '1997-07-29', '1997-08-26', '1997-08-01', 2, 8.10999966, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10614, 'BLAUS', 8, '1997-07-29', '1997-08-26', '1997-08-01', 3, 1.92999995, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10615, 'WILMK', 2, '1997-07-30', '1997-08-27', '1997-08-06', 3, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10616, 'GREAL', 1, '1997-07-31', '1997-08-28', '1997-08-05', 2, 116.529999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10617, 'GREAL', 4, '1997-07-31', '1997-08-28', '1997-08-04', 2, 18.5300007, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10618, 'MEREP', 1, '1997-08-01', '1997-09-12', '1997-08-08', 1, 154.679993, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10619, 'MEREP', 3, '1997-08-04', '1997-09-01', '1997-08-07', 3, 91.0500031, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10620, 'LAUGB', 2, '1997-08-05', '1997-09-02', '1997-08-14', 3, 0.939999998, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (10621, 'ISLAT', 4, '1997-08-05', '1997-09-02', '1997-08-11', 2, 23.7299995, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10622, 'RICAR', 4, '1997-08-06', '1997-09-03', '1997-08-11', 3, 50.9700012, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10623, 'FRANK', 8, '1997-08-07', '1997-09-04', '1997-08-12', 2, 97.1800003, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10624, 'THECR', 4, '1997-08-07', '1997-09-04', '1997-08-19', 2, 94.8000031, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (10625, 'ANATR', 3, '1997-08-08', '1997-09-05', '1997-08-14', 1, 43.9000015, 'Ana Trujillo Emparedados y helados', 'Avda. de la ConstituciÃ³n 2222', 'MÃ©xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10626, 'BERGS', 1, '1997-08-11', '1997-09-08', '1997-08-20', 2, 138.690002, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10627, 'SAVEA', 8, '1997-08-11', '1997-09-22', '1997-08-21', 3, 107.459999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10628, 'BLONP', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 30.3600006, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10629, 'GODOS', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 85.4599991, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10630, 'KOENE', 1, '1997-08-13', '1997-09-10', '1997-08-19', 2, 32.3499985, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10631, 'LAMAI', 8, '1997-08-14', '1997-09-11', '1997-08-15', 1, 0.870000005, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10632, 'WANDK', 8, '1997-08-14', '1997-09-11', '1997-08-19', 1, 41.3800011, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10633, 'ERNSH', 7, '1997-08-15', '1997-09-12', '1997-08-18', 3, 477.899994, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10634, 'FOLIG', 4, '1997-08-15', '1997-09-12', '1997-08-21', 3, 487.380005, 'Folies gourmandes', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (10635, 'MAGAA', 8, '1997-08-18', '1997-09-15', '1997-08-21', 3, 47.4599991, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10636, 'WARTH', 4, '1997-08-19', '1997-09-16', '1997-08-26', 1, 1.14999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10637, 'QUEEN', 6, '1997-08-19', '1997-09-16', '1997-08-26', 1, 201.289993, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10638, 'LINOD', 3, '1997-08-20', '1997-09-17', '1997-09-01', 1, 158.440002, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10639, 'SANTG', 7, '1997-08-20', '1997-09-17', '1997-08-27', 3, 38.6399994, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (10640, 'WANDK', 4, '1997-08-21', '1997-09-18', '1997-08-28', 1, 23.5499992, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10641, 'HILAA', 4, '1997-08-22', '1997-09-19', '1997-08-26', 2, 179.610001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10642, 'SIMOB', 7, '1997-08-22', '1997-09-19', '1997-09-05', 3, 41.8899994, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10643, 'ALFKI', 6, '1997-08-25', '1997-09-22', '1997-09-02', 1, 29.4599991, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10644, 'WELLI', 3, '1997-08-25', '1997-09-22', '1997-09-01', 2, 0.140000001, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10645, 'HANAR', 4, '1997-08-26', '1997-09-23', '1997-09-02', 1, 12.4099998, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10646, 'HUNGO', 9, '1997-08-27', '1997-10-08', '1997-09-03', 3, 142.330002, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10647, 'QUEDE', 4, '1997-08-27', '1997-09-10', '1997-09-03', 2, 45.5400009, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10648, 'RICAR', 5, '1997-08-28', '1997-10-09', '1997-09-09', 2, 14.25, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10649, 'MAISD', 5, '1997-08-28', '1997-09-25', '1997-08-29', 3, 6.19999981, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10650, 'FAMIA', 5, '1997-08-29', '1997-09-26', '1997-09-03', 3, 176.809998, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10651, 'WANDK', 8, '1997-09-01', '1997-09-29', '1997-09-11', 2, 20.6000004, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10652, 'GOURL', 4, '1997-09-01', '1997-09-29', '1997-09-08', 2, 7.13999987, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10653, 'FRANK', 1, '1997-09-02', '1997-09-30', '1997-09-19', 1, 93.25, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10654, 'BERGS', 5, '1997-09-02', '1997-09-30', '1997-09-11', 1, 55.2599983, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10655, 'REGGC', 1, '1997-09-03', '1997-10-01', '1997-09-11', 2, 4.40999985, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10656, 'GREAL', 6, '1997-09-04', '1997-10-02', '1997-09-10', 1, 57.1500015, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10657, 'SAVEA', 2, '1997-09-04', '1997-10-02', '1997-09-15', 2, 352.690002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10658, 'QUICK', 4, '1997-09-05', '1997-10-03', '1997-09-08', 1, 364.149994, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10659, 'QUEEN', 7, '1997-09-05', '1997-10-03', '1997-09-10', 2, 105.809998, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10660, 'HUNGC', 8, '1997-09-08', '1997-10-06', '1997-10-15', 1, 111.290001, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (10661, 'HUNGO', 7, '1997-09-09', '1997-10-07', '1997-09-15', 3, 17.5499992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10662, 'LONEP', 3, '1997-09-09', '1997-10-07', '1997-09-18', 2, 1.27999997, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10663, 'BONAP', 2, '1997-09-10', '1997-09-24', '1997-10-03', 2, 113.150002, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10664, 'FURIB', 1, '1997-09-10', '1997-10-08', '1997-09-19', 3, 1.26999998, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10665, 'LONEP', 1, '1997-09-11', '1997-10-09', '1997-09-17', 2, 26.3099995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10666, 'RICSU', 7, '1997-09-12', '1997-10-10', '1997-09-22', 2, 232.419998, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10667, 'ERNSH', 7, '1997-09-12', '1997-10-10', '1997-09-19', 1, 78.0899963, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10668, 'WANDK', 1, '1997-09-15', '1997-10-13', '1997-09-23', 2, 47.2200012, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (10669, 'SIMOB', 2, '1997-09-15', '1997-10-13', '1997-09-22', 1, 24.3899994, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10670, 'FRANK', 4, '1997-09-16', '1997-10-14', '1997-09-18', 1, 203.479996, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10671, 'FRANR', 1, '1997-09-17', '1997-10-15', '1997-09-24', 1, 30.3400002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10672, 'BERGS', 9, '1997-09-17', '1997-10-01', '1997-09-26', 2, 95.75, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10673, 'WILMK', 2, '1997-09-18', '1997-10-16', '1997-09-19', 1, 22.7600002, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10674, 'ISLAT', 4, '1997-09-18', '1997-10-16', '1997-09-30', 2, 0.899999976, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10675, 'FRANK', 5, '1997-09-19', '1997-10-17', '1997-09-23', 2, 31.8500004, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10676, 'TORTU', 2, '1997-09-22', '1997-10-20', '1997-09-29', 2, 2.00999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10677, 'ANTON', 1, '1997-09-22', '1997-10-20', '1997-09-26', 3, 4.03000021, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10678, 'SAVEA', 7, '1997-09-23', '1997-10-21', '1997-10-16', 3, 388.980011, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10679, 'BLONP', 8, '1997-09-23', '1997-10-21', '1997-09-30', 3, 27.9400005, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10680, 'OLDWO', 1, '1997-09-24', '1997-10-22', '1997-09-26', 1, 26.6100006, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10681, 'GREAL', 3, '1997-09-25', '1997-10-23', '1997-09-30', 3, 76.1299973, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10682, 'ANTON', 3, '1997-09-25', '1997-10-23', '1997-10-01', 2, 36.1300011, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10683, 'DUMON', 2, '1997-09-26', '1997-10-24', '1997-10-01', 1, 4.4000001, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10684, 'OTTIK', 3, '1997-09-26', '1997-10-24', '1997-09-30', 1, 145.630005, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10685, 'GOURL', 4, '1997-09-29', '1997-10-13', '1997-10-03', 2, 33.75, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10686, 'PICCO', 2, '1997-09-30', '1997-10-28', '1997-10-08', 1, 96.5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10687, 'HUNGO', 9, '1997-09-30', '1997-10-28', '1997-10-30', 2, 296.429993, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10688, 'VAFFE', 4, '1997-10-01', '1997-10-15', '1997-10-07', 2, 299.089996, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10689, 'BERGS', 1, '1997-10-01', '1997-10-29', '1997-10-07', 2, 13.4200001, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10690, 'HANAR', 1, '1997-10-02', '1997-10-30', '1997-10-03', 1, 15.8000002, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10691, 'QUICK', 2, '1997-10-03', '1997-11-14', '1997-10-22', 2, 810.049988, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10692, 'ALFKI', 4, '1997-10-03', '1997-10-31', '1997-10-13', 2, 61.0200005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10693, 'WHITC', 3, '1997-10-06', '1997-10-20', '1997-10-10', 3, 139.339996, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10694, 'QUICK', 8, '1997-10-06', '1997-11-03', '1997-10-09', 3, 398.359985, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10695, 'WILMK', 7, '1997-10-07', '1997-11-18', '1997-10-14', 1, 16.7199993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10696, 'WHITC', 8, '1997-10-08', '1997-11-19', '1997-10-14', 3, 102.550003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10697, 'LINOD', 3, '1997-10-08', '1997-11-05', '1997-10-14', 1, 45.5200005, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10698, 'ERNSH', 4, '1997-10-09', '1997-11-06', '1997-10-17', 1, 272.470001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10699, 'MORGK', 3, '1997-10-09', '1997-11-06', '1997-10-13', 3, 0.579999983, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10700, 'SAVEA', 3, '1997-10-10', '1997-11-07', '1997-10-16', 1, 65.0999985, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10701, 'HUNGO', 6, '1997-10-13', '1997-10-27', '1997-10-15', 3, 220.309998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10702, 'ALFKI', 4, '1997-10-13', '1997-11-24', '1997-10-21', 1, 23.9400005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10703, 'FOLKO', 6, '1997-10-14', '1997-11-11', '1997-10-20', 2, 152.300003, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10704, 'QUEEN', 6, '1997-10-14', '1997-11-11', '1997-11-07', 1, 4.78000021, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10705, 'HILAA', 9, '1997-10-15', '1997-11-12', '1997-11-18', 2, 3.51999998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10706, 'OLDWO', 8, '1997-10-16', '1997-11-13', '1997-10-21', 3, 135.630005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10707, 'AROUT', 4, '1997-10-16', '1997-10-30', '1997-10-23', 3, 21.7399998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10708, 'THEBI', 6, '1997-10-17', '1997-11-28', '1997-11-05', 2, 2.96000004, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (10709, 'GOURL', 1, '1997-10-17', '1997-11-14', '1997-11-20', 3, 210.800003, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10710, 'FRANS', 1, '1997-10-20', '1997-11-17', '1997-10-23', 1, 4.98000002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (10711, 'SAVEA', 5, '1997-10-21', '1997-12-02', '1997-10-29', 2, 52.4099998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10712, 'HUNGO', 3, '1997-10-21', '1997-11-18', '1997-10-31', 1, 89.9300003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10713, 'SAVEA', 1, '1997-10-22', '1997-11-19', '1997-10-24', 1, 167.050003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10714, 'SAVEA', 5, '1997-10-22', '1997-11-19', '1997-10-27', 3, 24.4899998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10715, 'BONAP', 3, '1997-10-23', '1997-11-06', '1997-10-29', 1, 63.2000008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10716, 'RANCH', 4, '1997-10-24', '1997-11-21', '1997-10-27', 2, 22.5699997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10717, 'FRANK', 1, '1997-10-24', '1997-11-21', '1997-10-29', 2, 59.25, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10718, 'KOENE', 1, '1997-10-27', '1997-11-24', '1997-10-29', 3, 170.880005, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10719, 'LETSS', 8, '1997-10-27', '1997-11-24', '1997-11-05', 2, 51.4399986, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (10720, 'QUEDE', 8, '1997-10-28', '1997-11-11', '1997-11-05', 2, 9.52999973, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10721, 'QUICK', 5, '1997-10-29', '1997-11-26', '1997-10-31', 3, 48.9199982, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10722, 'SAVEA', 8, '1997-10-29', '1997-12-10', '1997-11-04', 1, 74.5800018, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10723, 'WHITC', 3, '1997-10-30', '1997-11-27', '1997-11-25', 1, 21.7199993, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10724, 'MEREP', 8, '1997-10-30', '1997-12-11', '1997-11-05', 2, 57.75, 'MÃ¨re Paillarde', '43 rue St. Laurent', 'MontrÃ©al', 'QuÃ©bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (10725, 'FAMIA', 4, '1997-10-31', '1997-11-28', '1997-11-05', 3, 10.8299999, 'Familia Arquibaldo', 'Rua OrÃ³s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (10726, 'EASTC', 4, '1997-11-03', '1997-11-17', '1997-12-05', 1, 16.5599995, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (10727, 'REGGC', 2, '1997-11-03', '1997-12-01', '1997-12-05', 1, 89.9000015, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10728, 'QUEEN', 4, '1997-11-04', '1997-12-02', '1997-11-11', 2, 58.3300018, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10729, 'LINOD', 8, '1997-11-04', '1997-12-16', '1997-11-14', 3, 141.059998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10730, 'BONAP', 5, '1997-11-05', '1997-12-03', '1997-11-14', 1, 20.1200008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10731, 'CHOPS', 7, '1997-11-06', '1997-12-04', '1997-11-14', 1, 96.6500015, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10732, 'BONAP', 3, '1997-11-06', '1997-12-04', '1997-11-07', 1, 16.9699993, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10733, 'BERGS', 1, '1997-11-07', '1997-12-05', '1997-11-10', 3, 110.110001, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10734, 'GOURL', 2, '1997-11-07', '1997-12-05', '1997-11-12', 3, 1.63, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10735, 'LETSS', 6, '1997-11-10', '1997-12-08', '1997-11-21', 2, 45.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (10736, 'HUNGO', 9, '1997-11-11', '1997-12-09', '1997-11-21', 2, 44.0999985, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10737, 'VINET', 2, '1997-11-11', '1997-12-09', '1997-11-18', 2, 7.78999996, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10738, 'SPECD', 2, '1997-11-12', '1997-12-10', '1997-11-18', 1, 2.91000009, 'SpÃ©cialitÃ©s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (10739, 'VINET', 3, '1997-11-12', '1997-12-10', '1997-11-17', 3, 11.0799999, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (10740, 'WHITC', 4, '1997-11-13', '1997-12-11', '1997-11-25', 2, 81.8799973, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10741, 'AROUT', 4, '1997-11-14', '1997-11-28', '1997-11-18', 3, 10.96, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10742, 'BOTTM', 3, '1997-11-14', '1997-12-12', '1997-11-18', 3, 243.729996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10743, 'AROUT', 1, '1997-11-17', '1997-12-15', '1997-11-21', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10744, 'VAFFE', 6, '1997-11-17', '1997-12-15', '1997-11-24', 1, 69.1900024, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10745, 'QUICK', 9, '1997-11-18', '1997-12-16', '1997-11-27', 1, 3.51999998, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10746, 'CHOPS', 1, '1997-11-19', '1997-12-17', '1997-11-21', 3, 31.4300003, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10747, 'PICCO', 6, '1997-11-19', '1997-12-17', '1997-11-26', 1, 117.330002, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10748, 'SAVEA', 3, '1997-11-20', '1997-12-18', '1997-11-28', 1, 232.550003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10749, 'ISLAT', 4, '1997-11-20', '1997-12-18', '1997-12-19', 2, 61.5299988, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10750, 'WARTH', 9, '1997-11-21', '1997-12-19', '1997-11-24', 1, 79.3000031, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10751, 'RICSU', 3, '1997-11-24', '1997-12-22', '1997-12-03', 3, 130.789993, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10752, 'NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1.38999999, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (10753, 'FRANS', 3, '1997-11-25', '1997-12-23', '1997-11-27', 1, 7.69999981, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (10754, 'MAGAA', 6, '1997-11-25', '1997-12-23', '1997-11-27', 3, 2.38000011, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10755, 'BONAP', 4, '1997-11-26', '1997-12-24', '1997-11-28', 2, 16.7099991, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10756, 'SPLIR', 8, '1997-11-27', '1997-12-25', '1997-12-02', 2, 73.2099991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10757, 'SAVEA', 6, '1997-11-27', '1997-12-25', '1997-12-15', 1, 8.18999958, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10758, 'RICSU', 3, '1997-11-28', '1997-12-26', '1997-12-04', 3, 138.169998, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10759, 'ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la ConstituciÃ³n 2222', 'MÃ©xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10760, 'MAISD', 4, '1997-12-01', '1997-12-29', '1997-12-10', 1, 155.639999, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10761, 'RATTC', 5, '1997-12-02', '1997-12-30', '1997-12-08', 2, 18.6599998, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10762, 'FOLKO', 3, '1997-12-02', '1997-12-30', '1997-12-09', 1, 328.73999, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10763, 'FOLIG', 3, '1997-12-03', '1997-12-31', '1997-12-08', 3, 37.3499985, 'Folies gourmandes', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (10764, 'ERNSH', 6, '1997-12-03', '1997-12-31', '1997-12-08', 3, 145.449997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10765, 'QUICK', 3, '1997-12-04', '1998-01-01', '1997-12-09', 3, 42.7400017, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10766, 'OTTIK', 4, '1997-12-05', '1998-01-02', '1997-12-09', 1, 157.550003, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10767, 'SUPRD', 4, '1997-12-05', '1998-01-02', '1997-12-15', 3, 1.59000003, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10768, 'AROUT', 3, '1997-12-08', '1998-01-05', '1997-12-15', 2, 146.320007, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10769, 'VAFFE', 3, '1997-12-08', '1998-01-05', '1997-12-12', 1, 65.0599976, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10770, 'HANAR', 8, '1997-12-09', '1998-01-06', '1997-12-17', 3, 5.32000017, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10771, 'ERNSH', 9, '1997-12-10', '1998-01-07', '1998-01-02', 2, 11.1899996, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10772, 'LEHMS', 3, '1997-12-10', '1998-01-07', '1997-12-19', 2, 91.2799988, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10773, 'ERNSH', 1, '1997-12-11', '1998-01-08', '1997-12-16', 3, 96.4300003, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10774, 'FOLKO', 4, '1997-12-11', '1997-12-25', '1997-12-12', 1, 48.2000008, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10775, 'THECR', 7, '1997-12-12', '1998-01-09', '1997-12-26', 1, 20.25, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (10776, 'ERNSH', 1, '1997-12-15', '1998-01-12', '1997-12-18', 3, 351.529999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10777, 'GOURL', 7, '1997-12-15', '1997-12-29', '1998-01-21', 2, 3.00999999, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10778, 'BERGS', 3, '1997-12-16', '1998-01-13', '1997-12-24', 1, 6.78999996, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10779, 'MORGK', 3, '1997-12-16', '1998-01-13', '1998-01-14', 2, 58.1300011, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10780, 'LILAS', 2, '1997-12-16', '1997-12-30', '1997-12-25', 1, 42.1300011, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10781, 'WARTH', 2, '1997-12-17', '1998-01-14', '1997-12-19', 3, 73.1600037, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (10782, 'CACTU', 9, '1997-12-17', '1998-01-14', '1997-12-22', 3, 1.10000002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10783, 'HANAR', 4, '1997-12-18', '1998-01-15', '1997-12-19', 2, 124.980003, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10784, 'MAGAA', 4, '1997-12-18', '1998-01-15', '1997-12-22', 3, 70.0899963, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10785, 'GROSR', 1, '1997-12-18', '1998-01-15', '1997-12-24', 3, 1.50999999, 'GROSELLA-Restaurante', '5Âª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES (10786, 'QUEEN', 8, '1997-12-19', '1998-01-16', '1997-12-23', 1, 110.870003, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10787, 'LAMAI', 2, '1997-12-19', '1998-01-02', '1997-12-26', 1, 249.929993, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10788, 'QUICK', 1, '1997-12-22', '1998-01-19', '1998-01-19', 2, 42.7000008, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10789, 'FOLIG', 1, '1997-12-22', '1998-01-19', '1997-12-31', 2, 100.599998, 'Folies gourmandes', '184, chaussÃ©e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (10790, 'GOURL', 6, '1997-12-22', '1998-01-19', '1997-12-26', 1, 28.2299995, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10791, 'FRANK', 6, '1997-12-23', '1998-01-20', '1998-01-01', 2, 16.8500004, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10792, 'WOLZA', 1, '1997-12-23', '1998-01-20', '1997-12-31', 3, 23.7900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10793, 'AROUT', 3, '1997-12-24', '1998-01-21', '1998-01-08', 3, 4.51999998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10794, 'QUEDE', 6, '1997-12-24', '1998-01-21', '1998-01-02', 1, 21.4899998, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10795, 'ERNSH', 8, '1997-12-24', '1998-01-21', '1998-01-20', 2, 126.660004, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10796, 'HILAA', 3, '1997-12-25', '1998-01-22', '1998-01-14', 1, 26.5200005, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10797, 'DRACD', 7, '1997-12-25', '1998-01-22', '1998-01-05', 2, 33.3499985, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (10798, 'ISLAT', 2, '1997-12-26', '1998-01-23', '1998-01-05', 1, 2.32999992, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10799, 'KOENE', 9, '1997-12-26', '1998-02-06', '1998-01-05', 3, 30.7600002, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10800, 'SEVES', 1, '1997-12-26', '1998-01-23', '1998-01-05', 3, 137.440002, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10801, 'BOLID', 4, '1997-12-29', '1998-01-26', '1997-12-31', 2, 97.0899963, 'BÃ³lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (10802, 'SIMOB', 4, '1997-12-29', '1998-01-26', '1998-01-02', 2, 257.26001, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (10803, 'WELLI', 4, '1997-12-30', '1998-01-27', '1998-01-06', 1, 55.2299995, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10804, 'SEVES', 6, '1997-12-30', '1998-01-27', '1998-01-07', 2, 27.3299999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10805, 'THEBI', 2, '1997-12-30', '1998-01-27', '1998-01-09', 3, 237.339996, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (10806, 'VICTE', 3, '1997-12-31', '1998-01-28', '1998-01-05', 2, 22.1100006, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10807, 'FRANS', 4, '1997-12-31', '1998-01-28', '1998-01-30', 1, 1.36000001, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (10808, 'OLDWO', 2, '1998-01-01', '1998-01-29', '1998-01-09', 3, 45.5299988, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10809, 'WELLI', 7, '1998-01-01', '1998-01-29', '1998-01-07', 1, 4.86999989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10810, 'LAUGB', 2, '1998-01-01', '1998-01-29', '1998-01-07', 3, 4.32999992, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (10811, 'LINOD', 8, '1998-01-02', '1998-01-30', '1998-01-08', 1, 31.2199993, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10812, 'REGGC', 5, '1998-01-02', '1998-01-30', '1998-01-12', 1, 59.7799988, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10813, 'RICAR', 1, '1998-01-05', '1998-02-02', '1998-01-09', 1, 47.3800011, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10814, 'VICTE', 3, '1998-01-05', '1998-02-02', '1998-01-14', 3, 130.940002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10815, 'SAVEA', 2, '1998-01-05', '1998-02-02', '1998-01-14', 3, 14.6199999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10816, 'GREAL', 4, '1998-01-06', '1998-02-03', '1998-02-04', 2, 719.780029, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10817, 'KOENE', 3, '1998-01-06', '1998-01-20', '1998-01-13', 2, 306.070007, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10818, 'MAGAA', 7, '1998-01-07', '1998-02-04', '1998-01-12', 3, 65.4800034, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10819, 'CACTU', 2, '1998-01-07', '1998-02-04', '1998-01-16', 3, 19.7600002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10820, 'RATTC', 3, '1998-01-07', '1998-02-04', '1998-01-13', 2, 37.5200005, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10821, 'SPLIR', 1, '1998-01-08', '1998-02-05', '1998-01-15', 1, 36.6800003, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10822, 'TRAIH', 6, '1998-01-08', '1998-02-05', '1998-01-16', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (10823, 'LILAS', 5, '1998-01-09', '1998-02-06', '1998-01-13', 2, 163.970001, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10824, 'FOLKO', 8, '1998-01-09', '1998-02-06', '1998-01-30', 1, 1.23000002, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10825, 'DRACD', 1, '1998-01-09', '1998-02-06', '1998-01-14', 1, 79.25, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (10826, 'BLONP', 6, '1998-01-12', '1998-02-09', '1998-02-06', 1, 7.09000015, 'Blondel pÃ¨re et fils', '24, place KlÃ©ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (10827, 'BONAP', 1, '1998-01-12', '1998-01-26', '1998-02-06', 2, 63.5400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10828, 'RANCH', 9, '1998-01-13', '1998-01-27', '1998-02-04', 1, 90.8499985, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10829, 'ISLAT', 9, '1998-01-13', '1998-02-10', '1998-01-23', 1, 154.720001, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10830, 'TRADH', 4, '1998-01-13', '1998-02-24', '1998-01-21', 2, 81.8300018, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10831, 'SANTG', 3, '1998-01-14', '1998-02-11', '1998-01-23', 2, 72.1900024, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (10832, 'LAMAI', 2, '1998-01-14', '1998-02-11', '1998-01-19', 2, 43.2599983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10833, 'OTTIK', 6, '1998-01-15', '1998-02-12', '1998-01-23', 2, 71.4899979, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (10834, 'TRADH', 1, '1998-01-15', '1998-02-12', '1998-01-19', 3, 29.7800007, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10835, 'ALFKI', 1, '1998-01-15', '1998-02-12', '1998-01-21', 3, 69.5299988, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10836, 'ERNSH', 7, '1998-01-16', '1998-02-13', '1998-01-21', 1, 411.880005, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10837, 'BERGS', 9, '1998-01-16', '1998-02-13', '1998-01-23', 3, 13.3199997, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10838, 'LINOD', 3, '1998-01-19', '1998-02-16', '1998-01-23', 3, 59.2799988, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10839, 'TRADH', 3, '1998-01-19', '1998-02-16', '1998-01-22', 3, 35.4300003, 'TradiÃ§ao Hipermercados', 'Av. InÃªs de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (10840, 'LINOD', 4, '1998-01-19', '1998-03-02', '1998-02-16', 2, 2.71000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10841, 'SUPRD', 5, '1998-01-20', '1998-02-17', '1998-01-29', 2, 424.299988, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10842, 'TORTU', 1, '1998-01-20', '1998-02-17', '1998-01-29', 3, 54.4199982, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10843, 'VICTE', 4, '1998-01-21', '1998-02-18', '1998-01-26', 2, 9.26000023, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10844, 'PICCO', 8, '1998-01-21', '1998-02-18', '1998-01-26', 2, 25.2199993, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (10845, 'QUICK', 8, '1998-01-21', '1998-02-04', '1998-01-30', 1, 212.979996, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10846, 'SUPRD', 2, '1998-01-22', '1998-03-05', '1998-01-23', 3, 56.4599991, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10847, 'SAVEA', 4, '1998-01-22', '1998-02-05', '1998-02-10', 3, 487.570007, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10848, 'CONSH', 7, '1998-01-23', '1998-02-20', '1998-01-29', 2, 38.2400017, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (10849, 'KOENE', 9, '1998-01-23', '1998-02-20', '1998-01-30', 2, 0.560000002, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10850, 'VICTE', 1, '1998-01-23', '1998-03-06', '1998-01-30', 1, 49.1899986, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (10851, 'RICAR', 5, '1998-01-26', '1998-02-23', '1998-02-02', 1, 160.550003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10852, 'RATTC', 8, '1998-01-26', '1998-02-09', '1998-01-30', 1, 174.050003, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10853, 'BLAUS', 9, '1998-01-27', '1998-02-24', '1998-02-03', 2, 53.8300018, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10854, 'ERNSH', 3, '1998-01-27', '1998-02-24', '1998-02-05', 2, 100.220001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10855, 'OLDWO', 3, '1998-01-27', '1998-02-24', '1998-02-04', 1, 170.970001, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10856, 'ANTON', 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300003, 'Antonio Moreno TaquerÃ­a', 'Mataderos  2312', 'MÃ©xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (10857, 'BERGS', 8, '1998-01-28', '1998-02-25', '1998-02-06', 2, 188.850006, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10858, 'LACOR', 2, '1998-01-29', '1998-02-26', '1998-02-03', 1, 52.5099983, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (10859, 'FRANK', 1, '1998-01-29', '1998-02-26', '1998-02-02', 2, 76.0999985, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10860, 'FRANR', 3, '1998-01-29', '1998-02-26', '1998-02-04', 3, 19.2600002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10861, 'WHITC', 4, '1998-01-30', '1998-02-27', '1998-02-17', 2, 14.9300003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10862, 'LEHMS', 8, '1998-01-30', '1998-03-13', '1998-02-02', 2, 53.2299995, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10863, 'HILAA', 4, '1998-02-02', '1998-03-02', '1998-02-17', 2, 30.2600002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10864, 'AROUT', 4, '1998-02-02', '1998-03-02', '1998-02-09', 2, 3.03999996, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10865, 'QUICK', 2, '1998-02-02', '1998-02-16', '1998-02-12', 1, 348.140015, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10866, 'BERGS', 5, '1998-02-03', '1998-03-03', '1998-02-12', 1, 109.110001, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10867, 'LONEP', 6, '1998-02-03', '1998-03-17', '1998-02-11', 1, 1.92999995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10868, 'QUEEN', 7, '1998-02-04', '1998-03-04', '1998-02-23', 2, 191.270004, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10869, 'SEVES', 5, '1998-02-04', '1998-03-04', '1998-02-09', 1, 143.279999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (10870, 'WOLZA', 5, '1998-02-04', '1998-03-04', '1998-02-13', 3, 12.04, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10871, 'BONAP', 9, '1998-02-05', '1998-03-05', '1998-02-10', 2, 112.269997, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10872, 'GODOS', 5, '1998-02-05', '1998-03-05', '1998-02-09', 2, 175.320007, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10873, 'WILMK', 4, '1998-02-06', '1998-03-06', '1998-02-09', 1, 0.819999993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10874, 'GODOS', 5, '1998-02-06', '1998-03-06', '1998-02-11', 2, 19.5799999, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10875, 'BERGS', 4, '1998-02-06', '1998-03-06', '1998-03-03', 2, 32.3699989, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10876, 'BONAP', 7, '1998-02-09', '1998-03-09', '1998-02-12', 3, 60.4199982, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10877, 'RICAR', 1, '1998-02-09', '1998-03-09', '1998-02-19', 1, 38.0600014, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (10878, 'QUICK', 4, '1998-02-10', '1998-03-10', '1998-02-12', 1, 46.6899986, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10879, 'WILMK', 3, '1998-02-10', '1998-03-10', '1998-02-12', 3, 8.5, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10880, 'FOLKO', 7, '1998-02-10', '1998-03-24', '1998-02-18', 1, 88.0100021, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10881, 'CACTU', 4, '1998-02-11', '1998-03-11', '1998-02-18', 1, 2.83999991, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10882, 'SAVEA', 4, '1998-02-11', '1998-03-11', '1998-02-20', 3, 23.1000004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10883, 'LONEP', 8, '1998-02-12', '1998-03-12', '1998-02-20', 3, 0.529999971, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (10884, 'LETSS', 4, '1998-02-12', '1998-03-12', '1998-02-13', 2, 90.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (10885, 'SUPRD', 6, '1998-02-12', '1998-03-12', '1998-02-18', 3, 5.63999987, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10886, 'HANAR', 1, '1998-02-13', '1998-03-13', '1998-03-02', 1, 4.98999977, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10887, 'GALED', 8, '1998-02-13', '1998-03-13', '1998-02-16', 3, 1.25, 'GalerÃ­a del gastronÃ³mo', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (10888, 'GODOS', 1, '1998-02-16', '1998-03-16', '1998-02-23', 2, 51.8699989, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10889, 'RATTC', 9, '1998-02-16', '1998-03-16', '1998-02-23', 3, 280.609985, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10890, 'DUMON', 7, '1998-02-16', '1998-03-16', '1998-02-18', 1, 32.7599983, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10891, 'LEHMS', 7, '1998-02-17', '1998-03-17', '1998-02-19', 2, 20.3700008, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10892, 'MAISD', 4, '1998-02-17', '1998-03-17', '1998-02-19', 2, 120.269997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10893, 'KOENE', 9, '1998-02-18', '1998-03-18', '1998-02-20', 2, 77.7799988, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (10894, 'SAVEA', 1, '1998-02-18', '1998-03-18', '1998-02-20', 1, 116.129997, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10895, 'ERNSH', 3, '1998-02-18', '1998-03-18', '1998-02-23', 1, 162.75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10896, 'MAISD', 7, '1998-02-19', '1998-03-19', '1998-02-27', 3, 32.4500008, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10897, 'HUNGO', 3, '1998-02-19', '1998-03-19', '1998-02-25', 2, 603.539978, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10898, 'OCEAN', 4, '1998-02-20', '1998-03-20', '1998-03-06', 2, 1.26999998, 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10899, 'LILAS', 5, '1998-02-20', '1998-03-20', '1998-02-26', 3, 1.21000004, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10900, 'WELLI', 1, '1998-02-20', '1998-03-20', '1998-03-04', 2, 1.65999997, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10901, 'HILAA', 4, '1998-02-23', '1998-03-23', '1998-02-26', 1, 62.0900002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10902, 'FOLKO', 1, '1998-02-23', '1998-03-23', '1998-03-03', 1, 44.1500015, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10903, 'HANAR', 3, '1998-02-24', '1998-03-24', '1998-03-04', 3, 36.7099991, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10904, 'WHITC', 3, '1998-02-24', '1998-03-24', '1998-02-27', 3, 162.949997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (10905, 'WELLI', 9, '1998-02-24', '1998-03-24', '1998-03-06', 2, 13.7200003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10906, 'WOLZA', 4, '1998-02-25', '1998-03-11', '1998-03-03', 3, 26.2900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10907, 'SPECD', 6, '1998-02-25', '1998-03-25', '1998-02-27', 3, 9.18999958, 'SpÃ©cialitÃ©s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (10908, 'REGGC', 4, '1998-02-26', '1998-03-26', '1998-03-06', 2, 32.9599991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10909, 'SANTG', 1, '1998-02-26', '1998-03-26', '1998-03-10', 2, 53.0499992, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (10910, 'WILMK', 1, '1998-02-26', '1998-03-26', '1998-03-04', 3, 38.1100006, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (10911, 'GODOS', 3, '1998-02-26', '1998-03-26', '1998-03-05', 1, 38.1899986, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10912, 'HUNGO', 2, '1998-02-26', '1998-03-26', '1998-03-18', 2, 580.909973, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10913, 'QUEEN', 4, '1998-02-26', '1998-03-26', '1998-03-04', 1, 33.0499992, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10914, 'QUEEN', 6, '1998-02-27', '1998-03-27', '1998-03-02', 1, 21.1900005, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10915, 'TORTU', 2, '1998-02-27', '1998-03-27', '1998-03-02', 2, 3.50999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10916, 'RANCH', 1, '1998-02-27', '1998-03-27', '1998-03-09', 2, 63.7700005, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10917, 'ROMEY', 4, '1998-03-02', '1998-03-30', '1998-03-11', 2, 8.28999996, 'Romero y tomillo', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (10918, 'BOTTM', 3, '1998-03-02', '1998-03-30', '1998-03-11', 3, 48.8300018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10919, 'LINOD', 2, '1998-03-02', '1998-03-30', '1998-03-04', 2, 19.7999992, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10920, 'AROUT', 4, '1998-03-03', '1998-03-31', '1998-03-09', 2, 29.6100006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10921, 'VAFFE', 1, '1998-03-03', '1998-04-14', '1998-03-09', 1, 176.479996, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10922, 'HANAR', 5, '1998-03-03', '1998-03-31', '1998-03-05', 3, 62.7400017, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10923, 'LAMAI', 7, '1998-03-03', '1998-04-14', '1998-03-13', 3, 68.2600021, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (10924, 'BERGS', 3, '1998-03-04', '1998-04-01', '1998-04-08', 2, 151.520004, 'Berglunds snabbkÃ¶p', 'BerguvsvÃ¤gen  8', 'LuleÃ¥', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (10925, 'HANAR', 3, '1998-03-04', '1998-04-01', '1998-03-13', 1, 2.26999998, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10926, 'ANATR', 4, '1998-03-04', '1998-04-01', '1998-03-11', 3, 39.9199982, 'Ana Trujillo Emparedados y helados', 'Avda. de la ConstituciÃ³n 2222', 'MÃ©xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (10927, 'LACOR', 4, '1998-03-05', '1998-04-02', '1998-04-08', 1, 19.7900009, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (10928, 'GALED', 1, '1998-03-05', '1998-04-02', '1998-03-18', 1, 1.36000001, 'GalerÃ­a del gastronÃ³mo', 'Rambla de CataluÃ±a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (10929, 'FRANK', 6, '1998-03-05', '1998-04-02', '1998-03-12', 1, 33.9300003, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (10930, 'SUPRD', 4, '1998-03-06', '1998-04-17', '1998-03-18', 3, 15.5500002, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (10931, 'RICSU', 4, '1998-03-06', '1998-03-20', '1998-03-19', 2, 13.6000004, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10932, 'BONAP', 8, '1998-03-06', '1998-04-03', '1998-03-24', 1, 134.639999, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10933, 'ISLAT', 6, '1998-03-06', '1998-04-03', '1998-03-16', 3, 54.1500015, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (10934, 'LEHMS', 3, '1998-03-09', '1998-04-06', '1998-03-12', 3, 32.0099983, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (10935, 'WELLI', 4, '1998-03-09', '1998-04-06', '1998-03-18', 3, 47.5900002, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (10936, 'GREAL', 3, '1998-03-09', '1998-04-06', '1998-03-18', 2, 33.6800003, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (10937, 'CACTU', 7, '1998-03-10', '1998-03-24', '1998-03-13', 3, 31.5100002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10938, 'QUICK', 3, '1998-03-10', '1998-04-07', '1998-03-16', 2, 31.8899994, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10939, 'MAGAA', 2, '1998-03-10', '1998-04-07', '1998-03-13', 2, 76.3300018, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10940, 'BONAP', 8, '1998-03-11', '1998-04-08', '1998-03-23', 3, 19.7700005, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (10941, 'SAVEA', 7, '1998-03-11', '1998-04-08', '1998-03-20', 2, 400.809998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10942, 'REGGC', 9, '1998-03-11', '1998-04-08', '1998-03-18', 3, 17.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (10943, 'BSBEV', 4, '1998-03-11', '1998-04-08', '1998-03-19', 2, 2.17000008, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10944, 'BOTTM', 6, '1998-03-12', '1998-03-26', '1998-03-13', 3, 52.9199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10945, 'MORGK', 4, '1998-03-12', '1998-04-09', '1998-03-18', 1, 10.2200003, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (10946, 'VAFFE', 1, '1998-03-12', '1998-04-09', '1998-03-19', 2, 27.2000008, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10947, 'BSBEV', 3, '1998-03-13', '1998-04-10', '1998-03-16', 2, 3.25999999, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (10948, 'GODOS', 3, '1998-03-13', '1998-04-10', '1998-03-19', 3, 23.3899994, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (10949, 'BOTTM', 2, '1998-03-13', '1998-04-10', '1998-03-17', 3, 74.4400024, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10950, 'MAGAA', 1, '1998-03-16', '1998-04-13', '1998-03-23', 2, 2.5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (10951, 'RICSU', 9, '1998-03-16', '1998-04-27', '1998-04-07', 2, 30.8500004, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (10952, 'ALFKI', 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (10953, 'AROUT', 9, '1998-03-16', '1998-03-30', '1998-03-25', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (10954, 'LINOD', 5, '1998-03-17', '1998-04-28', '1998-03-20', 1, 27.9099998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (10955, 'FOLKO', 8, '1998-03-17', '1998-04-14', '1998-03-20', 2, 3.25999999, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10956, 'BLAUS', 6, '1998-03-17', '1998-04-28', '1998-03-20', 2, 44.6500015, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (10957, 'HILAA', 8, '1998-03-18', '1998-04-15', '1998-03-27', 3, 105.360001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10958, 'OCEAN', 7, '1998-03-18', '1998-04-15', '1998-03-27', 2, 49.5600014, 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10959, 'GOURL', 6, '1998-03-18', '1998-04-29', '1998-03-23', 2, 4.98000002, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (10960, 'HILAA', 3, '1998-03-19', '1998-04-02', '1998-04-08', 1, 2.07999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10961, 'QUEEN', 8, '1998-03-19', '1998-04-16', '1998-03-30', 1, 104.470001, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (10962, 'QUICK', 8, '1998-03-19', '1998-04-16', '1998-03-23', 2, 275.790009, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10963, 'FURIB', 9, '1998-03-19', '1998-04-16', '1998-03-26', 3, 2.70000005, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (10964, 'SPECD', 3, '1998-03-20', '1998-04-17', '1998-03-24', 2, 87.3799973, 'SpÃ©cialitÃ©s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (10965, 'OLDWO', 6, '1998-03-20', '1998-04-17', '1998-03-30', 3, 144.380005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (10966, 'CHOPS', 4, '1998-03-20', '1998-04-17', '1998-04-08', 1, 27.1900005, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (10967, 'TOMSP', 2, '1998-03-23', '1998-04-20', '1998-04-02', 2, 62.2200012, 'Toms SpezialitÃ¤ten', 'Luisenstr. 48', 'MÃ¼nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (10968, 'ERNSH', 1, '1998-03-23', '1998-04-20', '1998-04-01', 3, 74.5999985, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10969, 'COMMI', 1, '1998-03-23', '1998-04-20', '1998-03-30', 2, 0.209999993, 'ComÃ©rcio Mineiro', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (10970, 'BOLID', 9, '1998-03-24', '1998-04-07', '1998-04-24', 1, 16.1599998, 'BÃ³lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (10971, 'FRANR', 2, '1998-03-24', '1998-04-21', '1998-04-02', 2, 121.82, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (10972, 'LACOR', 4, '1998-03-24', '1998-04-21', '1998-03-26', 2, 0.0199999996, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (10973, 'LACOR', 6, '1998-03-24', '1998-04-21', '1998-03-27', 2, 15.1700001, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (10974, 'SPLIR', 3, '1998-03-25', '1998-04-08', '1998-04-03', 3, 12.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (10975, 'BOTTM', 1, '1998-03-25', '1998-04-22', '1998-03-27', 3, 32.2700005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10976, 'HILAA', 1, '1998-03-25', '1998-05-06', '1998-04-03', 1, 37.9700012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (10977, 'FOLKO', 8, '1998-03-26', '1998-04-23', '1998-04-10', 3, 208.5, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10978, 'MAISD', 9, '1998-03-26', '1998-04-23', '1998-04-23', 2, 32.8199997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (10979, 'ERNSH', 8, '1998-03-26', '1998-04-23', '1998-03-31', 2, 353.070007, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10980, 'FOLKO', 4, '1998-03-27', '1998-05-08', '1998-04-17', 1, 1.25999999, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10981, 'HANAR', 1, '1998-03-27', '1998-04-24', '1998-04-02', 2, 193.369995, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (10982, 'BOTTM', 2, '1998-03-27', '1998-04-24', '1998-04-08', 1, 14.0100002, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (10983, 'SAVEA', 2, '1998-03-27', '1998-04-24', '1998-04-06', 2, 657.539978, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10984, 'SAVEA', 1, '1998-03-30', '1998-04-27', '1998-04-03', 3, 211.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (10985, 'HUNGO', 2, '1998-03-30', '1998-04-27', '1998-04-02', 1, 91.5100021, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (10986, 'OCEAN', 8, '1998-03-30', '1998-04-27', '1998-04-21', 2, 217.860001, 'OcÃ©ano AtlÃ¡ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (10987, 'EASTC', 8, '1998-03-31', '1998-04-28', '1998-04-06', 1, 185.479996, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (10988, 'RATTC', 3, '1998-03-31', '1998-04-28', '1998-04-10', 2, 61.1399994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (10989, 'QUEDE', 2, '1998-03-31', '1998-04-28', '1998-04-02', 1, 34.7599983, 'Que DelÃ­cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (10990, 'ERNSH', 2, '1998-04-01', '1998-05-13', '1998-04-07', 3, 117.610001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (10991, 'QUICK', 1, '1998-04-01', '1998-04-29', '1998-04-07', 1, 38.5099983, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10992, 'THEBI', 1, '1998-04-01', '1998-04-29', '1998-04-03', 3, 4.26999998, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (10993, 'FOLKO', 7, '1998-04-01', '1998-04-29', '1998-04-10', 3, 8.81000042, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (10994, 'VAFFE', 2, '1998-04-02', '1998-04-16', '1998-04-09', 3, 65.5299988, 'Vaffeljernet', 'Smagsloget 45', 'Ã…rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (10995, 'PERIC', 1, '1998-04-02', '1998-04-30', '1998-04-06', 3, 46, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (10996, 'QUICK', 4, '1998-04-02', '1998-04-30', '1998-04-10', 2, 1.12, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (10997, 'LILAS', 8, '1998-04-03', '1998-05-15', '1998-04-13', 2, 73.9100037, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (10998, 'WOLZA', 8, '1998-04-03', '1998-04-17', '1998-04-17', 2, 20.3099995, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (10999, 'OTTIK', 6, '1998-04-03', '1998-05-01', '1998-04-10', 2, 96.3499985, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (11000, 'RATTC', 2, '1998-04-06', '1998-05-04', '1998-04-14', 3, 55.1199989, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (11001, 'FOLKO', 2, '1998-04-06', '1998-05-04', '1998-04-14', 2, 197.300003, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (11002, 'SAVEA', 4, '1998-04-06', '1998-05-04', '1998-04-16', 1, 141.160004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (11003, 'THECR', 3, '1998-04-06', '1998-05-04', '1998-04-08', 3, 14.9099998, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (11004, 'MAISD', 3, '1998-04-07', '1998-05-05', '1998-04-20', 1, 44.8400002, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (11005, 'WILMK', 2, '1998-04-07', '1998-05-05', '1998-04-10', 1, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (11006, 'GREAL', 3, '1998-04-07', '1998-05-05', '1998-04-15', 2, 25.1900005, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (11007, 'PRINI', 8, '1998-04-08', '1998-05-06', '1998-04-13', 2, 202.240005, 'Princesa Isabel Vinhos', 'Estrada da saÃºde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (11008, 'ERNSH', 7, '1998-04-08', '1998-05-06', NULL, 3, 79.4599991, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (11009, 'GODOS', 2, '1998-04-08', '1998-05-06', '1998-04-10', 1, 59.1100006, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (11010, 'REGGC', 2, '1998-04-09', '1998-05-07', '1998-04-21', 2, 28.7099991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (11011, 'ALFKI', 3, '1998-04-09', '1998-05-07', '1998-04-13', 1, 1.21000004, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (11012, 'FRANK', 1, '1998-04-09', '1998-04-23', '1998-04-17', 3, 242.949997, 'Frankenversand', 'Berliner Platz 43', 'MÃ¼nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (11013, 'ROMEY', 2, '1998-04-09', '1998-05-07', '1998-04-10', 1, 32.9900017, 'Romero y tomillo', 'Gran VÃ­a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (11014, 'LINOD', 2, '1998-04-10', '1998-05-08', '1998-04-15', 3, 23.6000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (11015, 'SANTG', 2, '1998-04-10', '1998-04-24', '1998-04-20', 2, 4.61999989, 'SantÃ© Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (11016, 'AROUT', 9, '1998-04-10', '1998-05-08', '1998-04-13', 2, 33.7999992, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (11017, 'ERNSH', 9, '1998-04-13', '1998-05-11', '1998-04-20', 2, 754.26001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (11018, 'LONEP', 4, '1998-04-13', '1998-05-11', '1998-04-16', 2, 11.6499996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (11019, 'RANCH', 6, '1998-04-13', '1998-05-11', NULL, 3, 3.17000008, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (11020, 'OTTIK', 2, '1998-04-14', '1998-05-12', '1998-04-16', 2, 43.2999992, 'Ottilies KÃ¤seladen', 'Mehrheimerstr. 369', 'KÃ¶ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (11021, 'QUICK', 3, '1998-04-14', '1998-05-12', '1998-04-21', 1, 297.179993, 'QUICK-Stop', 'TaucherstraÃŸe 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (11022, 'HANAR', 9, '1998-04-14', '1998-05-12', '1998-05-04', 2, 6.26999998, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (11023, 'BSBEV', 1, '1998-04-14', '1998-04-28', '1998-04-24', 2, 123.830002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (11024, 'EASTC', 4, '1998-04-15', '1998-05-13', '1998-04-20', 1, 74.3600006, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11025, 'WARTH', 6, '1998-04-15', '1998-05-13', '1998-04-24', 3, 29.1700001, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (11026, 'FRANS', 4, '1998-04-15', '1998-05-13', '1998-04-28', 1, 47.0900002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (11027, 'BOTTM', 1, '1998-04-16', '1998-05-14', '1998-04-20', 1, 52.5200005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11028, 'KOENE', 2, '1998-04-16', '1998-05-14', '1998-04-22', 1, 29.5900002, 'KÃ¶niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (11029, 'CHOPS', 4, '1998-04-16', '1998-05-14', '1998-04-27', 1, 47.8400002, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (11030, 'SAVEA', 7, '1998-04-17', '1998-05-15', '1998-04-27', 2, 830.75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (11031, 'SAVEA', 6, '1998-04-17', '1998-05-15', '1998-04-24', 2, 227.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (11032, 'WHITC', 2, '1998-04-17', '1998-05-15', '1998-04-23', 3, 606.190002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (11033, 'RICSU', 7, '1998-04-17', '1998-05-15', '1998-04-23', 3, 84.7399979, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (11034, 'OLDWO', 8, '1998-04-20', '1998-06-01', '1998-04-27', 1, 40.3199997, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (11035, 'SUPRD', 2, '1998-04-20', '1998-05-18', '1998-04-24', 2, 0.170000002, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (11036, 'DRACD', 8, '1998-04-20', '1998-05-18', '1998-04-22', 3, 149.470001, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (11037, 'GODOS', 7, '1998-04-21', '1998-05-19', '1998-04-27', 1, 3.20000005, 'Godos Cocina TÃ­pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (11038, 'SUPRD', 1, '1998-04-21', '1998-05-19', '1998-04-30', 2, 29.5900002, 'SuprÃªmes dÃ©lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (11039, 'LINOD', 1, '1998-04-21', '1998-05-19', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (11040, 'GREAL', 4, '1998-04-22', '1998-05-20', NULL, 3, 18.8400002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (11041, 'CHOPS', 3, '1998-04-22', '1998-05-20', '1998-04-28', 2, 48.2200012, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (11042, 'COMMI', 2, '1998-04-22', '1998-05-06', '1998-05-01', 1, 29.9899998, 'ComÃ©rcio Mineiro', 'Av. dos LusÃ­adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (11043, 'SPECD', 5, '1998-04-22', '1998-05-20', '1998-04-29', 2, 8.80000019, 'SpÃ©cialitÃ©s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (11044, 'WOLZA', 4, '1998-04-23', '1998-05-21', '1998-05-01', 1, 8.72000027, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (11045, 'BOTTM', 6, '1998-04-23', '1998-05-21', NULL, 2, 70.5800018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11046, 'WANDK', 8, '1998-04-23', '1998-05-21', '1998-04-24', 2, 71.6399994, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (11047, 'EASTC', 7, '1998-04-24', '1998-05-22', '1998-05-01', 3, 46.6199989, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11048, 'BOTTM', 7, '1998-04-24', '1998-05-22', '1998-04-30', 3, 24.1200008, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (11049, 'GOURL', 3, '1998-04-24', '1998-05-22', '1998-05-04', 1, 8.34000015, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (11050, 'FOLKO', 8, '1998-04-27', '1998-05-25', '1998-05-05', 2, 59.4099998, 'Folk och fÃ¤ HB', 'Ã…kergatan 24', 'BrÃ¤cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (11051, 'LAMAI', 7, '1998-04-27', '1998-05-25', NULL, 3, 2.78999996, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (11052, 'HANAR', 3, '1998-04-27', '1998-05-25', '1998-05-01', 1, 67.2600021, 'Hanari Carnes', 'Rua do PaÃ§o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (11053, 'PICCO', 2, '1998-04-27', '1998-05-25', '1998-04-29', 2, 53.0499992, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (11054, 'CACTU', 8, '1998-04-28', '1998-05-26', NULL, 1, 0.330000013, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (11055, 'HILAA', 7, '1998-04-28', '1998-05-26', '1998-05-05', 2, 120.919998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San CristÃ³bal', 'TÃ¡chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (11056, 'EASTC', 8, '1998-04-28', '1998-05-12', '1998-05-01', 2, 278.959991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (11057, 'NORTS', 3, '1998-04-29', '1998-05-27', '1998-05-01', 3, 4.13000011, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (11058, 'BLAUS', 9, '1998-04-29', '1998-05-27', NULL, 3, 31.1399994, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (11059, 'RICAR', 2, '1998-04-29', '1998-06-10', NULL, 2, 85.8000031, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (11060, 'FRANS', 2, '1998-04-30', '1998-05-28', '1998-05-04', 2, 10.9799995, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (11061, 'GREAL', 4, '1998-04-30', '1998-06-11', NULL, 3, 14.0100002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (11062, 'REGGC', 4, '1998-04-30', '1998-05-28', NULL, 2, 29.9300003, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (11063, 'HUNGO', 3, '1998-04-30', '1998-05-28', '1998-05-06', 2, 81.7300034, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (11064, 'SAVEA', 1, '1998-05-01', '1998-05-29', '1998-05-04', 1, 30.0900002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (11065, 'LILAS', 8, '1998-05-01', '1998-05-29', NULL, 1, 12.9099998, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (11066, 'WHITC', 7, '1998-05-01', '1998-05-29', '1998-05-04', 2, 44.7200012, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (11067, 'DRACD', 1, '1998-05-04', '1998-05-18', '1998-05-06', 2, 7.98000002, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (11068, 'QUEEN', 8, '1998-05-04', '1998-06-01', NULL, 2, 81.75, 'Queen Cozinha', 'Alameda dos CanÃ rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (11069, 'TORTU', 1, '1998-05-04', '1998-06-01', '1998-05-06', 2, 15.6700001, 'Tortuga Restaurante', 'Avda. Azteca 123', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (11070, 'LEHMS', 2, '1998-05-05', '1998-06-02', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (11071, 'LILAS', 1, '1998-05-05', '1998-06-02', NULL, 1, 0.930000007, 'LILA-Supermercado', 'Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (11072, 'ERNSH', 4, '1998-05-05', '1998-06-02', NULL, 2, 258.640015, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (11073, 'PERIC', 2, '1998-05-05', '1998-06-02', NULL, 2, 24.9500008, 'Pericles Comidas clÃ¡sicas', 'Calle Dr. Jorge Cash 321', 'MÃ©xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (11074, 'SIMOB', 7, '1998-05-06', '1998-06-03', NULL, 2, 18.4400005, 'Simons bistro', 'VinbÃ¦ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (11075, 'RICSU', 8, '1998-05-06', '1998-06-03', NULL, 2, 6.19000006, 'Richter Supermarkt', 'Starenweg 5', 'GenÃ¨ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (11076, 'BONAP', 4, '1998-05-06', '1998-06-03', NULL, 2, 38.2799988, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (11077, 'RATTC', 1, '1998-05-06', '1998-06-03', NULL, 2, 8.52999973, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');







--
-- Data for Name: us_states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO us_states VALUES (1, 'Alabama', 'AL', 'south');
INSERT INTO us_states VALUES (2, 'Alaska', 'AK', 'north');
INSERT INTO us_states VALUES (3, 'Arizona', 'AZ', 'west');
INSERT INTO us_states VALUES (4, 'Arkansas', 'AR', 'south');
INSERT INTO us_states VALUES (5, 'California', 'CA', 'west');
INSERT INTO us_states VALUES (6, 'Colorado', 'CO', 'west');
INSERT INTO us_states VALUES (7, 'Connecticut', 'CT', 'east');
INSERT INTO us_states VALUES (8, 'Delaware', 'DE', 'east');
INSERT INTO us_states VALUES (9, 'District of Columbia', 'DC', 'east');
INSERT INTO us_states VALUES (10, 'Florida', 'FL', 'south');
INSERT INTO us_states VALUES (11, 'Georgia', 'GA', 'south');
INSERT INTO us_states VALUES (12, 'Hawaii', 'HI', 'west');
INSERT INTO us_states VALUES (13, 'Idaho', 'ID', 'midwest');
INSERT INTO us_states VALUES (14, 'Illinois', 'IL', 'midwest');
INSERT INTO us_states VALUES (15, 'Indiana', 'IN', 'midwest');
INSERT INTO us_states VALUES (16, 'Iowa', 'IO', 'midwest');
INSERT INTO us_states VALUES (17, 'Kansas', 'KS', 'midwest');
INSERT INTO us_states VALUES (18, 'Kentucky', 'KY', 'south');
INSERT INTO us_states VALUES (19, 'Louisiana', 'LA', 'south');
INSERT INTO us_states VALUES (20, 'Maine', 'ME', 'north');
INSERT INTO us_states VALUES (21, 'Maryland', 'MD', 'east');
INSERT INTO us_states VALUES (22, 'Massachusetts', 'MA', 'north');
INSERT INTO us_states VALUES (23, 'Michigan', 'MI', 'north');
INSERT INTO us_states VALUES (24, 'Minnesota', 'MN', 'north');
INSERT INTO us_states VALUES (25, 'Mississippi', 'MS', 'south');
INSERT INTO us_states VALUES (26, 'Missouri', 'MO', 'south');
INSERT INTO us_states VALUES (27, 'Montana', 'MT', 'west');
INSERT INTO us_states VALUES (28, 'Nebraska', 'NE', 'midwest');
INSERT INTO us_states VALUES (29, 'Nevada', 'NV', 'west');
INSERT INTO us_states VALUES (30, 'New Hampshire', 'NH', 'east');
INSERT INTO us_states VALUES (31, 'New Jersey', 'NJ', 'east');
INSERT INTO us_states VALUES (32, 'New Mexico', 'NM', 'west');
INSERT INTO us_states VALUES (33, 'New York', 'NY', 'east');
INSERT INTO us_states VALUES (34, 'North Carolina', 'NC', 'east');
INSERT INTO us_states VALUES (35, 'North Dakota', 'ND', 'midwest');
INSERT INTO us_states VALUES (36, 'Ohio', 'OH', 'midwest');
INSERT INTO us_states VALUES (37, 'Oklahoma', 'OK', 'midwest');
INSERT INTO us_states VALUES (38, 'Oregon', 'OR', 'west');
INSERT INTO us_states VALUES (39, 'Pennsylvania', 'PA', 'east');
INSERT INTO us_states VALUES (40, 'Rhode Island', 'RI', 'east');
INSERT INTO us_states VALUES (41, 'South Carolina', 'SC', 'east');
INSERT INTO us_states VALUES (42, 'South Dakota', 'SD', 'midwest');
INSERT INTO us_states VALUES (43, 'Tennessee', 'TN', 'midwest');
INSERT INTO us_states VALUES (44, 'Texas', 'TX', 'west');
INSERT INTO us_states VALUES (45, 'Utah', 'UT', 'west');
INSERT INTO us_states VALUES (46, 'Vermont', 'VT', 'east');
INSERT INTO us_states VALUES (47, 'Virginia', 'VA', 'east');
INSERT INTO us_states VALUES (48, 'Washington', 'WA', 'west');
INSERT INTO us_states VALUES (49, 'West Virginia', 'WV', 'south');
INSERT INTO us_states VALUES (50, 'Wisconsin', 'WI', 'midwest');
INSERT INTO us_states VALUES (51, 'Wyoming', 'WY', 'west');


--
-- task 1 :
--

SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY COUNT(*) DESC;


--
-- task 2 :
--

SELECT p.product_name, c.category_name, p.unit_price
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id
WHERE (p.category_id, p.unit_price) IN (
    SELECT category_id, MAX(unit_price) 
    FROM products 
    GROUP BY category_id
);


--
-- task 3 :
--

SELECT e.employee_id, e.first_name, e.last_name, COUNT(et.territory_id) AS territory_count
FROM employees e
JOIN employee_territories et ON e.employee_id = et.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
ORDER BY territory_count DESC
LIMIT 1;


--
-- task 4 :
--

BEGIN;

UPDATE employees
SET title = 'Dr'
WHERE first_name = 'Robert' AND last_name = 'King';

UPDATE products
SET unit_price = 
    CASE 
        WHEN product_name = 'Perth Pasties' THEN 45
        WHEN product_name = 'Vegie-spread' THEN 50
        WHEN product_name = 'Filo Mix' THEN 8.5
    END;

SELECT * FROM employees WHERE first_name = 'Robert' AND last_name = 'King';

SELECT * FROM products WHERE product_name IN ('Perth Pasties', 'Vegie-spread', 'Filo Mix');



