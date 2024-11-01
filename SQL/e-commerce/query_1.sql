SELECT Cliente.idCliente, Cliente.identificacao, COUNT(Pedido.idPedido) AS TotalPedidos
FROM Cliente
JOIN Pedido ON Cliente.idCliente = Pedido.clienteId
GROUP BY Cliente.idCliente, Cliente.identificacao;
