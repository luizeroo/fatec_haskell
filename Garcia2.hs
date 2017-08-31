module Aula2 where

import Data.List

func xs = 2 + length xs

fazNada xs = reverse (reverse xs)

fazNada2 xs = (head xs) : (tail xs)

apaga xs = reverse(tail (reverse xs))