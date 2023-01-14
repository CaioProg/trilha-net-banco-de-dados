
SELECT * FROM Produtos

SELECT COUNT(*) QuantidadeProdutos FROM Produtos

SELECT COUNT(*) QuantidadeProdutosTamanhoM FROM Produtos WHERE Tamanho = 'M'

SELECT SUM(Preco) PrecoTotal FROM Produtos

SELECT SUM(Preco) PrecoTotalTamanhoM FROM Produtos WHERE Tamanho = 'M'

SELECT MIN(Preco) ProdutoMaisBaratoM FROM Produtos WHERE Tamanho = 'M'

SELECT MAX(Preco) ProdutoMaisCaroM FROM Produtos WHERE Tamanho = 'M'

SELECT AVG(Preco) FROM Produtos

SELECT 
	Nome + ' - ' + Cor + ' - ' + Genero NomeProdutoCompleto,
	UPPER (Nome) Nome,
	LOWER (Cor) Cor,
	FORMAT (DataCadastro, 'dd/MM/yyyy') Data 
FROM Produtos

SELECT * FROM Produtos

ALTER TABLE Produtos
ADD DataCadastro DATETIME2

ALTER TABLE Produtos
DROP COLUMN DataCadastro

UPDATE Produtos SET DataCadastro = GETDATE()


SELECT
	Tamanho,
	COUNT(*) Quantidade
FROM Produtos
WHERE Tamanho <> ''
GROUP BY Tamanho
ORDER BY Quantidade DESC


CREATE TABLE Enderecos (
	Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdCliente int NULL,
	Rua varchar(255) NULL,
	Bairro varchar(255) NULL,
	Cidade varchar(255) NULL,
	Estado char(2) NULL,

	CONSTRAINT FK_Enderecos_Clientes FOREIGN KEY(IdCliente)
	REFERENCES Clientes(Id)
)

SELECT * FROM Clientes
SELECT * FROM Enderecos

INSERT INTO Enderecos VALUES(4, 'Rua Teste', 'Bairro Teste', 'Cidade Teste', 'MG')

SELECT * FROM Clientes WHERE Id = 4
SELECT * FROM Enderecos WHERE IdCliente = 4

SELECT 
	C.Nome,
	C.Sobrenome,
	C.Email,
	E.Rua,
	E.Bairro,
	E.Cidade,
	E.Estado

FROM 
	Clientes C
INNER JOIN Enderecos E ON C.Id = E.IdCliente
WHERE C.Id = 4