local v = require("utils")

-- Real Regex instead of vims
v.nnoremap({"/"}, "/\\v")
v.vnoremap({"/"}, "/\\v")

-- Speed up scrolling of the viewport slightly
v.nnoremap({"<C-e>"}, "2<C-e>")
v.nnoremap({"<C-y>"}, "2<C-y>")

-- Quick replay q macro
v.nnoremap({ "Q" }, "@q")

--faster scrolling
v.noremap ({ "j" }, "gj")
v.noremap ({ "k" }, "gk")
v.nnoremap ({ "gj" }, "5j")
v.nnoremap ({ "gk" }, "5k")

--yank to different reg when changing
v.nnoremap ({ "c" }, "\"xc")
v.xnoremap ({ "c" }, "\"xc")

-- After block yank and paste, move cursor to the end of operated text
-- Also, don't copy over-pasted text in visual mode
v.vnoremap ({ "y" }, "y`]")
v.vnoremap ({ "p" }, "\"_dP`]")
v.nnoremap ({ "p" }, "p`]")

-- No more accidentally showing up command window (Use C-f to show it)
v.map ({ "q:" }, ":q")

-- Use CamelCaseMotion instead of default motions
v.map ({"<silent>", "w"}, "<Plug>CamelCaseMotion_w")
v.map ({"<silent>", "b"}, "<Plug>CamelCaseMotion_b")
v.map ({"<silent>", "e"}, "<Plug>CamelCaseMotion_e")
v.map ({"<silent>", "ge"}, "<Plug>CamelCaseMotion_ge")


-- F Keys
v.nnoremap({"<silent>", "<F1>"}, ':SidebarNvimToggle<CR>')
-- v.nnoremap({"<silent>", "<F2>"}, require("sidebar-nvim").toggle())


-- buffer management
v.nnoremap({"<silent>", "+"}, ":bn<CR>")
v.nnoremap({"<silent>", "_"}, ":bp<CR>")


-- ================ LEADER cmds

-- Search files recursively ([o]pen file)
v.nnoremap( {"<silent>", "<LEADER>o"}, ":Telescope find_files<CR>")
-- Search between open files - [b]uffers
v.nnoremap({"<silent>", "<LEADER>b"}, ":Telescope buffers<CR>")
-- Search in current file ou[t]line (tags in current file)
v.nnoremap({"<silent>", "<LEADER>t"}, ":Telescope lsp_document_symbols<CR>")
-- Search for term - [g]rep
v.nnoremap({"<silent>", "<LEADER>g"}, ":Telescope live_grep<CR>")
-- Search in [l]ines on current buffer
v.nnoremap({"<silent>", "<LEADER>l"}, ":Telescope current_buffer_fuzzy_find<CR>")
-- Search in [r]egisters
v.nnoremap({"<silent>", "<LEADER>r"}, ":Telescope registers<CR>")
-- Open projects selector
v.nnoremap({"<silent>", "<LEADER>p"}, ":Telescope project<CR>")

v.nnoremap({"<silent>", ",f"}, ":call utils#formatFile()<CR>")
