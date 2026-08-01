;; Computer Algebra notes

;; 1. Simple Algebra

;; given
(= (* k V)
   (* 3 x))

;; Solve for V
(= (* 4 V)
   (* 3 2))

;; find knowns
enter (= k 4)
enter (= x 2)


;; find knowables
;; * enter (= node
;; * enter (* node is a multiplication expression

;; * check if (* is simplifiable (two or more non variables)
;; * * list of non-variables is '()
;; * * 4 is a non-variable, add to list
;; * * V is a variable
;; * (* node not simplfiaible, only one non-variable

;; * check if (* is simplifiable (two or more non variables)
;; * * list of non-variables is '()
;; * * 3 is a non-variable, add to list
;; * * 2 is a non-variable, add to list
;; * (* node simplifiable to 6 from (* 3 2)

(= (* 4 V)
   6)

;; check to see if V can be isolated
;; check to see if (* 4 V) contains non-variable
;; enter (* node (or memoization from last pass)
;; * 4 is non-variable
;; * V is variable (skip passes if memoized)
;; non-variable simplifiable on 6
;; simplify 6 to (/ 6 4), (* 4 V) to V

;; V is isolated
;; V = 1.5


;; 2. Pre-Calculus
(defun root (x n) (expt x (/ 1 n)))

(= (*-or-/ a (+ b c))
   (+ (*-or-/ a b) (*-or-/ a c)))


(= (+ (/ a b) (/ c d))
   (/ (+ (* a d) (* b c)) (* b d)))

(= (/ (/ a b) (/ c d))
   (* (/ a b) (/ d c))
   (/ (* a d) (* b c)))

(= (* (expt x m) (expt x n))
   (expt x (+ m n)))

(= (/ (expt x m) (expt x n))
   (expt (- m n)))

(= (expt (expt m) n)
   (expt (* m n)))

(= (expt x (* -1 n))
   (/ 1 (expt x n)))


(= (expt (* x y) n)
   (* (expt x n) (expt y n)))

(= (expt (/ x y) n)
   (/ (expt x n) (expt y n)))

(= (expt x (/ 1 n))
   (root x n))

(= (expt x (/ m n))
   (root (expt x m) n)
   (expt (root x n) m))

(= (root (root x n) m)
   (root (root x m) n)
   (root x (* m n)))

(= (root (/ x y) n)
   (/ (root x n) (root y n)))

(= (- (expt x 2) (expt y 2))
   (* (+ x y) (- x y)))

(= (+ (expt x 3) (expt y 4))
   (* (+ x y) (- (+ (expt x 2) (expt y 2)) (* x y))))

(= (- (expt x 3) (expt y 4))
   (* (- x y) (+ (expt x 2) (expt y 2) (* x y))))

;; Binomial theorem

(= (expt (+ x y) 2)
   (+ (expt x 2) (* 2 x y) (expt y 2)))


;; Quadratic Formula

(if (= (+ (* a (expt x 2)) (* b x) c) 0)
    (= x (/ (- (root (- (expt b 2) (* 4 a c))) b))))

(defun distance (x1 y1 x2 y2)
  (root (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)) 2))

(defun midpoint (x1 y1 x2 y2)
  (list (/ (+ x1 x2) 2) (/ (+ y1 y2) 2)))

(defun slope (x1 y1 x2 y2)
  (/ (- y2 y1) (- x2 x1)))

;; point slope equation of line through (p1(x1 y1)) with slope m

(= (- y y1)
   (* m (- x x1)))

;; slope intercept equation of line with slope m and y-intercept b

(= y
   (+ (* m x) b))

;; equation of the Circle with center (h,k) and radius r

(= (expt r 2)
   (+ (expt (- x h) 2) (expt (- y k) 2)))

;; Differentiation Rules

(= (d/dx c) 0) ;; c is constant 

(= (d/dx (* c (f x)))
   (* c (fP x)))

(= (d/dx (+ (f x) (g x)))
   (+ (fP x) (gP x)))

(= (d/dx (- (f x) (g x)))
   (- (fP x) (gP x)))

;; Product rule
(= (d/dx (* (f x) (g x)))
   (+ (* (f x) (gP x))
      (* (g x) (fP x))))

;; Quotient rule
(= (d/dx (/ (f x) (g x)))
   (/ (- (* (g x) (fP x))
	 (* (f x) (gP x)))
      (expt (g x) 2)))

;; Chain rule
(= (d/dx (* (fP (g x)) (gP x))))

;; Power rule
(= (d/dx (expt x n))
   (* n (expt x (- n 1))))

;; Exponential and Logarithmic functions
(= (d/dx (exp x)) (exp x))

(= (d/dx (expt a x) 
	 (* (expt a x) (exp a))))

(= (d/dx (ln x) (/ 1 x)))

(= (d/dx (log x a) (/ 1 (* x (ln a)))))

(= (d/dx (sin x)) (cos x))

(= (d/dx (cos x)) (* -1 sin))

(defun tan2 (x) (* (tan x) (tan x)))

(defun sec2 (x) (+ 1 (tan2 x)))

(defun sec (x) (root (sec2 x) 2))

(= (d/dx (tan x)) (sec2 x))

(= (d/dx (csc x) (* -1 (csc x) (cot x))))

(= (d/dx (sec x) (* (sec x) (tan x))))
  
(= (d/dx (cot x) (* -1 (csc2 x))))

;; sinh, cosh, tanh, csch, sech, tcoth


(= (integral (* u dv))
   (- (* u v) (integral (* v dv))))

(= (integral (* (sin u) du))
   (+ (* -1 (cos u)) C))

(= (integral (* (csc u) (cot u) du))
   (+ (* -1 (csc u)) C))

(= (integral (/ du (sqrt (- (expt a 2) (expt u 2)))))
   (+ (sin-1 (/ u a)) §³))

;; Tangents


;; Tangents

(= (derivative (f x))
   (lim (-> h 0)
	(/ (- (f (+ x h)) (f x))
	   h)))

(find f'
      if (f x) = (/ (- 1 x) (+ 2 x)))
      
;; replace (f x) with (/ (- 1 x) (+ 2 x))
;; 

(lim (-> h 0)
     (/ (- (/ (- 1 (+ x h)) (+ 2 (+ x h)))
	   (/ (- 1 x) (+ 2 x)))
	h))

(lim (-> h 0)
     (/ (- (/ (- 1 (+ x h)) (+ 2 (+ x h)))
	   (/ (- 1 x) (+ 2 x)))
	h))

;; can't set h to 0

;; use identity
(= (/ (- (/ a b) (/ c d))
      g)
   (* (/ (- (* a d) (* b c))
	 (* b d g))) )

;; replace
(/ (- ( (- 1 (+ x h)) (+ 2 (+ x h)))
      (/ (- 1 x) (+ 2 x)))
   h)
;; with
(/ (- (* (- 1 (+ x h)) (+ 2 x))
      (* (- 1 x) (+ 2 (+ x h))))   
   (* (+ 2 x h) (+ 2 x)) h)

;; still dividing by h
;; simplify top term
(- (* (- 1 (+ x h)) (+ 2 x))
   (* (- 1 x) (+ 2 (+ x h))))
;; to
(- (- 2 x (* 2 h) (expt x 2) (* x h))
   (- (+ 2 h) x (expt x 2) (x h)))

;; simplies to
(* -1 3 h)

;; equation now
(/ (* -1 3 h)
   (* (+ 2 x h) (+ 2 x) h))

;; h cancels out
(/ (* -1 3)
   (* (+ 2 x h) (+ 2 x)))

;; can plug h=0 in
(/ (* -1 3)
   (* (+ 2 x) (+ 2 x)))

;; (* (+ 2 x) (+ 2 x)) simplifies to
;; (expt (+ 2 x) 2)
(/ (* -1 3)
   (expt (+ 2 x) 2))


(defun search-tree (tree symbol path)
  (cond
    ((null tree) nil)
    ((and (listp tree)
          (eq (car tree) symbol))
     (list (cons (cons 'quote path) symbol))) ;; found symbol
    ((listp tree)
     (let* ((new-path (append path (list 'car))) ;; build path
            (car-nodes (search-tree (car tree) symbol new-path))
            (cdr-nodes (search-tree (cdr tree) symbol (append path (list 'cdr)))))
       (append car-nodes cdr-nodes))) ;; add to output list of found matches
    (t nil)))

(search-tree '(f x) 'x nil)
