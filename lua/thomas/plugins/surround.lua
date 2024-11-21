return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}

-- MAPPINGS --
-- NORMAL MODE = leader is 'ys'
-- NORMAL MODE = leader is 'S'
--
--
--      w | token                     --surround word + 1
--      token                     --delete surrounding token
--      token                     -- change token on cursor
--      a | token | additionnal_token --surround an already surrounded
--      wf | function_name             --Wrap word in function
--      f
