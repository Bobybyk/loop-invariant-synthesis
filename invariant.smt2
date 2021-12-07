; Invar prend 2 entiers et renvoie une valeure de vérité 
; pour la configuration à l'intérieur de l'invariant
(declare-fun Invar (Int Int) Bool)

; on s'assure que Invar contienne la configuration initiale
(assert (Invar 0 1))

; on vérifie que Invar soit un invariant de boucle
(assert (forall ((x Int) (y Int))
	(=> (and (Invar x y) (< x 3)) (Invar (+ x 3) (+ y 1)))))

; on s'assure que l'Invariant soit sûr : 
; si pout tout x, y dans l'invariant && x>= 10, alors y<10
(assert (forall ((x Int) (y Int ))
	(=> (and (Invar x y) (>= x 3)) (< y 3))))

; on fait appel au solveur pour vérifier la satisfiabilité
; des 3 conjonctions
(check-sat-using (then qe smt))
(get-model)
(exit)