-- queries

 -- Select statement 
select * from cliente;
select * from forma_pagamento;
select * from conta_fisica;
select * from conta_juridica;
select * from pagamento_pix;
select * from pagamento_cartao;
select * from estoque;
select * from produto;
select * from produto_disponivel_estoque;
select * from disponibilizando_produto;
select * from fornecedo;
select * from vendedor;
select * from vendedor_e_produto;
select * from categoria;
select * from pedido;
select * from pedido_e_produto;
select * from empresa_frete;
select * from entrega;


-- WHERE Statement
select * from produto
where valor_unitario > 1000;

-- ORDER BY
select * from cliente
order by nome desc;

-- HAVING Statement
select * from entrega
having valor_frete >= 30;

-- junção

select  p.nome,
		p.valor_unitario,
		e.local,
        e.responsavel
from produto p
left join produto_disponivel_estoque pe
on p.id_produto = pe.produto_id_produto
join estoque e
on pe.estoque_id_estoque = e.id_estoque;


-- Quantos pedidos foram feitos por cada cliente?
select  c.nome,
		p.status,
        count(p.id_cliente) as 'Quantidade de pedido'
from cliente c
join pedido p
on c.id_cliente = p.id_cliente
group by p.id_cliente;


-- Algum vendedor também é fornecedor?
select  v.nome_vendedor,
		f.cnpj
from vendedor v
join fornecedo f
on v.cpf_cnpj = f.cnpj;

-- Relação de produtos fornecedores e estoques
select  p.nome,
		f.razao_social,
        f.cnpj,
        e.local,
        pde.quantidade
from produto p
left join disponibilizando_produto dp
on p.id_produto = dp.produto_id_produto
left join fornecedo f
on dp.fornecedo_id_fornecedo = f.id_fornecedo
left join produto_disponivel_estoque pde
on p.id_produto = pde.produto_id_produto
join estoque e
on pde.estoque_id_estoque = e.id_estoque;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select  f.nome_fornecedor,
		p.nome
from fornecedo f
left join disponibilizando_produto dp
on f.id_fornecedo = dp.fornecedo_id_fornecedo
join produto p
on dp.produto_id_produto = p.id_produto;
