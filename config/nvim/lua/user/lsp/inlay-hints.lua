-- Set up inlay hint support
local status_ok, inlay_hints = pcall(require, "lsp-inlayhints")
if not status_ok then
    return
end

inlay_hints.setup()

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_inlayhints",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        inlay_hints.on_attach(client, bufnr)
    end,
})
