-- O comando UPDATE

-- Se digitar isso, todos são atualizados para esse valor
UPDATE CLIENTE SET EMAIL = 'LILIAN@HOTMAIL.COM';

-- Podemos usar o comando WHERE para filtrar na hora de atribuir
UPDATE CLIENTE SET EMAIL = 'LILIAN@HOTMAIL.COM' WHERE NOME = 'LILIAN';

-- Para o comando DELETE o funcionamento é igual
DELETE FROM CLIENTE WHERE NOME = 'ANA';
