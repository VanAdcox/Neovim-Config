return {
    "mason-org/mason.nvim",
    opts = {
	    registries = {
	      "github:mason-org/mason-registry",
	      "github:Crashdummyy/mason-registry",
	    },
    },
    config = function(_, opts)
	require("mason").setup(opts)
    end,
}

