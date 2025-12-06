local main = {
	"https://pastebin.com/raw/wtujxdEh",
	"https://pastebin.com/raw/Qi7UFeWs",
	"https://pastebin.com/raw/yeGdSNab",
	"https://pastebin.com/raw/ZWWQBjZc",
	"https://pastebin.com/raw/Fu96SaLQ",
	"https://pastebin.com/raw/dpq66r1q",
	"https://pastebin.com/raw/f3GeqYen",
	"https://pastebin.com/raw/9q64gJS3"
}

function main:GetLink(Position)
	return main[tonumber(Position)]
end

return main