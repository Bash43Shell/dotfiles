" Normal mode	Foreground	Background
let s:N1 = [ '#000000' , '#1010ff' , 0  , 24 ]
let s:N2 = [ '#ffffff' , '#1010ff' , 255 , 24 ]
let s:N3 = [ '#ffffff' , '#2e2e2e' , 255 , 235 ]

" Insert mode	Foreground	Background
let s:I1 = [ '#ffffff' , '#1010ff' , 255   , 24  ]

" Visual mode	Foreground	Background
let s:V1 = [ '#ffffff' , '#ffaf00' , 255 , 214 ]

" Replace mode	Foreground	Background
let s:RE = [ '#ffffff' , '#d70000' , 255 , 160 ]

let g:airline#themes#omniverse#palette = {}
let g:airline#themes#omniverse#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#omniverse#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)
let g:airline#themes#omniverse#palette.insert_replace = {
      \ 'airline_a': [  s:RE[0]   , s:RE[1]   , s:RE[2]   , s:RE[3]   , ''     ] }

let g:airline#themes#omniverse#palette.visual = {
      \ 'airline_a': [ s:V1[0]   , s:V1[1]   , s:V1[2]   , s:V1[3]   , ''     ] }

let g:airline#themes#omniverse#palette.replace = copy(airline#themes#omniverse#palette.normal)
let g:airline#themes#omniverse#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]
let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3] , s:N3[3] , '' ]
let g:airline#themes#omniverse#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
