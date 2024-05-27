local client = vim.lsp.start_client {
	name = "lsp_test",
	cmd = { "/home/michael/Documentos/GitProjects/lsp/lsp_2/main" }
}

if not client then
	vim.notify "hey, algo hiciste mal brodeerr"
	return
end

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "markdown",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
