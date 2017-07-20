" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
syntax clear pythonOperator

syntax match pythonOperator "\<is\>"

syntax match pyNiceOperator "\<in\>" conceal cchar=∈
syntax match pyNiceOperator "\<or\>" conceal cchar=∨
syntax match pyNiceOperator "\<and\>" conceal cchar=∧
" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
syntax match pyNiceOperator "<=" conceal cchar=≤
syntax match pyNiceOperator ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match pyNiceOperator "!=" conceal cchar=≢

syntax keyword pyNiceOperator sum conceal cchar=𝚺
syntax keyword pyNiceOperator prod conceal cchar=𝚷
syntax keyword pyNiceOperator gradient conceal cchar=𝛁

syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=𝛑

syntax keyword pyNiceStatement alpha conceal cchar=𝛂
syntax keyword pyNiceStatement beta conceal cchar=𝛃
syntax keyword pyNiceStatement delta conceal cchar=𝛅
syntax keyword pyNiceStatement eta conceal cchar=𝛈
syntax keyword pyNiceStatement lambda conceal cchar=𝛌
syntax keyword pyNiceStatement sigma conceal cchar=𝛔
syntax keyword pyNiceStatement gamma conceal cchar=𝛄
syntax keyword pyNiceStatement mu conceal cchar=𝛍
syntax keyword pyNiceStatement nu conceal cchar=𝛎
syntax keyword pyNiceStatement tau conceal cchar=𝛕
syntax keyword pyNiceStatement rho conceal cchar=𝛒
syntax keyword pyNiceStatement epsilon conceal cchar=𝛜
syntax keyword pyNiceStatement theta conceal cchar=𝛉
syntax keyword pyNiceStatement kappa conceal cchar=𝛋
syntax keyword pyNiceStatement phi conceal cchar=𝛟
syntax keyword pyNiceStatement omega conceal cchar=𝛚
syntax keyword pyNiceStatement zeta conceal cchar=𝛇
syntax keyword pyNiceStatement xi conceal cchar=𝛏
syntax keyword pyNiceStatement chi conceal cchar=𝛘
syntax keyword pyNiceStatement psi conceal cchar=𝛙

syntax keyword pyNiceStatement None conceal cchar=∅

syntax match pyNiceOperator " \* " conceal cchar=∙
syntax match pyNiceOperator " / " conceal cchar=÷

" The following are special cases where it /may/ be okay to ignore PEP8
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
syntax match pyNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ

hi link pyNiceOperator Operator
hi link pyNiceStatement Statement
hi link pyNiceKeyword Keyword
hi link pyNiceBuiltin Builtin
hi! link Conceal Operator

setlocal conceallevel=1
