------> LIMPANDO O SCHEMA
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA IF NOT EXISTS public;

------> Criando Estrutura
CREATE TABLE Medico (
	CRM VARCHAR(15) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

DROP TABLE Medico;

CREATE TABLE Medico (
	CRM VARCHAR(15) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	especialização VARCHAR(100),
	numero INT NOT NULL,
	cep VARCHAR(9) NOT NULL,
	rua VARCHAR(100) NOT NULL
);

CREATE TABLE Paciente (
	CPF VARCHAR(14) PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	data_de_nascimento DATE NOT NULL,
	numero INT,
	cep VARCHAR(9),
	rua VARCHAR(100),
	
	CHECK(CPF LIKE '%.%.%-%')
);

CREATE TABLE Consulta (
	ID_consulta SERIAL PRIMARY KEY,
	pacienteCPF VARCHAR(14) NOT NULL,
	descrição VARCHAR(600) NOT NULL,
	diagnóstico VARCHAR(600) NOT NULL,
	valor_consulta REAL NOT NULL DEFAULT 100,
	data DATE NOT NULL,
	medicamento VARCHAR(70)
);

ALTER TABLE Consulta ADD FOREIGN KEY (pacienteCPF) REFERENCES Paciente(CPF);

CREATE TABLE Exame (
	ID_exame SERIAL PRIMARY KEY,
	medicoCRM VARCHAR(15) NOT NULL,
	pacienteCPF VARCHAR(14) NOT NULL,
	valor_exame REAL NOT NULL DEFAULT 250,
	descrição VARCHAR(600) NOT NULL,
	data DATE NOT NULL,
	resultado VARCHAR(600) NOT NULL,
	
	CONSTRAINT medicoCRM_cons FOREIGN KEY (medicoCRM) REFERENCES Medico(CRM),
	CONSTRAINT pacienteCPF_cons FOREIGN KEY (pacienteCPF) REFERENCES Paciente(CPF)
);

CREATE TABLE Faz_consulta (
	PKFK_medicoCRM VARCHAR(15),
	PKFK_consultaID INT,
	valor_medico REAL NOT NULL,
	
	CONSTRAINT PKFK_medicoCRM_cons FOREIGN KEY (PKFK_medicoCRM) REFERENCES Medico(CRM),
	CONSTRAINT PKFK_consultaID_cons FOREIGN KEY (PKFK_consultaID) REFERENCES Consulta(ID_consulta),
	CONSTRAINT PK_COMPOSTA PRIMARY KEY (PKFK_medicoCRM, PKFK_consultaID)
);

------> Inserindo Dados
--> Dados de Paciente
INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('974.794.264-70','Victoria Collier','(56) 3256-4276','09/02/2022',419,'58808-404','8079 Adipiscing. Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('733.367.165-66','Vaughan Lowery','(69) 1868-8836','04/15/2022',92,'58519-722','P.O. Box 910, 711 Ut St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('151.651.453-32','Christian Short','(56) 5898-5430','01/06/2023',321,'15342-894','1574 Rutrum, Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('841.478.943-61','Jade Cameron','(27) 2145-2676','04/01/2022',125,'73732-870','Ap #675-9962 Facilisis St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('537.248.542-84','Gray Mccullough','(29) 1654-9313','07/07/2022',278,'58032-765','P.O. Box 801, 1631 Tempus Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('123.856.365-52','Keith Payne','(32) 2354-8263','11/13/2023',359,'20163-439','Ap #805-7823 Dapibus Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('844.351.618-86','Dominic Romero','(46) 3784-4318','04/20/2022',202,'55808-839','Ap #408-5754 Ut Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('968.810.743-80','Ira Mcknight','(63) 8727-5496','10/06/2022',58,'32252664','931-2649 Quisque Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('347.968.738-51','Nomlanga Bernard','(24) 8621-8951','07/20/2022',418,'60838-310','1346 Quis St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('756.626.844-84','Althea Dixon','(65) 5103-3591','05/08/2022',348,'38483724','Ap #147-1107 Parturient Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('797.407.361-27','Alexis Nieves','(82) 2442-6005','03/13/2023',370,'90358-615','P.O. Box 569, 3669 Magna. Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('497.330.372-98','Holly Barr','(27) 7101-2468','02/18/2023',79,'63435-838','Ap #223-1746 Hendrerit Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('028.328.216-26','Britanni Peterson','(47) 8255-8596','06/26/2023',6,'85715-845','P.O. Box 552, 3491 Primis Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('251.277.224-51','Justin Ingram','(98) 1141-7866','11/02/2023',476,'68121-636','P.O. Box 147, 7602 Aliquet Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('550.116.116-86','Xantha Yang','(46) 5010-2662','02/20/2022',407,'43636-771','467 Mauris Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('488.617.872-35','Justin Bentley','(95) 3361-6383','07/02/2022',263,'58378-424','P.O. Box 206, 3383 Molestie Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('355.144.983-39','Irma Mosley','(62) 4754-4684','11/23/2022',216,'65139-212','Ap #881-5863 Nisi St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('675.245.462-24','Keith Ruiz','(61) 3323-7464','11/29/2023',64,'46878-761','Ap #928-6444 Mus. Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('512.382.658-24','Amber Guy','(55) 7863-6071','03/10/2023',378,'58519-272','1448 Ac Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('745.716.732-33','Giacomo Tucker','(61) 1938-5347','10/10/2022',285,'96874-138','P.O. Box 360, 2268 Risus. Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('486.130.412-90','Bo Reed','(23) 6542-5172','08/08/2023',363,'75788-931','P.O. Box 365, 3654 Vel Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('184.858.967-91','Ina O donnell','(72) 8053-5450','05/01/2023',316,'44148-284','Ap #700-3207 In, Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('926.538.971-30','Maile Skinner','(84) 5517-3316','10/13/2023',312,'74790-108','418 Hendrerit St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('267.351.820-41','Tad Matthews','(48) 8564-4758','01/21/2023',217,'52526-713','Ap #446-7582 Nullam Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('586.426.767-43','Serena Travis','(45) 8875-2962','10/22/2022',115,'65726-864','Ap #669-6411 Urna, Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('544.482.331-01','Stone Gutierrez','(83) 2518-8203','01/31/2023',139,'62196-674','Ap #222-1559 Risus. Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('687.649.803-61','Brianna James','(31) 4820-6324','11/11/2023',189,'42418-685','7247 A Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('264.591.338-67','Fay Carson','(62) 8937-4542','04/08/2023',256,'65704-383','P.O. Box 650, 963 Id Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('168.631.848-67','Cecilia Weiss','(51) 3876-8381','09/16/2022',434,'44815-775','177-1799 Eget, St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('446.998.261-28','Callum Prince','(21) 4615-3646','06/20/2023',297,'21173-482','552-5322 Nunc St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('159.798.666-15','Beatrice Strong','(64) 7567-5197','04/21/2022',447,'58512-548','519-4867 Morbi St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('217.333.921-82','Lyle Randolph','(13) 7645-8272','03/20/2022',467,'63750-458','P.O. Box 154, 5104 Aliquam Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('534.063.874-40','Zahir Watkins','(94) 7518-9253','02/04/2023',214,'58719-372','425-3826 Sem St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('858.483.626-93','April Stone','(61) 1672-8244','06/07/2023',202,'89353-105','Ap #938-6280 In St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('304.044.849-34','Mia Roman','(76) 7575-6846','02/10/2023',291,'75740-331','P.O. Box 920, 3020 Sit Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('831.517.720-71','Hunter Reid','(91) 4716-6740','12/30/2022',312,'88317-262','Ap #133-9617 Condimentum. Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('071.647.312-15','Sonia Miranda','(64) 2297-4610','12/21/2021',97,'52854-453','6838 Nascetur Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('191.555.251-49','Brady Hogan','(52) 8544-2693','01/07/2022',339,'36339138','Ap #862-1319 Mauris Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('487.921.312-17','Lee Best','(24) 8244-8956','05/07/2022',71,'65225-159','9025 Cras St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('711.597.177-65','Naomi Lara','(34) 6887-8352','11/14/2022',238,'87102-257','8695 Integer Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('326.336.037-40','Tatiana Alvarado','(17) 7852-2320','03/09/2022',295,'87713-168','755-4605 Bibendum Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('819.973.826-31','Wylie Hancock','(72) 6624-1714','05/20/2023',347,'76775-828','Ap #648-3512 Auctor Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('537.781.724-91','Karleigh Payne','(51) 8184-5464','12/16/2022',305,'89372-552','Ap #923-1330 Eget, Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('636.922.782-64','Blythe Butler','(55) 4377-5707','10/18/2022',396,'82577-307','Ap #524-6707 Ut, Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('741.061.943-60','Olivia Hewitt','(23) 5775-6180','09/29/2023',449,'65717-741','P.O. Box 886, 5347 Gravida Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('428.138.313-24','Jessica Sutton','(42) 3424-6191','10/05/2023',364,'96244-658','466-2590 Mauris Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('543.705.080-47','Benjamin Bass','(32) 3006-3722','03/19/2022',346,'88416-681','8876 Egestas Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('372.407.673-37','Tad O brien','(38) 3737-8413','11/02/2022',128,'32396131','2933 Nullam Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('786.137.847-04','Zephr Briggs','(28) 3177-9558','10/21/2023',458,'83220-266','P.O. Box 141, 6562 Hymenaeos. St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('034.437.859-85','Gareth Dawson','(36) 8901-6821','06/19/2022',323,'28785-321','778-8554 Cursus Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('173.554.724-52','Sonya Fuentes','(89) 4373-8665','02/11/2023',356,'53728-053','P.O. Box 423, 4163 Nam Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('715.405.742-95','Amelia Carey','(84) 5521-3246','12/23/2022',36,'75734-166','Ap #971-9747 Elementum, Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('712.787.841-27','Alvin Hopper','(18) 2571-4732','05/11/2022',67,'63068-951','P.O. Box 145, 5894 Habitant Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('326.352.397-47','Isabella Sherman','(51) 6481-6964','05/17/2023',385,'40781-946','Ap #979-9256 In Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('932.023.858-51','Lydia Chaney','(78) 9021-5964','01/10/2023',308,'60653-072','P.O. Box 284, 9677 Congue. St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('322.942.024-91','Lyle Snider','(70) 4056-6685','06/23/2022',262,'75776-911','568-6703 Faucibus St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('766.984.684-18','Zahir Castaneda','(13) 9870-9172','12/05/2023',201,'58068-778','343-7851 Sem, St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('311.075.624-44','Kasimir Singleton','(68) 4475-7734','11/10/2023',198,'76711-528','216-8689 Ornare. Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('128.929.795-75','Joshua Cline','(65) 6000-2158','03/29/2022',118,'63697-247','Ap #291-6271 Augue St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('345.568.689-42','Brennan Harding','(17) 1944-6851','10/31/2022',382,'14478-271','Ap #245-1013 Class Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('530.241.174-88','Flavia Mcgee','(33) 1772-5485','11/30/2023',34,'16661-416','963-8812 Vel, Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('006.841.781-86','Eliana Wade','(91) 8304-4261','10/01/2022',436,'55862-463','Ap #384-4350 Sapien. Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('617.845.766-27','Reuben Duncan','(48) 8242-4283','05/25/2022',456,'75782-116','496-7226 Nascetur St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('571.324.807-65','Gannon Schneider','(22) 2008-7763','09/13/2023',197,'54844-651','Ap #820-6717 Donec Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('128.554.888-06','Raven Gonzalez','(71) 8826-3316','07/15/2023',55,'26327-561','Ap #587-1957 Ante Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('770.355.285-05','Acton Mullins','(79) 8239-3237','12/20/2021',60,'61296-206','692-8977 Nullam St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('448.856.487-83','Sophia Banks','(48) 4662-1719','11/27/2023',315,'74772-594','6853 Mollis Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('604.368.741-10','Sacha Lott','(31) 6017-4168','05/30/2023',64,'65218-703','873-2246 Dui, St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('879.212.481-35','Nero Martinez','(84) 4471-7712','04/02/2022',254,'73777-217','362-3954 Ut Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('693.751.884-52','Hamilton Meyer','(56) 3056-7061','08/09/2023',349,'42931-675','Ap #996-4632 Sit Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('233.374.267-47','Yeo King','(55) 6729-4516','11/10/2022',391,'73772-674','Ap #155-6105 Sem Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('439.208.597-80','Clayton Hutchinson','(23) 5197-4204','12/27/2022',268,'40616-340','6176 Diam. Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('834.651.812-72','Ezra Chaney','(37) 3524-2352','11/13/2023',387,'67742-256','Ap #385-7240 Dolor. Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('174.381.885-58','Leah Levine','(54) 8231-5061','05/21/2022',453,'58725-515','Ap #762-8753 Magna Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('836.168.928-59','Simone Jacobs','(55) 3892-3953','07/06/2023',395,'60624-346','6539 Non Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('740.261.403-38','Stewart Austin','(81) 2263-5241','04/15/2023',143,'87132-676','Ap #111-1970 Luctus Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('122.412.171-48','Herrod Price','(84) 3586-8651','11/26/2023',269,'65363-881','P.O. Box 866, 3581 Mauris Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('643.423.511-72','Uma Hubbard','(71) 2852-5278','04/20/2022',254,'61476-958','446-6325 Ut, Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('623.214.272-69','Melanie Sanford','(34) 9623-6522','12/17/2022',154,'65011-825','816-6343 Cursus Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('777.301.598-84','Cairo Vargas','(52) 1280-3808','07/23/2023',253,'89218-236','P.O. Box 351, 8496 Condimentum St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('143.706.508-53','Pearl Robinson','(88) 7689-3994','01/06/2022',218,'44886-321','3034 Cras Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('065.978.996-91','Cecilia Carney','(64) 1882-3246','04/30/2022',151,'63561-050','Ap #401-8922 A Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('316.002.100-71','Carly Green','(93) 5772-2592','06/20/2022',228,'18346-676','700-1129 Tempor Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('433.223.853-85','Amos Vaughan','(96) 7577-6162','08/07/2022',141,'62553-641','8001 Curabitur Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('818.417.150-61','Charity Sweeney','(73) 5483-2625','01/31/2022',165,'88797-355','200-9659 Mauris Ave');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('574.624.887-54','Larissa Whitley','(80) 2754-5423','03/28/2022',476,'52973-437','P.O. Box 605, 2145 Etiam Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('507.176.448-29','Ezra Stark','(51) 8247-6881','05/23/2022',70,'88214-145','281-8835 Etiam St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('692.031.801-67','Cally Pate','(32) 8587-6575','09/30/2022',389,'39345057','Ap #317-8435 Amet Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('448.475.447-54','Ezra Conner','(75) 1323-3355','11/19/2022',23,'65470-558','P.O. Box 580, 9823 Integer Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('183.442.627-65','Kellie Stuart','(31) 3733-5028','11/10/2022',42,'67608-381','9688 Imperdiet Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('142.986.446-36','Evan Osborne','(74) 8550-6624','11/15/2023',249,'13453-722','601-6898 Commodo Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('348.074.773-57','Abel Leach','(33) 9834-1627','01/05/2022',306,'68747-757','251-9626 Porta Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('903.977.660-68','Dawn Salazar','(50) 7287-2576','07/19/2023',11,'74701-698','Ap #106-4294 Nulla Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('439.269.981-31','Kellie Tran','(52) 2377-7591','02/17/2023',438,'85871-155','450-8307 Mauris Av.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('656.573.517-94','Fletcher Cruz','(78) 6813-4277','10/28/2023',99,'87694-831','4979 Sed St.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('011.239.523-76','Anastasia Delacruz','(86) 4722-2717','01/29/2023',454,'74718-157','P.O. Box 734, 8725 Enim. Rd.');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('762.673.354-74','Ivy Neal','(59) 8884-9420','06/22/2023',66,'28672-287','Ap #942-9594 Malesuada Avenue');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('511.826.782-35','Octavia Reeves','(23) 5455-3762','07/16/2022',156,'65134-648','746-5547 Elit. Street');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('607.002.847-97','Addison Mays','(59) 2246-2995','08/25/2022',331,'58544-021','Ap #424-739 Massa. Road');

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento,numero,cep,rua) 
  VALUES 
    ('275.708.875-26','Callum Pacheco','(39) 1593-6481','05/13/2023',17,'41369-608','Ap #468-7083 Quisque Street');


--> Dados de Medico
INSERT INTO Medico (CRM,nome,telefone,especialização,numero,CEP,rua)
VALUES
  ('28528430-9','Bertha Trujillo','(32) 9814-4779','sed dolor.',157,'12591-818','994-4347 Blandit Ave'),
  ('61538681-6','Deacon Vang','(74) 1566-2913','laoreet lectus',373,'65382-927','2553 Ac Rd.'),
  ('40782624-2','Brenden Duffy','(64) 7872-9949','cursus. Nunc',197,'23866-521','3072 Rhoncus. Av.'),
  ('19511088-0','Blake Freeman','(86) 0277-7583','Duis volutpat',431,'62365-522','Ap #816-428 Ut Avenue'),
  ('73457624-1','Illiana Lloyd','(24) 2564-9584','pretium aliquet,',111,'61391-342','882-9954 Non Av.'),
  ('36425322-5','Sydney Meadows','(37) 0682-4817','facilisi. Sed',46,'20904-742','Ap #415-4556 Maecenas Av.'),
  ('52459557-8','Ross Hughes','(53) 7428-0161','ante dictum',9,'88648-434','8873 Augue. Rd.'),
  ('51898673-6','Harrison O''donnell','(93) 4713-8681','egestas a,',266,'68488-758','425-6131 Mi St.'),
  ('26066795-4','Maite Cole','(21) 1467-3556','risus. Morbi',200,'99193-212','524-3710 Est, St.'),
  ('63220713-3','Iona Vincent','(35) 9371-7805','tincidunt aliquam',185,'58754-850','739-7460 Lorem St.'),
  ('16131903-2','Keith Black','(92) 4241-1185','lacus. Ut',25,'98133-745','Ap #482-1308 Parturient Ave'),
  ('36223542-8','Kaye Kirby','(58) 1134-3015','adipiscing, enim',285,'58575-027','Ap #313-2388 Nunc Rd.'),
  ('10591280-4','Fletcher Gibson','(36) 2327-3368','massa rutrum',245,'67496-552','646-2885 Malesuada St.'),
  ('87585431-2','Alea Lang','(35) 2909-3356','ligula. Nullam',200,'36482981','5662 Libero Rd.'),
  ('50072685-0','Kasimir Lawrence','(89) 8142-2782','Class aptent',329,'20228-689','240-8383 Eu St.'),
  ('66681823-4','Raphael Patrick','(28) 2963-4178','ultrices. Vivamus',81,'43915-922','P.O. Box 774, 7330 Vitae Street'),
  ('90573612-3','Maris England','(80) 6317-6258','Pellentesque habitant',308,'74789-653','914-9311 Dui Avenue'),
  ('86755849-5','Shafira Webster','(41) 1266-7227','dignissim lacus.',86,'27332-443','9615 Pede St.'),
  ('10781984-5','Patience Arnold','(54) 2579-3854','vestibulum. Mauris',207,'76717-645','618-5583 Eget Rd.'),
  ('65449764-3','Avye House','(84) 1761-5939','placerat velit.',146,'13836-774','P.O. Box 133, 7810 Phasellus Av.'),
  ('82361432-6','Dante Simpson','(81) 1159-4385','augue, eu',326,'45217-928','1903 Et Rd.'),
  ('34417232-6','Cruz Cole','(64) 5352-1990','interdum feugiat.',429,'11889-193','986-6125 Urna Street'),
  ('76657082-8','Carla Pierce','(61) 4152-8481','eleifend, nunc',184,'68487-133','P.O. Box 216, 7389 Interdum. Ave'),
  ('92879311-4','Kuame Lynn','(73) 5558-2872','amet, dapibus',362,'19710-331','P.O. Box 886, 5077 Inceptos Rd.'),
  ('80671842-3','Oren Strickland','(56) 8788-7162','pede. Suspendisse',357,'88585-891','203-973 Sit Rd.'),
  ('55925419-8','Nehru Ashley','(58) 7760-4277','neque. Nullam',374,'91891-176','414-8262 Parturient Ave'),
  ('81892372-4','Joan Keller','(57) 8398-3653','rhoncus. Nullam',258,'67543-439','336-4981 Consectetuer Ave'),
  ('42176594-0','Nasim Barry','(44) 1172-1243','primis in',342,'60715-571','793-5348 Neque. Rd.'),
  ('72550580-8','Ava Booth','(74) 1503-4214','pharetra ut,',470,'47427-828','Ap #238-3257 Ornare Road'),
  ('98842265-0','Alyssa Washington','(33) 4253-4646','et magnis',138,'37335228','Ap #558-1714 Metus. Ave'),
  ('67485373-3','Kennan Barber','(89) 5226-6076','tellus eu',327,'26264-303','620-145 A Ave'),
  ('86912594-6','Sebastian Hendricks','(34) 5210-9656','In at',135,'75730-664','Ap #862-8822 Ac Street'),
  ('36425046-8','Vivien Jordan','(84) 8157-6538','magnis dis',269,'85125-712','Ap #428-2376 Ante St.'),
  ('76039178-7','Tyler Moon','(77) 2282-5188','convallis ligula.',418,'13746-502','Ap #260-3626 Curabitur Street'),
  ('57786112-2','Shellie Decker','(64) 9149-7228','arcu. Aliquam',226,'94644-441','297-920 Odio Rd.'),
  ('46371094-6','Leroy Kerr','(78) 2234-1438','penatibus et',419,'17131-717','496-901 Fringilla. Ave'),
  ('55918872-6','Kennan May','(11) 7565-5779','erat volutpat.',105,'30158053','6202 Eu St.'),
  ('80714026-7','Kaseem Smith','(69) 6958-9618','eget, dictum',438,'65881-101','516-7194 Vel, Ave'),
  ('52372542-5','Kitra Lee','(44) 4121-7207','leo. Vivamus',424,'65455-535','1726 Nec Road'),
  ('46298743-5','Rigel Calderon','(38) 1219-6580','ipsum dolor',323,'97363-457','Ap #608-6182 Id, Ave'),
  ('65555961-2','Hiroko Delgado','(27) 0396-3561','quam quis',105,'58384-114','8785 Montes, St.'),
  ('32955282-1','Macaulay Mcgowan','(27) 1630-1352','nisi nibh',94,'68533-036','591-7167 Mi Ave'),
  ('64546883-4','Isaiah Barrera','(10) 3346-7361','nibh dolor,',114,'36222753','7414 Nisl. Avenue'),
  ('49311453-6','Brandon Montoya','(46) 5313-4996','risus quis',351,'65402-855','Ap #708-2414 Mauris Avenue'),
  ('46854920-1','Plato Larsen','(56) 2822-3864','faucibus lectus,',336,'83648-362','P.O. Box 928, 6999 Suspendisse St.'),
  ('48534460-5','Raya Richards','(84) 4724-7743','mi, ac',494,'47739-667','P.O. Box 618, 9812 Aliquet Rd.'),
  ('77177324-6','Jakeem Kim','(62) 9523-4275','eu, euismod',351,'65280-474','Ap #626-7079 Vestibulum Av.'),
  ('48464194-1','Halee Richard','(82) 9261-9301','Proin vel',434,'58878-218','3398 At St.'),
  ('77296540-9','Nash Mcgowan','(97) 4535-4851','laoreet, libero',231,'88661-681','P.O. Box 198, 9058 Ante Rd.'),
  ('81863861-7','Hunter Baldwin','(18) 1268-0259','ligula. Donec',493,'75776-398','2567 Ullamcorper. Rd.');
INSERT INTO Medico (CRM,nome,telefone,especialização,numero,CEP,rua)
VALUES
  ('53325922-2','Amena Flores','(55) 1046-2768','urna et',248,'74707-247','Ap #229-1445 Mauris Road'),
  ('65108628-5','Hakeem Richard','(66) 4743-7037','enim. Sed',417,'83478-624','2575 Curabitur St.'),
  ('84358453-8','Seth Barton','(70) 1256-0992','Mauris quis',369,'55335-163','Ap #240-8740 Blandit Rd.'),
  ('91525818-8','Quemby Vaughan','(77) 3481-5336','risus. Nunc',446,'89756-133','P.O. Box 941, 7495 Fringilla. Street'),
  ('33144247-5','Myra Ford','(53) 4617-5450','dolor. Fusce',2,'89424-835','Ap #577-8509 Posuere Rd.'),
  ('47011643-4','Quintessa Ray','(27) 2661-4115','neque pellentesque',180,'15307-802','P.O. Box 117, 4497 Nam Ave'),
  ('41340426-3','Murphy Swanson','(46) 7680-2652','est, mollis',307,'21481-617','583-5117 Velit. St.'),
  ('15283763-6','Gavin Curtis','(86) 6141-4767','vulputate, nisi',500,'22551-251','105-239 Non St.'),
  ('38139685-1','Perry Avila','(13) 3709-6247','auctor, velit',322,'65629-718','4132 Sit Av.'),
  ('31447454-4','Fritz Lucas','(61) 3316-1464','et pede.',125,'58846-885','198-5671 Nec, St.'),
  ('55218074-6','Adrian Barber','(65) 0377-0481','fringilla. Donec',190,'91616-114','P.O. Box 431, 8644 Ipsum St.'),
  ('29525446-7','Nehru Munoz','(70) 3661-8687','Morbi quis',195,'98627-344','P.O. Box 706, 7385 Elit St.'),
  ('55583742-3','Arsenio Snyder','(69) 7237-4612','Maecenas mi',25,'82524-725','143-439 Egestas Rd.'),
  ('11272494-8','Donovan Owen','(86) 2418-3268','Curabitur sed',175,'25882-994','537-4836 Eros. Ave'),
  ('68468547-4','September Gamble','(89) 2888-4881','rutrum, justo.',256,'40781-264','633-6894 Eget Rd.'),
  ('24871016-4','Hector Cohen','(36) 8118-0313','tristique pharetra.',12,'67685-754','Ap #380-4700 Cursus Av.'),
  ('66713757-8','Gareth Jimenez','(32) 7385-7234','Integer sem',464,'68335-062','471-4805 Aliquam Ave'),
  ('42247578-9','Cassady Burris','(48) 0552-7643','natoque penatibus',370,'58832-248','Ap #660-5545 Vulputate, St.'),
  ('66871356-6','Stuart Leonard','(44) 2466-2646','tellus sem',216,'21415-683','883-710 Velit Ave'),
  ('30321128-5','Hoyt Hess','(79) 3688-3875','placerat velit.',353,'81326-104','4924 Arcu. Rd.'),
  ('24049467-4','Nadine Pate','(40) 1522-6342','eget, volutpat',260,'56401-342','P.O. Box 514, 3564 Ipsum Av.'),
  ('20774418-6','Nayda Hobbs','(83) 8340-8651','orci. Ut',247,'30385267','911-3714 Neque. Street'),
  ('78787776-8','Catherine Alvarado','(51) 9775-3571','in felis.',76,'47821-483','830-692 Metus Rd.'),
  ('43223513-6','William Merritt','(33) 9988-5377','libero et',408,'94355-221','263-5358 Faucibus. Street'),
  ('35927846-6','Rajah Bradley','(61) 4143-4320','placerat, orci',161,'44083-681','P.O. Box 882, 9380 Tempus, Avenue'),
  ('93126517-4','Zane Conway','(97) 9169-4212','mi fringilla',140,'54716-659','Ap #961-4025 Nec Road'),
  ('77413611-6','Callie Downs','(74) 8646-7846','dolor quam,',316,'67324-342','P.O. Box 235, 6753 Nonummy Ave'),
  ('16285644-2','Emmanuel Sheppard','(55) 5322-7441','odio semper',190,'67272-131','294-6606 Arcu Rd.'),
  ('84132887-6','Wayne Reyes','(10) 5314-6261','Suspendisse sed',410,'65892-374','101-4069 Turpis Avenue'),
  ('59788330-9','Abigail Harrison','(39) 7736-1498','nec ligula',128,'60070-671','249-2495 Donec Rd.'),
  ('45623451-6','Suki Brewer','(49) 0146-7227','velit. Sed',73,'65394-511','247-3944 Nibh. St.'),
  ('74004285-5','Tamekah Mason','(56) 6062-7468','enim, sit',195,'42472-753','666-4266 At Rd.'),
  ('78788231-6','Christian Castillo','(83) 4986-6572','eu sem.',251,'61034-455','583-6907 Feugiat Road'),
  ('94722436-1','Tara Dixon','(63) 3493-2673','tincidunt adipiscing.',133,'67534-361','Ap #568-6015 Eu, Rd.'),
  ('25503647-1','Kenneth Dodson','(56) 1088-0815','Phasellus at',171,'89249-524','497 Tincidunt. Avenue'),
  ('93887396-7','Wallace Holmes','(31) 8549-2393','Nunc ullamcorper,',187,'23688-575','P.O. Box 296, 8388 Turpis. St.'),
  ('33711763-1','Xenos Bradshaw','(71) 7745-3334','Etiam imperdiet',188,'80439-812','P.O. Box 581, 8008 Faucibus Rd.'),
  ('71547837-5','Bethany Garza','(59) 5453-9621','euismod mauris',304,'62674-674','Ap #641-7954 Erat Av.'),
  ('84345170-0','Camilla Marquez','(25) 7296-6367','adipiscing elit.',427,'89788-267','8140 Consectetuer Avenue'),
  ('32461712-3','Jescie Gregory','(34) 7671-1329','mollis. Integer',349,'89649-575','Ap #736-4808 Fusce Rd.'),
  ('76612478-6','Chancellor Coffey','(86) 4242-4360','Cras pellentesque.',212,'61827-177','Ap #143-9111 Tincidunt Ave'),
  ('34587416-1','Chantale Goodman','(64) 8512-7227','tellus eu',497,'87857-385','3022 Dolor Rd.'),
  ('40367985-2','Omar Patton','(98) 2472-2782','vitae purus',258,'26871-449','7725 A Avenue'),
  ('91627483-6','Tamekah Gibson','(36) 7440-2424','natoque penatibus',339,'67002-422','Ap #193-9786 Morbi Ave'),
  ('56271263-0','Griffin Boone','(85) 7657-3459','at augue',162,'44878-867','7188 Sapien Rd.'),
  ('18816212-0','Myra Trujillo','(28) 7346-6915','Vivamus molestie',237,'28430-672','Ap #335-6905 Est Ave'),
  ('42318617-2','Nayda Everett','(49) 5121-5872','natoque penatibus',436,'62063-677','292-4421 Ipsum Rd.'),
  ('75115218-7','Joelle Rodriquez','(45) 1283-3228','feugiat nec,',475,'53755-249','553-5634 Nec, Street'),
  ('40830129-1','Ginger Cohen','(88) 6167-0362','imperdiet ornare.',232,'89005-256','P.O. Box 566, 3074 Nec Ave'),
  ('50532517-3','Cooper Mcconnell','(68) 0377-0448','nec urna',263,'91333-274','Ap #612-2359 Enim, Av.');

--> Dados de Exame
INSERT INTO Exame (medicoCRM,pacienteCPF,valor_exame,descrição,data,resultado)
VALUES
  ('28528430-9','974.794.264-70','70.06',
   'tempor erat neque non quam.
   Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas',
   '10/13/2022','a mi fringilla mi lacinia mattis. Integer eu lacus.'),
  ('61538681-6','974.794.264-70','87.84','feugiat non, lobortis quis, pede.','10/27/2023',
   'pretium neque. Morbi quis urna. Nunc quis arcu vel'),
  ('40782624-2','733.367.165-66','119.22','lectus rutrum urna, nec luctus felis purus ac',
   '08/23/2023','ac mattis velit justo'),
  ('40782624-2','151.651.453-32','131.18',
   'libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit.',
   '09/26/2023','eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit');

--> Dados de Consulta
INSERT INTO Consulta (pacienteCPF,descrição,diagnóstico,valor_consulta,data,medicamento)
VALUES
  ('123.856.365-52','Donec egestas. Duis ac','magnis dis parturient montes, nascetur ridiculus mus.
   Aenean eget magna. Suspendisse tristique neque',
   '105.52','03/02/2022','lorem, auctor quis, tristique ac, eleifend vitae,'),
  ('844.351.618-86','lectus pede, ultrices a, auctor non, feugiat nec, diam.
   Duis mi enim, condimentum eget, volutpat ornare,',
   'libero. Proin sed turpis nec','130.52','08/15/2023','sed, facilisis vitae, orci. Phasellus dapibus quam'),
  ('756.626.844-84','eu nibh','quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et',
   '21.11','12/29/2021','feugiat. Lorem ipsum dolor sit amet, consectetuer'),
  ('797.407.361-27','Nullam velit dui, semper et, lacinia vitae, sodales at, velit.
   Pellentesque ultricies dignissim lacus.
   Aliquam rutrum lorem ac risus.','eu turpis. Nulla','104.07','10/16/2023',
   'dictum. Proin eget odio. Aliquam vulputate ullamcorper'),
  ('497.330.372-98','risus. Nulla',
   'est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in',
   '85.02','08/08/2022','Phasellus elit pede, malesuada vel, venenatis vel,'),
  ('028.328.216-26','In at pede. Cras vulputate velit eu sem.',
   'magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit.','80.43','09/25/2022',
   'consequat auctor, nunc nulla vulputate dui, nec'),
  ('251.277.224-51','cubilia Curae Phasellus',
   'tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
   '90.87','09/17/2022','tellus id nunc interdum feugiat. Sed nec'),
  ('550.116.116-86','sollicitudin adipiscing ligula. Aenean gravida nunc sed','arcu. Sed eu nibh',
   '102.53','07/08/2022','In nec orci. Donec nibh. Quisque nonummy'),
  ('355.144.983-39','Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim.',
   'dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est',
   '83.00','04/15/2022','luctus, ipsum leo elementum sem, vitae aliquam'),
  ('675.245.462-24','sit amet, consectetuer adipiscing elit. Curabitur sed',
   'urna justo','65.48','12/15/2022','egestas. Aliquam fringilla cursus purus. Nullam scelerisque');

--> Dados de Faz_Consulta
INSERT INTO Faz_Consulta (PKFK_medicoCRM,PKFK_consultaID,valor_medico)
VALUES
  ('65449764-3',1,'29.43'),
  ('65449764-3',2,'21.02'),
  ('82361432-6',3,'45.56'),
  ('34417232-6',4,'53.28'),
  ('76657082-8',4,'38.16'),
  ('92879311-4',4,'75.86'),
  ('80671842-3',5,'54.81'),
  ('80671842-3',8,'32.80'),
  ('42176594-0',9,'62.79'),
  ('98842265-0',10,'52.05'),
  ('98842265-0',6,'22.00'),
  ('98842265-0',7,'31.75'),
  ('52372542-5',7,'12.55');

-- Seleciona tudo de todas as tabelas
SELECT * FROM Medico;
SELECT * FROM Paciente;
SELECT * FROM Consulta;
SELECT * FROM Exame;
SELECT * FROM Faz_Consulta;

-- Procurar todas as informações de um médico específico
SELECT * FROM Medico WHERE numero = 431;

-- Procurar nome, especialização e os primeiros dígitos do telefone de um médico específico
SELECT nome, especialização, LPAD(telefone, 9, '*') FROM Medico WHERE numero = 431;

-- Mostrar crm, nome e especialização dos médicos (com Camel Case)
SELECT crm, nome, INITCAP(especialização) FROM Medico;

-- Mostrar clientes que moram na rua que contém a palavra "Street"
SELECT * FROM Paciente WHERE rua LIKE '%Street%';

-- Mostrar clientes que moram na rua que não contém a palavra "Street"
SELECT * FROM Paciente WHERE rua NOT LIKE '%Street%';

-- Inserir a especialização do médico em UPPERCASE
INSERT INTO Medico VALUES
	('57708574-4', 'Tarik Dotson', '(22) 9567-5824', UPPER('porttitor vulputate'), 234, '63949-701', '244-607 Ut, Avenue');
SELECT * FROM Medico WHERE crm = '57708574-4';

-- Selecionar todos os pacientes que não possuem número de casa
SELECT * FROM Paciente WHERE numero IS NULL;

-- Mostrar crm, nome e especialização dos médicos (com lower case)
SELECT crm, nome, LOWER(especialização) FROM Medico;

-- Seleciona o registro na Faz_Consulta que possui o maior valor em 'valor_medico'
SELECT * FROM Faz_Consulta WHERE valor_medico = (
	SELECT MAX(valor_medico) FROM Faz_Consulta
);

-- Seleciona as informações do médico que possui o menor valor em 'valor_medico' na tabela Faz_Consulta
SELECT * FROM Medico WHERE CRM = (
	SELECT PKFK_medicoCRM FROM Faz_Consulta WHERE valor_medico = (
		SELECT MIN(valor_medico) FROM Faz_Consulta
	)
);

-- Mostra a soma dos valores das consultas
SELECT SUM(valor_consulta) FROM Consulta;
-- Mostra a média dos valores das consultas
SELECT AVG(valor_consulta) FROM Consulta;
-- Mostra a quantidade de registros de consultas
SELECT COUNT(*) FROM Consulta;

-- Seleciona os registros de consultas com valores maiores do que R$100,00
SELECT * FROM Consulta WHERE valor_consulta > 100;

-- Deletando registro de determinado médico
DELETE FROM Medico WHERE CRM = '57708574-4';

-- Atualizando o médico realizador de um determinado exame
SELECT * FROM Exame WHERE ID_exame = 3;
UPDATE Exame SET medicoCRM = '80671842-3' WHERE ID_exame = 3;
SELECT * FROM Exame WHERE ID_exame = 3;

-- Seleciona informações dos médicos que estão referenciados na tabela 'Exame'
SELECT Exame.medicoCRM AS CRM, Medico.nome, INITCAP(Medico.especialização) AS Especialização
FROM Exame, Medico WHERE Exame.medicoCRM = Medico.CRM;

-- Utilizando BETWEEN...AND... para buscar exames com valores entre 100 e 150 reais
SELECT * FROM Exame WHERE valor_exame BETWEEN 100 AND 150;

-- Seleciona os pacientes resgistrados que moram em uma casa de número primo (ATÉ NO MÁXIMO 100)
SELECT * FROM Paciente
WHERE numero IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,53, 59, 61, 67, 71, 73, 79, 83, 89, 97);

-- Utilizando BETWEEN...AND... para buscar exames com valores que não estão entre 100 e 150 reais
SELECT * FROM Exame WHERE valor_exame NOT BETWEEN 100 AND 150;

-- Seleciona os pacientes resgistrados que NÃO moram em uma casa de número primo (ATÉ NO MÁXIMO 100)
SELECT * FROM Paciente
WHERE numero NOT IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47,53, 59, 61, 67, 71, 73, 79, 83, 89, 97)
AND numero BETWEEN 0 AND 100;

-- Seleciona CPF e nome de pacientes que possuem um número de casa válido
SELECT CPF, nome FROM Paciente WHERE numero IS NOT NULL;

-- Faz o cálculo do valor da consulta que foi para o hospital
SELECT 
	(Consulta.ID_consulta) AS ID_consulta,
	(Consulta.valor_consulta) AS valor_TOTAL,
	(Faz_Consulta.valor_medico) AS valor_medico,
	(Consulta.valor_consulta - Faz_Consulta.valor_medico) AS valor_hospital
FROM Consulta, Faz_Consulta;

-- Seleciona todos os pacientes que não começam com 'Ezra' no nome
SELECT * FROM Paciente WHERE SUBSTR(nome, 1, 4) <> 'Ezra';

-- Seleciona todos os pacientes que começam com a letra 'A' ou 'E'
SELECT * FROM Paciente WHERE SUBSTR(nome, 1, 1) = 'A' OR SUBSTR(nome, 1, 1) = 'E';

-- Mostra valores de exame com desconto de 15%
SELECT ID_exame, pacienteCPF, valor_exame, valor_exame * 0.85 "valor_exame com desconto" FROM Exame;

-- Faz uma associação entre os nomes e CPFs dos pacientes
SELECT (nome || ' <=> ' || CPF) "Associação nome e CPF" FROM Paciente;

INSERT INTO Paciente
    (CPF,nome,telefone,data_de_nascimento) 
  VALUES 
    ('586.426.767-47','Serena Travis de Souza','(75) 8875-2962','10/23/2022');
SELECT * FROM Paciente WHERE numero IS NULL;

-- "Substitui" os valores nulos escolhidos por meio da função COALESCE
SELECT nome, numero, COALESCE(CEP, 'SEM CEP') AS CEP, COALESCE(rua, 'SEM RUA') AS RUA
FROM Paciente WHERE numero IS NULL;

-- Elimina linhas duplicadas com nomes que tenham os primeiros quatro caracteres iguais
SELECT DISTINCT(SUBSTR(nome, 1, 4)) "Inicial_do_nome" FROM Paciente;

-- Exibindo a consulta por ordem alfabética no nome (crescente e decrescente)
SELECT nome FROM Paciente ORDER BY nome;
SELECT nome FROM Paciente ORDER BY nome DESC;

-- Atualizar data de nascimento de determinado CPF
UPDATE Paciente SET data_de_nascimento = '10/22/2022' WHERE CPF = '586.426.767-47';

-- Facilitar a visualização de pacientes que moram na mesma casa
SELECT numero, COUNT(*) FROM Paciente GROUP BY numero;

-- Mostra todos os números de casa que aparecem mais de uma vez nos registros dos pacientes
SELECT numero, COUNT(*) AS Quantidade FROM Paciente GROUP BY numero
HAVING COUNT(*) > 1;

-- Mostra todos os números de casa que aparecem mais de uma vez nos registros dos pacientes
-- Em que o número da casa é um número ímpar
SELECT numero, COUNT(*) AS Quantidade FROM Paciente GROUP BY numero
HAVING COUNT(*) > 1 AND (numero % 2) <> 0;

-- Seleciona atributos de Exame com formatação aplicada ao valor (para valor_exame e data)
SELECT ID_exame AS "ID_exame", CONCAT('R$ ', valor_exame) "Valor real", CONCAT(data, ' (AAAA/MM/DD)') "Data" FROM Exame;

------> Operações de conjuntos
UNION (elimina registros duplicados)
SELECT CRM, nome, telefone, numero, cep, rua FROM Medico
UNION
SELECT CPF, nome, telefone, numero, cep, rua FROM Paciente;

-- UNION ALL (NÃO elimina registros duplicados) (Melhor performance da aplicação)
SELECT CRM, nome, telefone, numero, cep, rua FROM Medico
UNION ALL
SELECT CPF, nome, telefone, numero, cep, rua FROM Paciente;

-- UNION ALL com aplicação do NULL para Pacientes (que não tem especialização)
SELECT CRM, nome, telefone, numero, cep, rua, especialização FROM Medico
UNION ALL
SELECT CPF, nome, telefone, numero, cep, rua, 'SEM VALOR' FROM Paciente;

-- INTERSECT
Procura Médicos com número de casa > 250 e que NÃO moram na rua que possui a string 'Street'
SELECT nome, telefone, numero, cep, rua FROM Medico
WHERE numero > 250
INTERSECT
SELECT nome, telefone, numero, cep, rua FROM Medico
WHERE rua LIKE '%Street%';

-- EXCEPT
-- Procura Médicos com número de casa > 250 e que moram na rua que possui a string 'Street'
SELECT nome, telefone, numero, cep, rua FROM Medico
WHERE numero > 250
EXCEPT
SELECT nome, telefone, numero, cep, rua FROM Medico
WHERE rua LIKE '%Street%';

-- Junção de vários operadores
(SELECT CRM, nome, telefone, numero, cep, rua FROM Medico)
UNION ALL
(SELECT CPF, nome, telefone, numero, cep, rua FROM Paciente)
EXCEPT
(SELECT CRM, nome, telefone, numero, cep, rua FROM Medico WHERE rua IS NULL OR rua NOT LIKE '%Street%')
EXCEPT
(SELECT CPF, nome, telefone, numero, cep, rua FROM Paciente WHERE rua IS NULL OR rua NOT LIKE '%Street%');
