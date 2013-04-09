#!/usr/bin/env ruby
# from https://gist.github.com/dsanson/1383132
 
bibfile = "~/Dropbox/tex/ref2.bib"
 
matches = ARGF.read.scan(/@(.*?)[\.,:;\] ]/)
reg = "\\(" + matches.join("\\)\\|\\(") + "\\)"
 
system 'bibtool --preserve.key.case=on -X \'' + reg + '\' ' + bibfile

