module Aula01 where
-- parar de rolar o GHC -> :q
-- rodar dnv = ghci
-- uma linha
{-
    bloco de texto
-}
dobro x = 2*x
-- ____________________________________________ DEFINIÇÃO ____________________________________________
{-
    dobro = nome da função
    x = parâmetro, pode ter 0 ou mais parametros
    2x* = expressao
-}
-- ____________________________________________ TESTE (ghci) ____________________________________________

-- Pra compilar :l <<nome do arquivo>>
-- pra chamar função: dobro <<parametro>>
    -- dobro x, dobro (x+2), dobro x+2
    
    -- o X se torna o argumento
    -- o retorno é o resultado
-- _______________________________________ PARA COMPILAÇÃO _______________________________________________
-- :l Modulo.hs (somente na primeira vez)
-- :r (da segunda vez em diante)


u = 7
-- u, nome da função
-- sem parametro 
-- 7, "retorno", no caso é uma constante
    -- u=8, múltipla declarações de U, vai dar problema na constante
    
x = x+1 --função recursiva
-- X, função 
-- sem vermelho
-- x+1, expressao, mas o X leva a recursão


-- [1,2,3,4,5] !! 2, vou pegar na posição[2]
-- [x,x,x,8,x,x,x,x] !! 3  vou pegar somente o 8 e esquecer os outros inteiros esquisitos (funções que não acabam)



ehPar x = if mod x 2 == 0 then True else False
ePar x = mod x 2 == 0
ehImpar x = mod x 2 /= 0
-- even pra par, odd para impar (isso no teste no ghci)

-- HOOGLE, google do haskell, https://www.haskell.org/hoogle/
    -- learn you a haskell (http://learnyouahaskell.com/)
-- o "diferente" é uma carinha triste, assim         /=

-- connect freenode irc haskell