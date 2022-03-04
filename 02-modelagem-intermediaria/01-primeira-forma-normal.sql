/* 1- Todo campo vetorizado se tornará outra tabela

    (elementos da mesma família)
    [AMARELO, AZUL, LARANJA, VERDE] -> CORES
    [KA, FIESTA, UNO, CIVIC] -> CARROS

*/


/* 2- Todo campo multivalorado se tornará outra tabela

    (campo divisível)
    [RUA ABC - COPACABANA - RIO DE JANEIRO - RJ] -> RUA, BAIRRO, CIDADE, ESTADO

*/


/* 3- Toda tabela necessita de pelo menos um campo que identifique cada registro como único

    (primary key)
    O CPF pode não ser uma boa chave (pode mudar a forma de identificar pessoas no BR)

*/

/*
 Aplicando as regras, temos um novo modelo para CLIENTE e novas tabelas: TELEFONE e ENDERECO
 (para atender ao requisito de armazenar múltiplos telefones para cada pessoa)
*/
