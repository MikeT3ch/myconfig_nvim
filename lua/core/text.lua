vim.lsp.start config: {
	name = "Bend LSP",
	cmd = {
		"npx", "ts-node",
		vim.fn.expand(string: "~/Documentos/GitProjects/bend_lsp/server/src/server.ts")
	},
	capabilities = vim.lsp.protocol.make_client_capabilities()
}
