" quickfix for Perl error formats
"setlocal errorformat=%f:%l:%m
set errorformat+=%m\ at\ %f\ line\ %l\.
set errorformat+=%m\ at\ %f\ line\ %l
":make command will compile the current perl file and check for errors
setlocal makeprg=perl\ -I\ ./src/perl/qto/\ -I\ ./src/perl/qto/lib\ -wc\ %\ $*

