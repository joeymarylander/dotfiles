local present, sidebar = pcall(require, "sidebar-nvim")
if not present then
    return
end
sidebar.setup{
    open = true,
    initial_width = 40,
    enable_profile = false,
    hide_statusline = false,
    --section_separator = { "AAAAA", "BBB" },
    sections = {
        "buffers",
        "files",
        "git",
        "symbols",
    },
    datetime = { clocks = { { name = "Local" }, { tz = "America/Los_Angeles" }, { tz = "Etc/UTC" } } },
    todos = { initially_closed = true },
    buffers = {
        sorting = "name",
        ignore_not_loaded = true
    },
    disable_closing_prompt = true,
    files = { follow = false },
}
