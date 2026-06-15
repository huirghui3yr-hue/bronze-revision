-- Pokemon Gen 1 Font

local font = {
	name = 'Gen1Font',
	source = 'rbxassetid://347419384',
	spaceWidth = 8*4,
	letterSpacing = 0,
	lineSpacing = 16*4,

	map = {
		['[n\'t]'] = {4, 73*4, 64, 32},
	},

	extensions = {},
	
	specialWordCharactersList = {
		'[e\']',
		'[\'s]',
		'[PK]',
		'[MN]',
		'[M]',
		'[F]',
		'[n\'t]',
	}
}

local charmap = {
	{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', '/', '[qty]'},
	{'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', '[right]', '[down]'},
	{'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '.', ','},
	{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', '[e\']', '?'},
	{'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', '[\'s]', '[:L]'},
	{'s', 't', 'u', 'v', 'w', 'x', 'y', 'z', '[PK]', '[MN]', '[right_empty]'},
	{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'},
	{'(', ')', ':', ';', '[', ']', '-', '[M]', '[F]', '[End]'},
}

for y, set in pairs(charmap) do
	for x, char in pairs(set) do
		font.map[char] = {
			(1+(x-1)*9)*4,
			(1+(y-1)*9)*4,
			32, 32
		}
	end
end

return font