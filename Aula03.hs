module Aula03 where
    -- tipar função e como criar nossos próprios tipos
    
    
    -- como eu tipo? assim
    dobro :: Double -> Double
        -- dobro: nome da função
        -- double = parametro ->
        -- double = expressao
    
    -- exemplo 01
    dobro x = 2*x
        -- dobro: nome da função
        -- x = parametro 
        -- 2 * x = expressao
        
    -- parametro tipado pelo primeiro.
        -- QUAL O TIPO DA FUNÇÃO DOUBLE?
            -- Double -> double ===== função que recebe um double e retorna um double.
    -- Por enquanto, numero de flechas é o numero de parametro
    
    -- EXEMPLO 02 (soma de inteiros), poderia ter um double no meio.
        --   V      V       V   Retorno
    somar :: Int -> Int -> Int -> Int
    somar x y z = x + y + z
        -- O HASKELL NÃO FAZ NENHUM TIPO DE COESSAO, TRANSFORMAR NA HORA. SE VC QUER CORREÇÃO DE TIPO, VOCÊ FAZ.
        
    -- Exemplo 03
    f :: String -> Int
    f ls = 1 + length ls -- Ele pega o tamanho da lista e retorna em numero inteiro
    -- ls e String = parametro
    -- (1 + length ls) e Int = expresao
    
    -- NA PROVA VAI CAIR UM EXERCÍCIO ASSIM "DÊ UM TIPO"
    
    -- A PARTIR DE HOJE, TODAS AS FUNÇÕES DEVEM TER ANOTAÇÕES;
        -- DAR UMA LIDA SOBRE ELMER
        
    -- EXERCICIO 01.
    foo :: Int -> Int -> Bool
    foo x n = x /= n
        -- foo = nome da função
        -- x, n = parametros
        -- x /= n = expressao
        
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- CRIAR NOSSOS TIPOS DE FUNÇÃO
{-
    Criando o tipo de função
-}
    data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Eq, Show, Enum)
        -- 8 valores
        -- conjunto de valores que vai restringir alguma computação 
            -- tipo de enumeração, nome "goumret" pra inteiro, 0 1 2 3 4 5 6, só que não faz sentido usar "dia 1"
                -- Tipo uma ENUM, finito
                
            -- | é um "ou", mas não booleano, mas é uam SOMA ENTRE VALORES DE TIPO
            -- SUM TYPE
            
        -- MULTIPLICAÇÃO DE TIPO ==== TUPLA
            -- Se TUPLA é multiplicação, o que são listas?
                -- polinomio de grau infinito // PENSA AI, vai ganhar um ponto
                    -- MOSTRAR PQ DA UM POLINOMIO INFINITO
    
        {-
            DIA = DATA CONSTRUCTOR OU (TIPO)
            DOMINGO, SEGUNDA, TERCA, QUARTA, QUINTA, SEXTA, SABADO = VALUE CONSTRUCTOR OU (VALOR)
            
            VALUE CONSTRUCTOR DOS INTEIROS = SÃO OS NUMEROS
            DOS DIAS = DIAS DA SEMANA
            SOZINHO = UNIDADE
        -}
    data Sozinho = Sozinho
    -- Tipo de um Valor
        -- Dois valores
    
    data Nada -- não vamos usar em aula
    -- Tem exatamente um valor.
        -- Representa um ausência de computação (os outros também tem)
            -- AUSENCIA DE COMPUTAÇÃO É O QUE DA BUG
    -- type safity, criar um clliente valido e cliente invalido, validações em tempo de compilação
    
    
    -- O tipo tá cru, não sabe fazer igualdade com esse tipo, como resolver?
        -- Deriving "EQ" = igualdade
        -- Deriving "SHOW" = mostrar
        -- Deriving "ENUM" = Posso lidar como uma lista 
            -- [Domingo .. Sexta]
            
    -- enumeração matematica = escrever numeros do lado, como uma função dos numeros que vc quer
        -- Double é uma numeração
        
    -- AGORA QUE EU FIZ UM TIPO, EU CONSIGO FAZER UMA FUNÇÃO
    
   
    agenda :: Dia -> String
    --agenda x = "Dia de cinema" -- Posso fazer condicional? Posso, mas não vou
    agenda Segunda = "Dia de cinema"
    agenda Quarta = "Dia de futebol"
    agenda Quinta = "Dia de Praça é Nossa"
    agenda Sexta = "Dia da Maldade"
    agenda Sabado = "Dia de Boku no Hero"
    agenda _ = "Dia de nao fazer nada"
    
    -- Pattern Matching = Descontruir o tipo e resolver a variavel
        -- Ele vai procurar (terça ou domingo), o X é o nosso default. Nenhuma referência no X, então posso mudar pra _
            -- IF E CASE É FEITO DENTRO DA FUNÇÃO, ISSO AQUI NÃO É DENTRO, É NA ENTRADA DA INFORMAÇÃO.
            -- SÓ TEM NESSA LINGUAGEM
    
    {-
        ------------------------------------------- PATTERN MATCHING ----------------------------------------------
        "Encaixar padrão", testa um padrão na entrada de uma função. O padrão desconstroi um tipo revelando sua estrutura e seus valores. Pode ter uma estrutura por trás? Sim
        
        AGENDA = Nome da função
        DIA, SEGUNDA, TERÇA, QUARTA, QUINTA, SEXTA, SABADO, _ = PARAMETROS, onde os dias são fixos e o _ varia
        STRING, "Dia da Cinema", "Dia de futebol" = VALUE, EXPRESSAO
    -}
    
    
    -- _________________________________________ EXERCICIO ____________________________________________
    -- Faça  uma função que converta os Dias para Ints. Segunda vale 1, Terca 2 ... Domingo 7
    num :: Dia -> Int
    num Segunda = 1
    num Terca = 2
    num Quarta = 3
    num Quinta = 4
    num Sexta = 5
    num Sabado = 6
    num Domingo = 7
    
    
    -- CRIE UM TIPO DAY QUE CONTENHA OS 7 DIAS DA SEMANA EM INGLES. IMPLEMENTE A FUNÇÃO TRADUZIRPI QUE RECEBE OS DIAS EM PORTUGUES E OS TRADUZA PARA O INGLES
    data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Eq, Show, Enum)
    calendar :: Dia -> Day
    calendar Domingo = Sunday
    calendar Segunda = Monday
    calendar Terca = Tuesday
    calendar Quarta = Wednesday
    calendar Quinta = Thursday
    calendar Sexta = Friday
    calendar Sabado = Saturday
    
    {-
        TIPOS MULTIPLICATIVOS
        Multiplicação de String entre Tuplas
    -}
    data Curso = SI | ADS | Log | GE | GP deriving Show -- 5 value constructor, 0 campos
    data Aluno = Aluno String Int Curso deriving Show  -- 1 value constructor, 3 campos
    -- Multiplicativo, é uma tupla gourmet. Imita uma tupla dando um contexto. Registros numa tabela 
    -- Aluno = Aluno, @contexto tendo uma representação de Aluno
        -- Aluno
        -- Value Constructor = Aluno
        -- @contexto = CAMPOS, campo1, campo2...
        
    -- PATTERN MATCHIN PRO TIPO MULTIPLICATIVOS
    aniversario :: Aluno -> Aluno
    -- aniversario x = x + 1, não rola
    aniversario (Aluno nome idade curso) = Aluno nome (idade+1) curso
                    -- variaveis
    -- Aluno e (Aluno nome idade curso) = parametro
    -- Aluno e Aluno nome (idade+1) curso = expressao
    
    -- Exemplo 01 = Transferir
    transferir :: Aluno -> Aluno
    transferir (Aluno nome idade SI) = Aluno nome idade ADS
    transferir (Aluno nome idade ADS) = Aluno nome idade SI
    transferir x = x
    {-
        *Aula03> aniversario (Aluno "Nilson" 22 SI)
        Aluno "Nilson" 23 SI
        
        *Aula03> transferir (Aluno "Nilson" 22 SI)
        Aluno "Nilson" 22 ADS
        
        *Aula03> aniversario  ( aniversario (Aluno "Nilson" 22 SI) )
        Aluno "Nilson" 24 SI
        
        *Aula03> transferir ( aniversario  ( aniversario (Aluno "Nilson" 22 SI) ))
        Aluno "Nilson" 24 ADS
    -}
    
    -- :t (Aluno "Nilson" 22 ADS) ==== Aluno
    -- :t ("Nilson", 22, ADS) ==== Num t => ([Char], Int, Curso)
    
    
    -- CARTAS
    data Naipe = Ouros | Espadas | Copas | Paus deriving (Enum, Show) -- SO PODE SOMA
    data Valor = As | Dois | Tres | Quatro | Cinco | Seis | Sete | Oito | Nove | Dez | Valete | Rainha | Rei deriving (Enum, Show) -- SÓ PODE EM SOMA
    data Carta = Carta Valor Naipe deriving Show -- TIPO MULTIPLICATIVO, NÃO PODE
        -- Naipe e Valor = Data Construct, nome do tipo
        -- Ouros....... Verde
        -- Data Carta = 1 construct, 2 campos
    
    -- let cartas = [Carta valor naipe | valor <- [As .. Rei], naipe <- [Ouros .. Paus]]
    
        -- lista = polinomial de grau infinito
        -- tupla = tipo multiplicativo
        
    -- EXERCICIO 03 
        -- FAÇA UMA FUNÇÃO QUE RECEBA UMA CARTA E RETORNE SE ELA É PRETA OU VERMELHA
            
            {-
              ----------  PROVA: EXERCICIO PRA DAR TIPO E OUTRO PATTERN MATCHING --------
            -}