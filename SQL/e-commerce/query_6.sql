SELECT Cliente.idCliente, Cliente.identificacao, SUM(Produto.valor * RelacaoProduto.quantidade) AS TotalGasto
FROM Cliente
JOIN Pedido ON Cliente.idCliente = Pedido.clienteId
JOIN RelacaoProduto ON Pedido.idPedido = RelacaoProduto.pedidoId
JOIN Produto ON RelacaoProduto.produtoId = Produto.idProduto
GROUP BY Cliente.idCliente, Cliente.identificacao;
