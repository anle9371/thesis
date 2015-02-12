(TeX-add-style-hook "macros"
 (lambda ()
    (LaTeX-add-environments
     "theorem"
     "definition")
    (TeX-add-symbols
     '("twomatrix" 4)
     '("threevec" 3)
     '("twovec" 2)
     '("fourchoices" 4)
     '("threechoices" 3)
     '("twochoices" 2)
     '("diffz" 1)
     '("diffth" 1)
     '("diffr" 1)
     '("diff" 2)
     "vth")))

