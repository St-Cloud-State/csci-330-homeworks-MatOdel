(defun partition (list)
  "splits list into two"
  (labels ((partitionI (list L R toggle) ; definition of recursive function; toggle creates the every other effect
             (cond ((null list) (list (reverse L) (reverse R)))  ; if the list is empty return back L and R ; end of recursion
                   (toggle (partitionI (cdr list) L (cons (car list) R) nil)) ; if toggle is set to true, then add to R;toggle swithces
                   (t (partitionI (cdr list) (cons (car list) L) R t))))) ; if toggle is set false, then add to L ;toggle switches
    (partitionI list '() '() t))) ; Inital call of recursive function

(defun mergeLR (L R)
  "Merges two lists and "
  (cond ((null L) R) ; if L is empty R is returned
        ((null R) L) ; if R is empty L is returned
        ((<= (car L) (car R)) (cons (car L) (mergeLR (cdr L) R)))
        (t (cons (car R) (mergeLR L (cdr R)))))) ; calls merge recursivly looking at the first member of each
;list and adding it into the meged list



(defun mergesort (list)
  "merge sorting algoritum"
  (if (or (null list) (null (cdr list))) ;if the list is empty or only contains one elm it is returned as no sort is needed
      list
      (let* ((LR (partition list)) ; takes the list and partitions it and places that value in LR
             (L (car LR))	; puts the left list in L and right in R
             (R (cdr LR)))
        (mergeLR (mergesort L) (mergesort R))))) ; merge is called to merge the results of mergesort on the left and right



