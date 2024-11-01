-- Criação das tabelas

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    cnpj VARCHAR(45) UNIQUE
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY,
    categoria VARCHAR(45),
    descricao VARCHAR(45),
    valor FLOAT
);

CREATE TABLE TerceiroVendedor (
    idTerceiroVendedor INT PRIMARY KEY,
    razaoSocial VARCHAR(45),
    local VARCHAR(45)
);

CREATE TABLE DisponibilizacaoProduto (
    fornecedorId INT,
    produtoId INT,
    PRIMARY KEY (fornecedorId, produtoId),
    FOREIGN KEY (fornecedorId) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (produtoId) REFERENCES Produto(idProduto)
);

CREATE TABLE ProdutosVendedor (
    idTerceiroVendedor INT,
    idProduto INT,
    quantidade VARCHAR(45),
    PRIMARY KEY (idTerceiroVendedor, idProduto),
    FOREIGN KEY (idTerceiroVendedor) REFERENCES TerceiroVendedor(idTerceiroVendedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY,
    local VARCHAR(45)
);

CREATE TABLE EstoqueHasProduto (
    estoqueId INT,
    produtoId INT,
    quantidade INT,
    PRIMARY KEY (estoqueId, produtoId),
    FOREIGN KEY (estoqueId) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (produtoId) REFERENCES Produto(idProduto)
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY,
    statusPedido VARCHAR(45),
    descricao VARCHAR(45),
    clienteId INT,
    frete FLOAT
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    identificacao VARCHAR(45),
    pJuridicaId INT,
    pFisicaId INT,
    FOREIGN KEY (pJuridicaId) REFERENCES pJuridica(idPJuridica),
    FOREIGN KEY (pFisicaId) REFERENCES pFisica(idPFisica)
);

CREATE TABLE pJuridica (
    idPJuridica INT PRIMARY KEY,
    nome VARCHAR(45),
    cnpj VARCHAR(45) UNIQUE,
    endereco VARCHAR(45)
);

CREATE TABLE pFisica (
    idPFisica INT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45) UNIQUE,
    endereco VARCHAR(45)
);

CREATE TABLE RelacaoProduto (
    quantidade VARCHAR(45),
    pedidoId INT,
    produtoId INT,
    PRIMARY KEY (pedidoId, produtoId),
    FOREIGN KEY (pedidoId) REFERENCES Pedido(idPedido),
    FOREIGN KEY (produtoId) REFERENCES Produto(idProduto)
);

CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY,
    meioPagamento VARCHAR(45),
    pedidoId INT,
    clienteId INT,
    FOREIGN KEY (pedidoId) REFERENCES Pedido(idPedido),
    FOREIGN KEY (clienteId) REFERENCES Cliente(idCliente)
);

CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY,
    dataPagamento VARCHAR(45),
    tipoCartao VARCHAR(45),
    numeroCartao VARCHAR(45),
    valor VARCHAR(45),
    pagamentoId INT,
    pedidoId INT,
    clienteId INT,
    FOREIGN KEY (pagamentoId) REFERENCES Pagamento(idPagamento),
    FOREIGN KEY (pedidoId) REFERENCES Pedido(idPedido),
    FOREIGN KEY (clienteId) REFERENCES Cliente(idCliente)
);

CREATE TABLE Boleto (
    idBoleto INT PRIMARY KEY,
    valor INT,
    parcelamento INT,
    dataVencimento DATE,
    pagamentoId INT,
    pedidoId INT,
    clienteId INT,
    FOREIGN KEY (pagamentoId) REFERENCES Pagamento(idPagamento),
    FOREIGN KEY (pedidoId) REFERENCES Pedido(idPedido),
    FOREIGN KEY (clienteId) REFERENCES Cliente(idCliente)
);

CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY,
    dataGerada DATE,
    dataEnviada DATE,
    codigoRastreio VARCHAR(45),
    dataEntrega DATE,
    pedidoId INT,
    pedidoCliente INT,
    FOREIGN KEY (pedidoId) REFERENCES Pedido(idPedido),
    FOREIGN KEY (pedidoCliente) REFERENCES Cliente(idCliente)
);

-- Inserção de dados para testes (exemplo)
INSERT INTO Fornecedor (idFornecedor, razaoSocial, cnpj) VALUES (1, 'Fornecedor A', '12345678900001');
INSERT INTO Produto (idProduto, categoria, descricao, valor) VALUES (1, 'Eletrônicos', 'Celular XYZ', 1500.00);
-- Continue inserindo dados para testes...
