-- Bootstrap packer
local install_path = ("%s/site/pack/packer-lib/opt/packer.nvim"):format(vim.fn.stdpath "data")

local function install_packer()
    vim.fn.termopen(("git clone https://github.com/wbthomason/packer.nvim %q"):format(install_path))
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    install_packer()
end

vim.cmd [[packadd packer.nvim]]

function _G.packer_upgrade()
    vim.fn.delete(install_path, "rf")
    install_packer()
end

vim.cmd [[command! PackerUpgrade :call v:lua.packer_upgrade()]]

local function spec(use)
    use { "lewis6991/impatient.nvim" }
    -- updates package manager
    use 'wbthomason/packer.nvim'
    -- Automatically closing stuff
    use 'cohama/lexima.vim'
    -- CamelCase and snake_case motions
    use 'bkad/CamelCaseMotion'
    use {
        -- git goodies
        'tpope/vim-fugitive',
        -- Keep case in search + replace
        'tpope/vim-abolish',
        -- Unix commands integration
        'tpope/vim-eunuch',
        -- More . repeat functionality
        'tpope/vim-repeat',
        -- Surround (cs"')
        'tpope/vim-surround',
    }
    -- Additional text objects
    use 'wellle/targets.vim'
    -- Easily expand selected region
    use 'terryma/vim-expand-region'
    -- Search for highlighted work with *
    use 'thinca/vim-visualstar'
    -- Iabbrev auto-correction library
    use 'chip/vim-fat-finger'
    -- Matchit enhances motions
    use 'benjifisher/matchit.zip'

    use 'kyazdani42/nvim-web-devicons'

    use 'RRethy/nvim-base16'

    -- status line
    use {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        requires = { { 'lewis6991/gitsigns.nvim' }, { "SmiteshP/nvim-gps" }, { 'nvim-lua/plenary.nvim' } },
        config = function() require 'configs.feline' end
    }

    use {
        "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function() require 'configs.bufferline' end
    }

    -- configuration for language servers
    use {
        'junnplus/lsp-setup.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/lsp-colors.nvim',
            'folke/neodev.nvim',
            'ray-x/lsp_signature.nvim',
            'jose-elias-alvarez/null-ls.nvim',
            'RRethy/vim-illuminate',
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        },
        config = function()
            require "configs.lsp"
        end,
    }

    use({
        'j-hui/fidget.nvim', -- nvim-lsp progress
        config = function()
            require('configs.fidget')
        end,
    })

    -- LSP
    --use({
    --    'hrsh7th/nvim-cmp',
    --    requires = {
    --        'hrsh7th/cmp-nvim-lsp',
    --        'hrsh7th/cmp-buffer',
    --        'hrsh7th/cmp-path',
    --        'hrsh7th/cmp-cmdline',
    --        'hrsh7th/nvim-cmp',
    --        'onsails/lspkind-nvim',
    --        'hrsh7th/cmp-vsnip',
    --        'hrsh7th/vim-vsnip',
    --        'hrsh7th/vim-vsnip-integ',
    --    },
    --    config = function()
    --        require('configs.cmp')
    --    end,
    --})

    use({
        'windwp/nvim-autopairs',
        config = function()
            require('configs.autopairs')
        end,
    })
    use {
        "ms-jpq/coq_nvim",
        config = function()
            require "configs.completion"
        end,
        after = { "nvim-lspconfig" },
    }

    -- 9000+ Snippets
    use {
        "ms-jpq/coq.artifacts",
        branch = 'artifacts',
        after = 'coq_nvim',
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/playground",
            "p00f/nvim-ts-rainbow",
            "windwp/nvim-ts-autotag",
            'RRethy/nvim-treesitter-endwise',
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',

        },
        config = function()
            require "configs.treesitter"
        end,
    }
    use {
        'sidebar-nvim/sidebar.nvim',
        config = function()
            require "configs.sidebar"
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            "nvim-telescope/telescope-project.nvim",
            'gbrlsnchs/telescope-lsp-handlers.nvim'
        },
        config = function()
            require "configs.telescope"
        end,
    }

end

require("packer").startup {
    spec,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
        max_jobs = vim.fn.has "win32" == 1 and 5 or nil,
    },
}
