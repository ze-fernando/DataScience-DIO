SELECT 
    idPedido, 
    SUM(Pedido_Servico.quantidade * Pedido_Servico.precoUnitario) + 
    SUM(Pedido_Peca.quantidade * Pedido_Peca.precoUnitario) AS custoTotal 
FROM Pedido
JOIN Pedido_Servico ON Pedido.idPedido = Pedido_Servico.idPedido
JOIN Pedido_Peca ON Pedido.idPedido = Pedido_Peca.idPedido
GROUP BY idPedido;
