SELECT Fornecedor.razaoSocial AS Fornecedor, Produto.descricao AS Produto
FROM Fornecedor
JOIN DisponibilizacaoProduto ON Fornecedor.idFornecedor = DisponibilizacaoProduto.fornecedorId
JOIN Produto ON DisponibilizacaoProduto.produtoId = Produto.idProduto;
