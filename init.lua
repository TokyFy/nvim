-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   init.lua                                           :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2025/06/11 14:41:39 by franaivo          #+#    #+#             --
--   Updated: 2025/06/11 14:41:57 by franaivo         ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
	require 'plugins.neotree',
	require 'plugins.mason',
	require 'plugins.lspconfigs',
	require 'plugins.nvimcmp',
	require 'plugins.treesitter',
	require 'plugins.autotag',
	require 'plugins.autopairs',
	require 'plugins.theme',
})
