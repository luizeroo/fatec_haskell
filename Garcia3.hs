module Aula3 where

data Curso = SI | ADS | Log | GE | GP deriving Show

data Aluno = Aluno String Int Curso deriving Show

data Naipe = Ouros | Espadas | Copas | Paus deriving (Enum, Show)
data Valor = As | Dois | Tres | Quatro | Cinco | Seis
           | Sete | Oito | Nove | Dez | Dama | Valete
           | Rei deriving (Enum, Show)

data Carta = Carta Valor Naipe deriving Show

aniversario :: Aluno -> Aluno
aniversario (Aluno nome idade curso) = Aluno nome (idade+1) curso 

transferir :: Aluno -> Aluno
transferir (Aluno nome idade SI) = Aluno nome idade ADS
transferir (Aluno nome idade ADS) = Aluno nome idade SI
transferir x = x






