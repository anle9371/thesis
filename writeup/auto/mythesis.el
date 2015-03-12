(TeX-add-style-hook "mythesis"
 (lambda ()
    (LaTeX-add-bibliographies
     "refs")
    (TeX-run-style-hooks
     "natbib"
     "numbers"
     "cancel"
     "array"
     "color"
     "float"
     "listings"
     "geometry"
     "margin=0.98in"
     "paperheight=11in"
     "paperwidth=8.5in"
     "subfig"
     "graphicx"
     "amsthm"
     "amssymb"
     "amsmath"
     "longtable"
     "textcomp"
     ""
     "latex2e"
     "thesis11"
     "thesis"
     "11pt"
     "defaultstyle"
     "macros"
     "chapter1"
     "chapter2"
     "chapter3")))

