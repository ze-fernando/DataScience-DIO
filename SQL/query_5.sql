SELECT Produto.descricao, EstoqueHasProduto.quantidade
FROM Produto
JOIN EstoqueHasProduto ON Produto.idProduto = EstoqueHasProduto.produtoId
WHERE EstoqueHasProduto.quantidade < 10
ORDER BY EstoqueHasProduto.quantidade ASC;
