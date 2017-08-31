module Aula04 where
{-
    Exemplo, tipo SOMA

    data Correncia = Libra | Euro | Dollar | Real deriving Show -- Tipo Soma, "TIPO NUMERAÇÂO" só funciona se não houver CAMPO, coisas FINITAS.
            -- Linguagem de programação, cor, correncia, etc.
            
    -- Value Constructor = 4
    --data Dinheiros = Dinheiro Double Correncia 
                    -- | Moeda  Double  Correncia 
                    -- | Nada          deriving Show -- Composto por um valor e uma correncia, tipo multiplicativo.
                            -- Value Constructor = 3
                            -- Double e Correncia = CAMPOS
                                -- DICA, se eu não tenho | antes de um VALUE CONSTRUCTOR, é um CAMPO.
                            -- NADA, ausência de dinheiros = sem valor e sem correncia.
                                -- 0 EURO e NADA são coisas diferentes.
        
    
    -- DÊ TIPO = o AZUL, o :t pega o lado direito e responde com a esquerda
    -- :t (Dinheiro 10 Libra) ---------->>> a resposta é DINHEIRO, análise de TIPO.
    -- :t = recebe o Value Constructor e seus campos, mas a resposta é o TIPO. ---->>>> DINHEIRO, no caso
    
    
    -- :t MOEDA (Moeda 0.5 Dollar) ---------------> Dinheiro
    -- :t NADA -----------------------------------> Dinheiro
    
    -- Vai cair um exercício só disso "TIPAGEM"
    
    
    {-
        --------------------------------------------------- VAMOS NOMEAR OS CAMPOS --------------------------------------------------- 
        -- RECORD SYNTAX (3.3): ABRIR CHAVE E DAR NOME PRO CAMPO
            * São os nomes definidos do TIPO. Esses nomes agem similarmente aos "GETS" da POO. 
            * Esses nomes são chamados de FUNÇÃO DE PROJEÇÃO.
            -- Extraísse o Campo da Tabela.
    -}
    
    data Dinheiro = Dinheiro { valor :: Double, 
                                curr ::  Correncia } deriving Show
                                
-- NÃO ESQUECE DE TIPAR A ENTRADA
    
    -- valor (Dinheiro 9 Real) === 9.0
        -- VALOR -> NOME DA FUNÇÃO
        -- (DINHEIRO 9 REAL) = PARAMETRO
        -- 9.0 = EXPRESSAO   (*)
        
    -- curr (Dinheiro 9 Real) ===== Real
        -- curr -> NOME DA FUNÇÃO
        -- DINHEIRO 9 REAL -> Parametro
        -- Real = Expressao  (*)
        
    -- :t valor ================== Dinheiro -> Double
        -- valor -> NOME DA FUNÇÃO
        -- DINHEIRO -> Parametro
        -- Double -> Expressao  (*)
        
    -- :t curr =================== Dinheiro -> Correncia
        -- curr -> Nome da função
        -- Dinheiro -> parametro
        -- Correncia -> Expressao  (*)
        

{-
    EXEMPLOS
-}

converterReal :: Dinheiro -> Dinheiro -- Converter DINHEIRO (Dolar) em DINHEIRO (Real)
converterReal (Dinheiro x Dollar) = Dinheiro (3.15*x) Real 
converterReal (Dinheiro x Euro) = Dinheiro (3.72*x) Real
converterReal (Dinheiro x Libra) = Dinheiro (4.02*x) Real
converterReal x = x
-- Não posso usar _ nesse caso pq vou usar esse parametro do outro lado.
-}

data Correncia = Libra | Euro | Dollar | Real deriving Show

-- Record Syntax (3.3): SAO OS NOMES DOS CAMPOS
-- DEFINIDOS NO TIPO. ESSES NOMES AGEM SIMILARMENTE
-- AOS "GETS DA POO". ESSE NOMES SAO CHAMADOS DE
-- FUNCOES DE PROJECAO.
-- data Dinheiro = Dinheiro Double Correncia
data Dinheiro = Dinheiro { valor :: Double, 
                           curr  :: Correncia
                         } deriving Show

converterReal :: Dinheiro -> Dinheiro
converterReal (Dinheiro x Dollar) = Dinheiro (3.15*x) Real 
converterReal (Dinheiro x Euro) = Dinheiro (3.72*x) Real
converterReal (Dinheiro x Libra) = Dinheiro (4.02*x) Real
converterReal x = x


-- EXERCICIOS
-- 1) Dobrar um dinheiro
dobrar :: Dinheiro -> Dinheiro
dobrar (Dinheiro x y) = Dinheiro (x * 2) y

-- 2) Somar 2 dinheiros
    -- 500 Libras (4.02) e 500 Euros (3.72)
        -- Preciso converter
-- somarReal :: Dinheiro -> Dinheiro
    -- ERRADO ====== somarReal din1 din2 = Dinheiro (4.02*din1 + 3.72*din2) Real
    -- ERRADO somarReal (Dinheiro din1 y) (Dinheiro din2 k) = Dinheiro (4.02*din1) Real + Dinheiro(3.72*din2) Real
    -- ERRADosomarReal (Dinheiro din1 Libra) (Dinheiro din2 Euro) = di
-- somarReal din1 din2 = Dinheiro(valor(converterReal din1) + valor(converterReal din2)) Real
    -- RECORD SYNTAX, sem ele não conseguiria fazer essa função, extrair o valor, no caso, o VALOR

somarReal :: Dinheiro -> Dinheiro -> Dinheiro
somarReal din1 din2 = Dinheiro (valor(converterReal din1) + valor(converterReal din2)) Real 
    ------------------------------------------------    -- TESTE: somarReal (Dinheiro 5000 Dollar) (Dinheiro 5000 Libra)
------ SOMAR DOLAR, SOMAR EURO, ETC.



------------------------------------------------------------------------- LAMBDA ----------------------------------------------------------------------
-- FUNÇÃO ANONIMA, TROCA COMPORTAMENTO.
-- LAMBDA NO LIVRO.
-- QUERO FAZER UMA FUNÇÃO QUE SOMA, O LAMBDA PODE SER FEITO EM QUALQUER MOMENTO, TANTO AQUI QUANTO NO GHCI
somar :: Int -> Int -> Int
somar x y = x + y
-- SOMAR = FUNÇÃO
-- INT E INT == PARAMETRO
-- INT = LARANJA
-- X E Y = PARAMETRO
-- X + Y = EXPRESSAO

-- o lambda ---->>>>>> (\ x y -> x + y)
---- x e y = parametro
----- x+y = expressao


-- EXEMPLO DE LAMBDA NO GHCI
-- (\ x y z -> reverse x ++ " " ++ y ++ " " ++ tail z) "OLA" "ALO" "PHP"
    -- RESPOSTA: "ALO ALO HP"
    
    
    
{-
    let dobro = \x -> 2*x
    dobro 3
    6
    
    ----->  \   === significa LAMBDA
-}

{-
let dobro = (2*)
dobro 3
6
-}

{-
let m = (>0)
m 3
True
-}


{-
    let n = (<=4)
*Aula04> n 3
True
-}

{-
let f = (++" MUNDO")
let f2 = \x -> x ++ " MUNDO"
-}

-- https://ide.c9.io/romefeller/hask0




-------------------------------------------------- HIGH ORDER FUNCTION ----------------------------------------------------------------------------------------------
-- São funções que:
    -- 1) Recebem funções como parametro E / ou.
    -- 2) Retornam funções.
        -- (dava pra ver javascript, callback, funções que recebiam funções)
        
foo :: (Int -> Int)     ->      Int ->      Int -- SÃO 2 PARAMETROS, NÃO 3. A FUNÇÃO FOO RECEBE UMA FUNÇÃO!!!!!
  --  FUNÇÃO Q RETORNA        PARAMETRO     RETORNO
    --   INT
    
-- 1)
dobro :: Int -> Int
dobro x = 2*x

foo f x = x + f 1
---------- foo dobro 3
-- F = DOBRO
-- x = 3
-------------- f vai dobrar 1, x é fixo 3 (int -> int)

-- foo dobro 3 = 3 + dobro 1  ====== 3 + dobro 1 ====== 3 + ( 2 * 1 ) ==== 3 + 2 ===== 5
-- foo dobro 3 = 3 + 2
-- foo dobro 3 = 5


-- capitulo 4.2
-- 1)
goo :: (String -> String) -> String
goo f = f "OLA MUNDO" -- goo tail


-- hoo x y = 7*y - x
-- f = \y -> y
-- f y = y

hoo :: Int -> (Int -> Int     )
hoo    x   =   \y  -> 7*y - x -- lambda vai retornar uma função anonima
-- hoo = função
-- Int e X = Parametro
-- (Int -> Int) e \y -> 7*y - x = expressao

{-
    hoo x = \y -> 7*y - x
    hoo 5 = \y -> 7*y - 5
    (hoo 5) 3 = = \y -> 7*3 - 5
-}



--------------------------------------------------------------- CURRYING ----------------------------------------------------------------------
-- Suponha uma função com N parametros. O conceito do Currying nos permite manipular a função passando menos que N argumentos.
-- Exemplo: 
    -- Podemos manipular uma SOMA com um ARGUMENTO passado.
    
somarC :: Int -> Int -> Int -> Int
somarC x y z = x+y+z
-- Se a gente não coloca as informações, ele espera o valor.
    -- somarC :: Int -> Int -> Int -> Int
        -- let f = somar 1 2
            -- somar 1 2 = \z -> 1 + 2 + z
                -- MORAL, f z = 3 + z



-- VALUE CONSTRUCTOR É UMA FUNÇÃO!!!!!!!!!


-- capitulo 4.4 na proxima