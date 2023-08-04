-- import onedark plugin safely
local setup, onedark = pcall(require, "onedark")
if not setup then
	return
end

onedark.setup({
	style = "darker",
})

onedark.load()
