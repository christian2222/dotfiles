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
(insert "changed")changedchanged

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

					;m strings cannot hold char outside of the range (0,225) especially not hyper super of alt modifiers

 	

					; #("foo bar" 0 3 (face bold) 3 4 nil 4 7 (face italic))
					; properties of strings

					; vector is a one dimensional array of any type
					; [1 "teo" (three)] a vector of three elements

					; A char-table is a one-dimensional array of elements of any type

					; A bool-vector is a one-dimensional array of elements that must be t or nil

(make-bool-vector 3 t)
(make-bool-vector 3 nil)
					; they are equivalent because only the first 3 bits are used
(equal #&3"\377" #&3"\007")


(make-hash-table)

					; lisp macros are NOT keyboard macros
					; primitive functions are written in C don't redefine them!

(current-buffer)
(point-marker)
					; each window belongs to one and exactly one frame
(selected-window)
					;  A frame is a rectangle on the screen that contains one or more Emacs windows
(selected-frame)



(process-list)
					; A stream is an object that can be used as a source or sink for characters
					;  An overlay specifies properties that apply to a part of a buffer.


 	

(type-of 1)
(type-of 'nil)
(type-of '())
(type-of '(x))


(eq 'foo 'foo)
(eq 456 456)
(eq "asdf" "asdf")
(eq '(1 (2 (3))) '(1 (2 (3))))

					; eq checks if the pointers to the object are equal
(setq foo '(1 (2 (3))))
(eq foo foo)
(eq foo '(1 (2 (3))))
(eq [(1 2) 3] [(1 2) 3])
(eq (point-marker) (point-marker))

					; equal checks for equal components
(equal 'foo 'foo)
(equal 456 456)
(equal "asdf" "asdf")
(eq "asdf" "asdf")
(equal '(1 (2 (3))) '(1 (2 (3))))
(eq '(1 (2 (3))) '(1 (2 (3))))
(equal [(1 2) 3] [(1 2) 3])
(eq [(1 2) 3] [(1 2) 3])
(equal (point-marker) (point-marker))
(eq (point-marker) (point-marker))

					; The test for equality is implemented recursively; for example, given two cons cells x and y, (equal x y) returns t if and only if both the expressions below return t:

(equal (car x) (car y))
(equal (cdr x) (cdr y))

					; Because of this recursive method, circular lists may therefore cause infinite recursion (leading to an error).


					; some predicates
(floatp 8.0)
(integerp 9)
(numberp 9)
(numberp 8.0)
(wholenump 9)
(wholenump -9)
(zerop 0)
(zerop 1)

					; for number comparsion use = not eq
					; = compares numbers whereas eq compares objects
					; eq does not report errors
					;compare with = /= < <= > >=
(max 5 6 9)
(max 2.5 6 10)

(min -4 11)
(abs -7)


(defvar fuzz-factor 1.0e-6)
(defun approx-equal (x y)
  (or (and (= x 0) (= y 0))
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))
(approx-equal 3.00000001 3.0)

(floor -1.7)
(floor 5.99 3)

(+)
(+ 1 2 3 4)
(- 10 1 2 3 4)
(-)
(* 1 2 3 4)



					; div
(/ 5 2)
					; modulo
(% 9 4)
(mod 9 4)



(* 2 3)
(let ((x 1)
      (y 2)))

(setq myVar 7)


					; (start-process "Shell" ".emacs"  "ls")
(call-process "ls" nil t nil "-l")

					; dont use cd to change the working directory see below
					; (call-process "cd" nil t nil "~/python")

					;works
(call-process "pwd" nil t nil)

					; starts new emacs
(call-process "emacs" nil 0 nil "--geometry" "30x5")

					; Note: file yfirst.py> has to lie in the current working directory
					; M-x cd to change this directory
					; destination t means current buffer
(call-process "python" nil t nil "first.py")

					; [begin python]
x = 5
y = "John"
print(x)
print(y)
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)
					; [end python]
(current-buffer)

					; comment
					; put into scratch buffer
(call-process "ls" nil "*scratch*" nil "-l")

(call-process "python" nil "*scratch*" nil "first.py")
(shell-quote-argument "-n '/begin python,/end python/{//!p;}' .emacs")

(call-process "sed" nil "*scratch*" nil "-n\ \'/begin python,/end python/{//!p;}' .emacs")

(with-temp-file "test.txt" ()








addDotFiles.sh	makeLinks.sh

Process Shell finished
