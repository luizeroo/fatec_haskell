-- ' visto como caracter, " como string
    -- :t 'A'       =   vai retornar char, tipo do valor,
    -- :t "ANA"     =   vai retornar [CHAR], array de char;

-- CAPITULO DOIS
-- Pegar posição
    -- ["COBOL","PHP","JAVA","C++","C","HASKELL","PYTHON"] no prelude;
        -- fazer um nome, let ling = ["COBOL","PHP","JAVA","C++","C","HASKELL","PYTHON"]
            -- na hora de chamar, só mandar um ling
    -- Pra pegar o elemento, posso fazer um !! [posição]
            -- exemplo, ling !! 2
            
-- Inserir
    -- Somente na frente, se for em outra posição é concatenar ou uma função que insere. Funções "da base" funciona dessa forma.
        -- Inserir o 7 no 1,2,3
            -- 7 : [1,2,3]
            -- ou seja
                -- ELEMENTO na frente de uma LISTA
                    -- Resultado? outra lista.
                    
                    -- OBS: Listra no haskell só pode ser do mesmo tipo e quantos elementos eu quiser. Lista ligada.
                    
                -- 'O' : "LA", resulta em "OLA"
                    -- Um caracter em uma string, um array de char
                    
                -- "O" : ["LA"], resulta em ["O","LA"]
                
                -- "OHHS" : ["LA"], resulta em ["OHHS","LA"]
                
                -- "O" : "LA", dois vermelhos, por isso tenho que usar o ["LA"], transformar em laranja, transformar em array (array de algo).
                
    -- EXEMPLOS
        -- 'C' : 'O' : "BOL"
            -- COBOL, 
            
    -- 'B' : 'R' : 'E' : 'N' : 'D' : 'A' : []
        -- PRECISO ter essa última lista vazia, indicando o fim.
        
    -- Importante pra linguagem pq descontroi a string nessa forma, na linguagem a gente pode trabalhar dessa forma utilizando ponto (aula 4)
    -- NÃO HÁ MUDANÇAS DE ESTADO.
    
-- REMOVER
    -- :m Data.List
    module Aula02 where
    import Data.List
    
    -- ["COBOL","PHP","JAVA","C++","C","HASKELL","PYTHON"]
        -- Quero remover o PHP, então coloco 
            -- LIN \\ ["PHP"]
        -- Outra forma
            -- LIN \\ [LIN !! 2] 
            -- Ele pega a diferença entre um CONJUNTO e outro CONJUNTO, assim dando o resultado.
        -- Ele não modifica a lista, mas ele só tira do resultado e mostra no PRINT, mas ele não é alterado.
        
    -- Ele se comporta dessa forma por conta da PUREZA das funções

-- PEGAR O TAMANHO
    -- LENGTH LIN
        
        -- length 'Q', não funciona pq não é uma lista
        
    -- PEQUENAS OPERAÇÕes 
        -- 2 + LENGTH "2"
        
    tamanho xs = 2 + length xs
    
    -- Por enquanto, capítulo 2
    
-- INVERTER LISTA
    -- REVERSE "...."
        -- reverse (reverse "HASKELL") = HASKELL
        
    inverter xs = reverse (reverse xs)
    -- Trabalha com composição de funções, começando com a função de dentro, partindo pra externa.
            -- Teoria de Grupos (algebra)
            
-- HEAD
    -- Primeira posição, e somente um elemento. = CARACTER
        -- head "HASKELL"
-- TAIL
    -- Pega o resto, excluindo o primeiro. = LISTA
        -- tail "HASKELL"
-- LAST
    -- Pegar o último
-- REVERSE 

-- _____________________________ DICA ___________________________
    -- :t entrega tudo sobre funçoes e etc
-- _____________________________ DICA ___________________________


    
-- DESAFIO 
    -- Apagar a última letra
    
        -- HASKELL
            -- reverse "HASKELL" = LLESKAH
            -- tail (reverse "HASKELL")
            -- reverse (tail (reverse "HASKELL"))
    
    apaga xs = reverse  (   tail    (reverse xs))
            --  inverte    resto       inverte
    
        -- "HASKELL" \\ "L"
            -- "HASKELL"
            
    -- (head "HASKELL") : (tail "HASKELL")
        -- RESULTADO, "HASKELL"
    anexa xs = (head xs) : (tail xs)
    
-- CONCATENAR LISTAS
    -- "OLA" ++ "MUNDO"
        -- = "OLA MUNDO"
    -- Se tentar fazer com : vai dar problema pq ambas são LISTAS.
    
    -- "HA" ++ "S" ++ "KE" ++ "LL"
    -- "PHP" ++ ""
    -- "PHP" ++ " "
    
-- ______________________________ FUNCIONAL _____________________________
-- GERAR OS 200 PRIMEIROS NUMEROS
    -- [1 .. 200]
-- ALFABETO EM MAIUSCULO
    -- ['A' .. 'Z']
-- ALFABETO TODO
    -- ['A' .. 'z']
-- ALFABETO AO CONTRÁRIO
    -- ['Z','Y' .. 'A']
-- ALFABETO AO CONTRARIO DE DOIS EM DOIS
    -- ['Z','X' .. 'A']
    
-- ___________________ LIST COMPREHENSION ________________________________
    -- GERA {LISTAS} A PARTIR DE \EXPRESSÕES/, OUTRAS [LISTAS] E {FILTROS}.
    -- [\EXPRESSAO/ QUE DEPENDE x,y,z, ... |  x <- lista1,      [
    --                                      y <- lista2,        [ LISTAS
    --                                      z <- lista3,        [
    --                                      ...
    --                                      EXPRESSAO BOOLEANA 1        { BOOLEANAS
    --                                      EXPRESSAO BOOLEANA 2        {
    --                                      ...
    
    
    -- JOGO DO PIN
    -- Expressão é X
        -- [x | x <- [1 .. 40], mod x 4 /= 0]
            -- EXPRESSAO = X
            
            -- LISTA = x [1 .. 40]
            
            -- FILTRO = mod x 4 /= 0
            
                -- Posso ter uma sem FILTRO, mas sempre temos que ter EXPRESSAO e LISTA
        
        -- **************************** TROCAR O ESPAÇO NO LUGAR E COLOCAR "PIN" ********************************
    
    -- OUTRO EXEMPLO
    -- [x+3 | x <- [0,3,6,10,11], x /= 11], PRIMEIRO ROLA O FILTRO, DEPOIS AS EXPRESSOES
        -- [x+3 | x <- [0,3,6,10]]
            -- [0+3, 3+3, 6+3, 10+3]
                -- [3, 6, 9, 13]
                
-- _____________________ TUPLA _____________________________
    -- :t "SANTOS",TRUE
    -- (1, "SANTOS", 5.6, True)
        -- não posso dar head, last, reverse, pq a TUPLA não liera, não posso manipular
            -- Pra que usar? Agrupar vários TIPOS juntos.
                -- fst (3,4) = primeiro da tupla { SOMENTE PARA DOIS ELEMENTOS
                -- snd (3,4) = ultimo da tupla { SOMENTE PARA DOIS ELEMENTOS
            
                -- fst ((True,5), (9,"SANTOS")
                    --     X
                        -- Retorna, pq são duas localizações.
                        -- DUPLAS DE DIIMENSÕES 2
                        
    -- TUPLA VAZIA = UNIDADE, ()
    -- :t ()
    
    -- EXEMPLOS
        -- :t [(True, "SANTOS"), (False, "OLA"), (True, "PHP"), (False, "Kiba")]
        --      bol       str      bol     str     bol   str      bol      str 
            
            -- Uma LISTA de TUPLAS, de duas posições, com BOOLEAN e STRING. UM PADRÃO QUE SE REPETE DENTRO DA LISTA.
            
    -- EXEMPLO DE BARALHO
        -- [(valor, naipe) | valor <- "A234567890JQK", naipe <- ["OUROS","COPAS","ESPADAS","PAUS"]]
            -- let cartas = [(valor, naipe) | valor <- "A234567890JQK", naipe <- ["OUROS","COPAS","ESPADAS","PAUS"]]
                -- cartas = 52
    -- PESSOAS
        -- [(p1, p2) | p1 <- ["JOSE", "GUSTAVO", "LUCAS", "EDINHO"], p2 <- ["JOSE", "GUSTAVO", "LUCAS", "EDINHO"]]
        
        -- COM FILTRO
            -- [(p1, p2) | p1 <- ["JOSE", "GUSTAVO", "LUCAS", "EDINHO"], p2 <- ["JOSE", "GUSTAVO", "LUCAS", "EDINHO"], p1 /= p2]
            
    -- POKEMON
        -- 6 primeiros pokemons
            -- [(1, "Charmander"), (2, "Charmeleon") .. ]
            
            -- [(numero, pokemon) | numero <- [1,2,3,4,5,6], pokemon <- ["Charmander", "Charmeleon", "Charizard", "Squirtle","Warturtle","Blastoise"]] -- ERRROU
            
    {-
        let alunos  ["GABRIEL S", "RENAN", "GIOVANA", "ADRIANA", "BRUNO"]
    -}
    
    -- 2.1 e 2.5, EDSON E FELIPE
    -- 2.2, 2.4, 2.6 e 2.7, EU E GUS
            
            
            
            
            
            
            