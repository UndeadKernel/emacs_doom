;;; private/boy/+bindings.el -*- lexical-binding: t; -*-

(map!
 ;; My (boy) function bindings
 "M-n" '+boy/down-scroll
 "M-p" '+boy/up-scroll
 "M-d" '+boy/delete-word
 "<M-backspace>" '+boy/backward-delete-word
 ;; Editor related bindings
 "C-a" #'+boy/move-to-bol
 "C-s" 'swiper
 "C-r" 'swiper
 ;; Buffer related bindings
 "C-x b" 'persp-switch-to-buffer
 "C-x B" 'switch-to-buffer
 "C-x k" 'doom/kill-this-buffer
 "C-S-<left>" '+boy/window-move-left
 "C-S-<right>" '+boy/window-move-right
 "C-S-<up>" '+boy/window-move-up
 "C-S-<down>" '+boy/window-move-down
 ;; Switching windows
 "C-x p" 'doom/other-popup
 "C-x C-o" '+boy/switch-to-last-window
 "C-x O" 'switch-window-then-swap-buffer
 ;; Misc plugins
 "<f9>" '+neotree/toggle
 "C-=" 'er/expand-region
 "C-c ." 'goto-last-change
 "C-'" 'imenu-list-minor-mode
 ;; Smart-forward
 "M-<up>" 'smart-up
 "M-<down>" 'smart-down
 "M-<left>" 'smart-backward
 "M-<right>" 'smart-forward
 ;; smartparens
 "C-M-a" 'sp-beginning-of-sexp
 "C-M-e" 'sp-end-of-sexp
 "C-M-f" 'sp-forward-sexp
 "C-M-b" 'sp-backward-sexp
 "C-M-d" 'sp-splice-sexp
 ;; Company mode
 "<C-tab>" '+company/complete
  ;; Counsel Bindings
 "C-h b" 'counsel-descbinds
;; Repl Toggle
 "C-c C-z" '+eval/open-repl
;; Magit/git bindings
 (:prefix "C-c m"
   "s" 'magit-status
   "i" '+vcs/git-browse-issues
   "b" '+vcs/git-browse)
;; Bury popup buffers with only C-g
 (:after nodejs-repl
   (:map nodejs-repl-mode-map
     "C-g" 'doom/popup-close))
 (:after ielm
   (:map ielm-map
     "C-g" 'doom/popup-close))
 ;; Working with windows, workgroups and stuff.
 ;;"<pause>" (λ! (doom/workgroup-load (concat wg-workgroup-directory doom-wg-perpetual)))
 (:prefix "C-c w"
   "d" '+workspace/display
   "r" '+workspace/rename
   "c" '+workspace/new
   "k" '+workspace/delete
   "s" '+workspace/save
   "S" '+workspace/save-session
   "l" '+workspace/load
   "L" '+workspace/load-session
   "o" 'doom/tab-kill-others
   "u" 'winner-undo
   "U" 'winner-redo
   "p" '+workspace/switch-left
   "n" '+workspace/switch-right
   "h" 'resize-window
   "1" (λ! (+workspace/switch-to 0))
   "2" (λ! (+workspace/switch-to 1))
   "3" (λ! (+workspace/switch-to 2))
   "4" (λ! (+workspace/switch-to 3))
   "5" (λ! (+workspace/switch-to 4))
   "6" (λ! (+workspace/switch-to 5))
   "7" (λ! (+workspace/switch-to 6))
   "8" (λ! (+workspace/switch-to 7))
   "9" (λ! (+workspace/switch-to 8))
   "0" '+workspace/switch-to-last)
 (:after core-scratch
   (:map doom-mode-map
     "C-c C-c" 'doom-scratch-clear
     "C-c C-k" 'doom/kill-real-buffer
     "C-x k" 'doom/kill-real-buffer
     "C-c C-r" (λ! (call-interactively 'counsel-recentf))
     "C-c C-e" (λ! (find-file (f-expand "init.el" doom-emacs-dir)))
     "C-c C-h" (λ! (browse-url "https://github.com/UndeadKernel/.emacs.d"))
     "C-c C-l" (λ! (doom/workgroup-load (concat wg-workgroup-directory "last") t))))
 ;; imenu stuff
 (:after imenu-list
   (:map imenu-list-major-mode-map
     "C-g" 'doom/imenu-list-quit
     "RET" 'imenu-list-goto-entry
     "SPC" 'imenu-list-display-entry
     [tab] 'hs-toggle-hiding))
 ;; Company mode and the like
 (:after company
   (:map company-active-map
     "C-o"        'company-search-kill-others
     "C-n"        'company-select-next
     "C-p"        'company-select-previous
     "C-h"        'company-quickhelp-manual-begin
     "C-S-h"      'company-show-doc-buffer
     "C-S-s"      'company-search-candidates
     "C-s"        'company-filter-candidates
     "<C-tab>"    'company-complete-common-or-cycle
     [tab]        'doom/company-complete-common-or-complete-full
     [backtab]    'company-select-previous
     "C-g"        (λ! (company-abort))
     [C-return]   'counsel-company)
   (:map company-search-map
     "C-n"        'company-search-repeat-forward
     "C-p"        'company-search-repeat-backward
     "C-g"     'company-search-abort))
 ;; NeoTree bindings
 (:after neotree
   (:map neotree-mode-map
     "q"       'neotree-hide
     [return]  'neotree-enter
     "RET"     'neotree-enter
     "v"       'neotree-enter-vertical-split
     "s"       'neotree-enter-horizontal-split
     "c"       'neotree-create-node
     "D"       'neotree-delete-node
     "g"       'neotree-refresh
     "r"       'neotree-rename-node
     "R"       'neotree-change-root))
 ;; Refactoring and compilation
 (:map prog-mode-map
   "M-RET" 'emr-show-refactor-menu)
 (:after cc-mode
   ;; Compile
   "<f10>" 'doom/build
   ;; Recompile
   "C-<f10>" (λ! (doom/build nil))
   (:map c++-mode-map
     "M-RET" 'srefactor-refactor-at-point)
   (:map c-mode-map
     "M-RET" 'srefactor-refactor-at-point))
 (:after re-builder
   (:map reb-mode-map
     "C-g" 'reb-quit
     [backtab] 'reb-change-syntax))
 (:after help-mode
   (:map help-map
     "e" 'doom/popup-toggle-messages)
   (:map help-mode-map
     "o" 'ace-link-help))
 (:after info
   (:map Info-mode-map
     "o" 'ace-link-info))
 ;; Yasnippet
 (:after yasnippet
   ;; keymap while editing an inserted snippet
   (:map yas-keymap
     "C-e"           'doom/yas-goto-end-of-field
     "C-a"           'doom/yas-goto-start-of-field
     "<S-tab>"       'yas-prev-field
     "<M-backspace>" 'doom/yas-clear-to-sof
     [backspace]     'doom/yas-backspace
     "<delete>"      'doom/yas-delete)
   ;; keymap while yasnippet is active
   (:map yas-minor-mode-map
     "C-c TAB" 'doom/yas-expand-or-insert))
 ;; Flycheck
 (:after flycheck
   (:map flycheck-error-list-mode-map
     "C-n" 'flycheck-error-list-next-error
     "C-p" 'flycheck-error-list-previous-error
     "RET" 'flycheck-error-list-goto-error))
 ;; git-messenger
 (:after git-messenger
   (:map git-messenger-map
     "C-g"  'git-messenger:popup-close
     "q"    'git-messenger:popup-close))
 ;; ivy stuff
 (:after ivy
   (:map ivy-minibuffer-map
     "C-g" 'keyboard-escape-quit))
 ;; magit stuff
 (:after magit
   (:map magit-mode-map
     ;; Don't let Tab binding in my-bindings conflict with Tab in magit
     "<tab>" 'magit-section-toggle))
 (:after org-agenda
   (:map org-agenda-mode-map
     "C-g" 'doom/org-agenda-quit
     "q" 'doom/org-agenda-quit))
 ;; pythony + anaconda mode
 ;; (:after anaconda-mode
 ;;   (:map anaconda-mode-map
 ;;     "M-." 'anaconda-mode-find-definitions))
 (:after nose
   (:map nose-mode-map
     (:prefix "C-c"
       "c" 'nosetests-again
       "a" 'nosetests-all
       "." 'nosetests-one
       "m" 'nosetests-module
       "pa" 'nosetests-pdb-all
       "p." 'nosetests-pdb-one
       "pm" 'nosetests-pdb-module)))
 (:after latex
   (:when (s-present? doom-synonyms-key)
     ("C-c s" 'www-synonyms-insert-synonym)))
 ;; (:after ein-notebooklist
 ;;   (:map ein:notebooklist-mode-map
 ;;     "o" 'doom/ace-link-ein))
 )

