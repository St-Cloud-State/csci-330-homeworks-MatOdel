(defun insert-sorted (item sorted-list)
  "Inserts an item into a sorted list while maintaining ascending order."
  (cond ((null sorted-list) 
         ;; If the sorted-list is empty, create a new list with the item.
         (list item))  
        ((<= item (car sorted-list)) 
         ;; If the item is smaller than or equal to the first element in the sorted-list,
         ;; insert the item at the front of the list.
         (cons item sorted-list))  
        (t 
         ;; Otherwise, keep the first element and recursively insert the item in the rest of the list.
         (cons (car sorted-list) 
               (insert-sorted item (cdr sorted-list))))))

(defun sort-helper (unsorted-list sorted-list)
  "Helper function for insertion sort.
   Recursively moves elements from unsorted-list to sorted-list in order."
  (if (null unsorted-list)  
      ;; Base case: If there are no more items in the unsorted-list, return the sorted-list.
      sorted-list
      ;; Recursive case: Take the first element from unsorted-list, 
      ;; insert it into the sorted-list, and repeat the process with the rest of the unsorted-list.
      (sort-helper (cdr unsorted-list) 
                   (insert-sorted (car unsorted-list) sorted-list))))

(defun insertion-sort (list-to-sort)
  "Sorts a list using the insertion sort algorithm.
   Calls sort-helper to process the list."
  (sort-helper list-to-sort '()))  
  ;; Initially, pass an empty list as sorted-list, and the unsorted list as the input.


