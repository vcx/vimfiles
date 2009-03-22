if !exists('loaded_snippet') || &cp
    finish
endif

function! UpFirst()
    return substitute(@z,'.','\u&','')
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet csmain public static void Main(string[] args) {<CR>".st.et."<CR>}<CR>"
exec "Snippet csc class ".st."ClassName".et."<CR>{<CR><TAB>".st.et."<CR>}"
exec "Snippet csm public ".st."string".et." ".st."MethodName".et."(".st.et." ".st.et.")<CR>{<CR><TAB>".st.et."<CR>}"
