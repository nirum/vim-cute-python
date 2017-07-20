" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
syntax clear pythonOperator

syntax match pythonOperator "\<is\>"

syntax match pyNiceOperator "\<in\>" conceal cchar=ϵ
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
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π

syntax keyword pyNiceStatement alpha conceal cchar=α
syntax keyword pyNiceStatement beta conceal cchar=β
syntax keyword pyNiceStatement delta conceal cchar=δ
syntax keyword pyNiceStatement eta conceal cchar=η
syntax keyword pyNiceStatement lambda conceal cchar=λ
syntax keyword pyNiceStatement sigma conceal cchar=σ
syntax keyword pyNiceStatement gamma conceal cchar=γ
syntax keyword pyNiceStatement mu conceal cchar=μ
syntax keyword pyNiceStatement nu conceal cchar=ν
syntax keyword pyNiceStatement tau conceal cchar=τ
syntax keyword pyNiceStatement rho conceal cchar=ρ
syntax keyword pyNiceStatement epsilon conceal cchar=ε
syntax keyword pyNiceStatement theta conceal cchar=ϑ
syntax keyword pyNiceStatement kappa conceal cchar=κ
syntax keyword pyNiceStatement phi conceal cchar=φ
syntax keyword pyNiceStatement omega conceal cchar=ω
syntax keyword pyNiceStatement zeta conceal cchar=ζ
syntax keyword pyNiceStatement xi conceal cchar=ξ
syntax keyword pyNiceStatement chi conceal cchar=χ
syntax keyword pyNiceStatement psi conceal cchar=ψ

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
