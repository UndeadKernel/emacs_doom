;;; config.el --- The Configuration of the Boy

(load! +windows)
(load! +bindings)
(load! +functions)

;; Smooth mouse scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))  ; scroll two lines at a time
      mouse-wheel-progressive-speed nil             ; don't accelerate scrolling
      mouse-wheel-follow-mouse t                    ; scroll window under mouse
      scroll-step 1)

;; Backups
(setq backup-by-copying t      ; No symbolic links
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

