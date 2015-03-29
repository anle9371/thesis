(TeX-add-style-hook "le_ms_presentation"
 (lambda ()
    (TeX-add-symbols
     "structureopacity"
     "strcolor"
     "yourowntexcol"
     "titlephrase"
     "name"
     "affil"
     "email")
    (TeX-run-style-hooks
     "booktabs"
     "times"
     "inputenc"
     "utf8"
     "latex2e"
     "fancyslides10"
     "fancyslides"
     "")))

