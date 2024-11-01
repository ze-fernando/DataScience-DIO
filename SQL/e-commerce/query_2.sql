SELECT TerceiroVendedor.razaoSocial
FROM TerceiroVendedor
JOIN Fornecedor ON TerceiroVendedor.razaoSocial = Fornecedor.razaoSocial;
