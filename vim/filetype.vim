" Custom file type synonyms
if exists("did_load_filetypes")
    finish
endif
" tpp <=> cpp
augroup filetypedetect
    au! BufRead,BufNewFile *.tpp       setfiletype cpp
augroup END

