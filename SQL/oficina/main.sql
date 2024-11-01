-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(14) UNIQUE,
    endereco VARCHAR(100),
    telefone VARCHAR(15)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(50),
    ano INT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Serviço
CREATE TABLE Servico (
    idServico INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    idCliente INT,
    idVeiculo INT,
    dataPedido DATE,
    status VARCHAR(20),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

-- Tabela Pedido_Servico
CREATE TABLE Pedido_Servico (
    idPedido INT,
    idServico INT,
    quantidade INT,
    precoUnitario DECIMAL(10, 2),
    PRIMARY KEY (idPedido, idServico),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);

-- Tabela Peça
CREATE TABLE Peca (
    idPeca INT PRIMARY KEY,
    descricao VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela Pedido_Peca
CREATE TABLE Pedido_Peca (
    idPedido INT,
    idPeca INT,
    quantidade INT,
    precoUnitario DECIMAL(10, 2),
    PRIMARY KEY (idPedido, idPeca),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    idPedido INT,
    meioPagamento VARCHAR(20),
    valorTotal DECIMAL(10, 2),
    dataPagamento DATE,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razaoSocial VARCHAR(100),
    cnpj VARCHAR(18) UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(100)
);

-- Tabela Fornecedor_Peca
CREATE TABLE Fornecedor_Peca (
    idFornecedor INT,
    idPeca INT,
    preco DECIMAL(10, 2),
    PRIMARY KEY (idFornecedor, idPeca),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
