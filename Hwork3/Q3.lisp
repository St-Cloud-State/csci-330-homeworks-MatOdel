(defun pair-up (lst)
  "Partitions the list into sorted pairs. This function takes a list and groups adjacent
   elements into pairs, ensuring that each pair is sorted in ascending order. If the list
   has an odd number of elements, the last element is placed in its own singleton list."
  (cond ((null lst) '())  ;; Base case: if the list is empty, return an empty list.
        ((null (cdr lst)) (list (list (car lst))))  ;; If one element remains, wrap it in a list.
        (t (cons (let ((a (car lst)) (b (cadr lst)))
                   (if (< a b) (list a b) (list b a)))  ;; Create sorted pairs.
                 (pair-up (cddr lst))))))  ;; Recurse on the rest of the list, skipping the paired elements.

(defun merge-pairs (lst)
  "Merges adjacent lists in a bottom-up manner without using a separate merge function.
   This function repeatedly combines adjacent lists in the given list of lists."
  (cond ((null lst) '())  ;; Base case: if the list is empty, return empty.
        ((null (cdr lst)) lst)  ;; If only one sublist remains, return it.
        (t (cons (combine (car lst) (cadr lst))  ;; Merge the first two lists and continue.
                 (merge-pairs (cddr lst))))))  ;; Recurse on the remaining lists.

(defun combine (lst1 lst2)
  "Merges two sorted lists into a single sorted list.
   This function performs a classic merge operation used in merge sort."
  (cond ((null lst1) lst2)  ;; If the first list is empty, return the second list.
        ((null lst2) lst1)  ;; If the second list is empty, return the first list.
        ((< (car lst1) (car lst2))  ;; Compare the first elements of both lists.
         (cons (car lst1) (combine (cdr lst1) lst2)))  ;; Take the smaller element and recurse.
        (t (cons (car lst2) (combine lst1 (cdr lst2))))))  ;; Otherwise, take the element from lst2.

(defun bottom-up-mergesort (lst)
  "Sorts a list using the bottom-up merge sort algorithm.
   This function first groups elements into sorted pairs, then repeatedly merges
   adjacent lists until only one sorted list remains."
  (let ((sublists (pair-up lst)))  ;; Step 1: Create initial sorted sublists.
    (loop while (> (length sublists) 1) do  ;; Continue merging while more than one sublist remains.
          (setf sublists (merge-pairs sublists)))  ;; Replace sublists with their merged versions.
    (car sublists)))  ;; The last remaining sublist is the sorted list.

