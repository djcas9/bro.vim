" ---------------------------------------------------------------------
" File: bro.vim
" Birthday: Wed Aug 03 10:41:01 PDT 2005 
" Author: Martin Casado
"         (... also without a clue about writing VIM syntax files
"           thanks python.vim & c.vim!)
" ---------------------------------------------------------------------

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword Boolean          T F
syn keyword Typedef          type

syn keyword broStatement     break next continue
syn keyword broStatement     alarm using of add delete
syn keyword broStatement     default export event
syn keyword broStatement     print redef return schedule
syn keyword broStatement     when timeout

syn keyword broStorageClass  local const global

syn keyword broOperator      in "-" "+" "*" "/" "=="

syn keyword broStatement     function nextgroup=broFunction skipwhite
syn keyword broStatement     event nextgroup=broFunction skipwhite
syn keyword broStatement     hook nextgroup=broFunction skipwhite
syn keyword broStatement     module nextgroup=broFunction skipwhite
syn match   broFunction      "[a-zA-Z_][a-zA-Z0-9_]*" contained

syn keyword broType          addr any bool count 
syn keyword broType          double enum 
syn keyword broType          file int interval 
syn keyword broType          pattern
syn keyword broType          port record set
syn keyword broType          string subnet table
syn keyword broType          time vector

syn match broLoad            "@load"
syn match broLoad            "@load-sigs"
syn match broLoad            "@load-plugin"
syn match broLoad            "@unload"
syn match broLoad            "@prefixes"

syn match broPreCondit       "@if"
syn match broPreCondit       "@ifdef"
syn match broPreCondit       "@ifndef"
syn match broPreCondit       "@else"
syn match broPreCondit       "@endif"
syn match broPreCondit       "@DIR"
syn match broPreCondit       "@FILENAME"

syn keyword broRepeat        for
syn keyword broConditional   if else

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match     cSpecial        display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match     cFormat         display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match     cFormat         display "%%" contained
syn region    cString         start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell,broEscape

syn match  broEscape         +\\[abfnrtv'"\\]+ contained
syn match  broEscape         "\\\o\{1,3}" contained
syn match  broEscape         "\\x\x\{2}" contained

syn match   broComment       "#.*$" contains=broTodo
syn keyword broTodo          TODO FIXME XXX contained

" numbers (including longs and complex)
syn match   broNumber      "\<0x\x\+\>"
syn match   broNumber      "\<\d\+\>"
syn match   broNumber      "\.\d\+\([eE][+-]\=\d\+\)\="

syn match broInterval      "\d\+\(\.\d\+\)\=\(\(day\|hr\|min\|sec\|usec\)s\=\)"
syn match broPort          "\d\{1,5}\/\(tcp\|udp\|icmp\)"

if version >= 508 || !exists("did_bro_syn_inits")
  if version <= 508
    let did_bro_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink broStatement        Statement
  HiLink broFunction         Function
  HiLink broConditional      Conditional
  HiLink broRepeat           Repeat
  HiLink broEscape           Special
  HiLink broType             Type
  HiLink broPreCondit        PreCondit
  HiLink broLoad             Include
  HiLink broComment          Comment
  HiLink broTodo             Todo
  HiLink broNumber           Number
  HiLink broOperator         Operator
  HiLink broStorageClass     StorageClass 
  HiLink broInterval         Number 
  HiLink broPort             Number
  HiLink cString             String
  HiLink cFormat             cSpecial
  HiLink cSpecial            SpecialChar

  delcommand HiLink
endif

let b:current_syntax = "bro"
