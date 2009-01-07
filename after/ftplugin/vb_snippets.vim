if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet vbco set ".st."objname".et." = CreateObject(\"".st."progid".et."\")".st.et.""
exec "Snippet vbcf set ".st."objFSO".et." = CreateObject(\"".st."\"Scripting.FilesystemObject\"".et."\")".st.et.""
exec "Snippet vbcs set ".st."objShell".et." = CreateObject(\"".st."\"WScript.Shell\"".et."\")".st.et.""
exec "Snippet vbcn set ".st."objNet".et." = CreateObject(\"".st."\"WScript.Network\"".et."\")".st.et.""
