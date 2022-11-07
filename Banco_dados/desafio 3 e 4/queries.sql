-- Queries 

-- 1 select 

SELECT * FROM cliente;
SELECT * FROM mao_obra;
SELECT * FROM mecanico;
SELECT * FROM mecanico_e_ordem_servico;
SELECT * FROM ordem_servico;
SELECT * FROM pecas;
SELECT * FROM veiculo;

-- 2 where
select * from cliente 
where id_cliente=2;

-- 3 order by
select * from cliente
order by nome;

-- 4  HAVING Statement
select * from ordem_servico
having valor >= 300;

-- 5 join
select  c.nome,
		v.marca,
        v.modelo
from cliente c
left join veiculo v
on c.id_cliente = v.id_cliente;


