local opt = vim.opt

opt.splitbelow = true
opt.splitright = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.scrolloff = 10

opt.number = true

if vim.fn["provider#clipboard#Executable"]() ~= nil then
    opt.clipboard = "unnamedplus"
end

vim.cmd("syntax sync minlines=256")

opt.undofile = true

opt.wrap = true

opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 400
