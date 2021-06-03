INSERT INTO Cliente (Nome, Cep, Logradouro, Numero, Complemento, Bairro, Cidade, Ibge_cidade, Sigla_uf, Ibge_uf)
     VALUES ('JOSE MARIA','61907020','RUA GERALDO NERES DE SOUZA','215','','FURNA DA ONÇA','MARACANAU','2307650','CE','23')


INSERT INTO CONTATO (Nome, Data_nasc, Idade, Telefone, Id_Cliente)
     VALUES ('MARIA','1972-07-21',0,'(85)98584-6646',(SELECT MAX(ID) FROM Cliente))

INSERT INTO CONTATO (Nome, Data_nasc, Idade, Telefone, Id_Cliente)
     VALUES ('JOSE','1965-08-15',0,'(85)98828-7793',(SELECT MAX(ID) FROM Cliente))

INSERT INTO CONTATO (Nome, Data_nasc, Idade, Telefone, Id_Cliente)
     VALUES ('ANTONIO','1980-06-10',0,'(85)98821-6535',(SELECT MAX(ID) FROM Cliente))



