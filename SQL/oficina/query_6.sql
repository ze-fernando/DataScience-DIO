SELECT Cliente.nome AS Cliente, Veiculo.modelo AS Veiculo, Servico.descricao AS Servico, Pedido.dataPedido
FROM Pedido
JOIN Cliente ON Pedido.idCliente = Cliente.idCliente
JOIN Veiculo ON Pedido.idVeiculo = Veiculo.idVeiculo
JOIN Pedido_Servico ON Pedido.idPedido = Pedido_Servico.idPedido
JOIN Servico ON Pedido_Servico.idServico = Servico.idServico
ORDER BY Pedido.dataPedido DESC;
