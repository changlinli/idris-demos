module Parity

data Parity : Nat -> Type where
   Even : Parity (n + n)
   Odd  : Parity (S (n + n))

parity : (n:Nat) -> Parity n
parity Z     = Even {n=Z}
parity (S Z) = Odd {n=Z}
parity (S (S k)) with (parity k)
    parity (S (S (j + j)))     | Even = rewrite plusSuccRightSucc j j in Even {n=S j}
    parity (S (S (S (j + j)))) | Odd  = rewrite plusSuccRightSucc j j in Odd {n=S j}

{-
parity_lemma_2 = proof {
    intro;
    intro;
    rewrite sym (plusSuccRightSucc j j);
    trivial;
}

parity_lemma_1 = proof {
    intro j;
    intro;
    rewrite sym (plusSuccRightSucc j j);
    trivial;
}
-}
