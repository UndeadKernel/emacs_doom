;;; tools/jupyter/config.el -*- lexical-binding: t; -*-

(def-package! jupyter
  :load-path ("~/src/emacs-jupyter" "~/src/emacs-zmq")
  :after org
  :config
  ;; tell ob-async to ignore this module
  (after! ob-async
    (add-to-list 'ob-async-no-async-languages-alist "jupyter"))
  ;; emacs-jupyter relies on functionality of ob-ipython
  (require 'ob-python)
  ;; make emacs-jupyter available in org babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((jupyter . t)))
  (map! :map jupyter-org-interaction-mode-map
        "C-c h" #'+jupyter-hydra/body))
