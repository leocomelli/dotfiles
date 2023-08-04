-- import which key plugin safely
local setup, wk = pcall(require, "which-key")
if not setup then
	return
end

-- enable comment
wk.setup()
