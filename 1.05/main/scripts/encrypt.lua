function LXT(cr, key, e)
	r = ""
	comment = "/// LXT PROTECT /// "
	if cr == true then
		r = comment
		for i = 1, #e do
			local char = e:sub(i,i)
		    local ascii = string.byte(char)
		    ascii = ascii + key
		    r = r .. string.char(ascii)
		end
	end
	if cr == false then
		ptext = string.gsub(e, comment, "")
		for i = 1, #ptext do
			local char = ptext:sub(i,i)
		    local ascii = string.byte(char)
		    ascii = ascii - key
		    r = r .. string.char(ascii)
		end
	end
	return r
end

text = "I Love Lokey uwu"
local key = 5
local encrypted = LXT(true,key,text)
print('Encrypted : ' .. encrypted)
print('Decrypted : ' .. LXT(false,key,encrypted))
writefile('Encrypt.txt',encrypted)

