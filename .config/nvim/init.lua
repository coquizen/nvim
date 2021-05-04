local o = vim.o -- Local accessor for setting global options
local wo = vim.wo -- ... window-local options
local bo = vim.bo -- buffer-local options

----------------------------------------------------------
--
-- General {{{
--
----------------------------------------------------------

o.nocompaible -- Don't make nvim vi compatible

o.clipboard = unnamedplus -- Setting to intergate
o.mouse = a -- Enable mouse in all modes
o.hidden -- Allows abandoning an unsaved buffer when opening another file

