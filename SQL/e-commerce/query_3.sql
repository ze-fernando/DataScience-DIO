SELECT Produto.descricao AS Produto, Fornecedor.razaoSocial AS Fornecedor, Estoque.local AS Estoque
FROM Produto
JOIN DisponibilizacaoProduto ON Produto.idProduto = DisponibilizacaoProduto.produtoId
JOIN Fornecedor ON DisponibilizacaoProduto.fornecedorId = Fornecedor.idFornecedor
JOIN EstoqueHasProduto ON Produto.idProduto = EstoqueHasProduto.produtoId
JOIN Estoque ON EstoqueHasProduto.estoqueId = Estoque.idEstoque;
