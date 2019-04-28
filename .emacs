(+ 7 6 8)
(defun average (x y)
  (/ (+ x y) 2.0))

(average 7 8)

(defun square(n)
  (* n n))

(square 7)

(defun half(x)
  (/ x 2.0))

(defun cube(n)
  (* (* n n) n))

(cube 4)

(defun pythag(x y)
  (sqrt (+ (* x x) (* y y))))

(pythag 3 4)

pi
(defun area(r)
  (* pi (* r r)))

(area 3)

'(first '(we hold these truths))
(list 'a 'b 'c)
(list 'buy (* 27 34) 'bagels)
'(foo bar baz)
(list 'foo 'bar 'baz)
(cons 'foo '(bar baz))
'(33 suared is (* 33 33))
(list 33 'squared 'is (* 33 33))
(defun double (x)
  (* x 2))
(double 7)
(defun quadruple (n)
  (double (double n)))
(quadruple 2)

(defun intro (x y)
  (list x 'this 'is y))

(intro 'bob 'mary)


(defun test ()
  (* 85 97))

(test )

(quote foo)
(quote (Hello Wolrd))
'foo
''foo



(lambda (x y)
  (+ (* 3 x) (* y y)))

(eval '(+ 2 2))
(eval ''boing)

(defun multiply-by-seven (number)
  "Multiply NUMBER by seven."
  (interactive "p")
  (message "The result id %d" (* 7 number)))

(multiply-by-seven 8)

(let ((zebra "stripes")
     (tiger "fierce"))
 (message "One kind of animal has %s and another is %s."
	  zebra tiger))

(let ((birch 3)
       pine
       fir
       (oak 'some))
   (message
    "Here are %d variables with %s, %s, and %s value."
    birch pine fir oak))


(if (> 5 4)                            
    (message "5 is greater than 4!")
    (message "oops"))                  ;; huhu 

(defun type-of-animal (characteristic)
 "Print message in echo area depending on CHARACTERISTIC.
  If the CHARACTERISTIC is the string \"fierce\",
  then warn of a tiger."
   (if (equal characteristic "fierce")
       (message "It is a tiger!")))

(type-of-animal "fierce")

(type-of-animal "striped")

(defun type-of-animal (characteristic)  ; Second version.
   "Print message in echo area depending on CHARACTERISTIC.
    If the CHARACTERISTIC is the string \"fierce\",
    then warn of a tiger; else say it is not fierce."
    (if (equal characteristic "fierce")
        (message "It is a tiger!")
      (message "It is not fierce!")))

(type-of-animal "fierce")
(type-of-animal "gugu")

(cons 'foo ())
(not nil)

					; nil and t are special symbols
					; everything other than nil is true but use t
(car '(1 2))
					; third element
(car (cdr (cdr '(a b c))))
					; == logical programmable equivalence

(progn (print 'foo) (print 'bar))
					;printed text is indicated by ~|
					; error messages start with 'error -->'
					; (+ 23 'x)  produces an error

					; inserts text in current buffer and returns nil
(insert "changed")

					; Function: foo integer1 &optional integer2 &rest integers
					; object may be of any tpye


					; function
(emacs-version)
					; variables
emacs-build-time
emacs-version
emacs-major-version
emacs-minor-version

					; objects may belong to more than one type
					; primitive types, ie. integer, float, cons, symbol, string, vector, hash-table, subr, byte-code, function
					; special types like buffer
					; if an object is of type vector you can't thread it as a number
					; no type declaration in lisp but variables remember their types
					; in Lisp an expression is primarily a Lip object and secondarily the represented text

					; hash syntax
(current-buffer)

					; distinct two different types: types for Lisp programming and types for editing

					; integers range in (-2**27,2**27-1) - Emacs Lisp does not check for overflow
(+ 1 134217727)

-1
1
37
+56
22237236

					; float types always uses C type double
1500.0
15e2
.150e2
.15e4

					; characters are integers in (0,524287)
					;(0,127) are ASCII codes the rest are non-ASCII
?a
?A
?B
					; quote special chars with \
?\
?\+
?\ß
?\\
					; escape
?\e
?\C-I
?\C-i
?\^I
					; del
?\C-?
?\M-A
?\C-\M-b
?\C-\S-o
					; hyper Meta Super x
?\H-\M-\s-x
					; octal notattion
?\101
					; hex
?\x41
					; in Emacs Lisp uppercase and lowercase letters are distinct

					; A sequence is an ordered set of elements
					; Two kinds of sequences in Lisp: arrays and lists
					; List strings and other array types are different but have similarities
					; all have length l indexed (0,l-1)
					; if you read the same sequence twice you get two sequences with ths same elements - only exception () == nil
					; con cells have two slots: CAR and CDR
					; CDR holds the link and CAR the data
					; atoms  := an object that is not a con cell
					; CDR of last element point to nil == ()


					; four types of arrays:strings, vectors, bool-vectors and char-tables











