(in-package #:cl-user)

(defpackage #:nu.composed.btrie-tests
  (:nicknames :btrie-tests)
  (:use #:cl #:btrie #:lift))

(in-package #:nu.composed.btrie-tests)

(defparameter *boa* '(blow boa blush foo bar baz))
(defparameter *banana* '(banana are an bare bane as c bar ar ban b barn))

(lift:deftestsuite btrie-tests () ())


;;; Initialization

(lift:deftestsuite test-init (btrie-tests)
  ())

(lift:addtest (test-init)
  make-empty-trie
  (let ((r (make-instance 'trie)))
    (ensure-same
     (key r)
     "")))


;;; Predicates

(lift:deftestsuite btrie-predicates (btrie-tests)
  ())

(lift:deftestsuite test-nodes-equalp (btrie-predicates)
  ())

(lift:addtest (test-nodes-equalp)
  leaf-nodes
  (ensure-same (make-leaf) (make-leaf)))

(lift:addtest (test-nodes-equalp)
  empty-tries
  (ensure-same (make-trie) (make-trie)))


;;; Retrieval

(lift:deftestsuite btrie-lookup (btrie-tests)
  ())

(lift:deftestsuite test-obtain-seq (btrie-lookup)
  ())

(lift:addtest (test-obtain-seq)
  simple-lookup
  (let ((tr (make-trie *banana*)))
    (with-slots ((k key) (w width) (b branches))
        (let ((result-node ))
          (ensure-same 
           (obtain-seq tr "banana")
           (make-node :key #\a :width 1 :branches (list (make-leaf)))
           :test #'nodes-equalp)))))