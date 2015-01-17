" Vim syntax file
" Language:    Arduino
" Maintainer:  Brett DiFrischia <orderthruchaos _at_ gmail _dot_ com>
" Last Change: 2011-05-12
" License:     VIM license (:help license, replace vim by arduino.vim)

" Based on syntax/arduino.vim (by Johannes Hoff) initial setup.

" Read the C++ indent script to start with
if version < 600
  so <sfile>:p:h/cpp.vim
  else
    runtime! indent/cpp.vim
    endif
