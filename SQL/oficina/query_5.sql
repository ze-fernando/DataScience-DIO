SELECT idCliente, COUNT(*) AS totalPedidos 
FROM Pedido 
GROUP BY idCliente 
HAVING totalPedidos > 5;
