local lush = require("lush")

local norm_fg = "#cccccc"
local norm_bg = "#1f1f1f"
local dark_red = "#D16969"
local orange = "#f9ae28"
local brown = "#CE9178"
local yellow = "#DCDCAA"
local yellow_orange = "#D7BA7D"
local green = "#6A9955"
local blue_green = "#4EC9B0"
local light_green = "#B5CEA8"
local blue = "#4fc1ff"
local light_blue = "#9CDCFE"
local dark_blue = "#569CD6"
local cornflower_blue = "#6796E6"
local dark_pink = "#C586C0"
local bright_pink = "#f92672"
local purple = "#ae81ff"

local white = "#ffffff"
local off_white = "#fffff2"
local gray = "#51504f" -- StatuslineNC's fg
local gray2 = "#6e7681" -- LineNr (editorLineNumber.foreground)
local gray3 = "#808080"
local gray4 = "#9d9d9d"
local light_gray = "#D3D3D3"
local black = "#2d2d2d" -- TabLine
local black2 = "#252526"
local black3 = "#282828" -- CursorLine (editor.lineHighlightBorder). Or use #2a2d2e (list.hoverBackground) for a brighter color
local black4 = "#181818" -- Statusline

local error_red = "#F14C4C"
local warn_yellow = "#CCA700"
local info_blue = "#3794ff"
local hint_gray = "#B0B0B0"
local ok_green = "#89d185" -- color for success, so I use notebookStatusSuccessIcon.foreground

local selected_item_bg = "#04395e"
local matched_chars = "#2aaaff"
local folded_blue = "#212d3a" -- editor.foldBackground
local float_border_fg = "#454545"
local indent_guide_fg = "#404040"
local indent_guide_scope_fg = "#707070"
local label_fg = "#c8c8c8"
local tab_border_fg = "#2b2b2b"

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {

		--
		-- Preset
		--
		TabBorder({ fg = tab_border_fg }), -- tab.border
		FloatBorder({ fg = float_border_fg }),
		SelectionHighlightBackground({ bg = "#343a41" }), -- editor.selectionHighlightBackground
		LightBulb({ fg = "#ffcc00" }), -- editorLightBulb.foreground
		CodeLens({ fg = "#999999" }), -- editorCodeLens.foreground
		GutterGitAdded({ fg = "#2ea043" }), -- editorGutter.addedBackground
		GutterGitDeleted({ fg = "#f85149" }), -- editorGutter.deletedBackground
		GutterGitModified({ fg = "#0078d4" }), -- editorGutter.modifiedBackground
		Breadcrumb({ fg = "#a9a9a9", bg = Normal.bg }), -- breadcrumb.foreground/background
		ScrollbarGutter({ bg = Normal.bg }),
		ScrollbarSlider({ bg = "#434343" }), -- the slider on the scrollbar (scrollbarSlider.activeBackground)
		ScrollbarSliderHover({ bg = "#4f4f4f" }), -- scrollbarSlider.hoverBackground
		PeekViewBorder({ fg = "#3794ff" }),
		PeekViewNormal({ bg = Normal.bg }), -- peekViewEditor.background
		PeekViewTitle({ fg = white }), -- peekViewTitleLabel.foreground
		PeekViewCursorLine({ bg = black3 }),
		PeekViewMatchHighlight({ bg = "#5d4616" }), -- peekViewEditor.matchHighlightBackground
		GhostText({ fg = "#6b6b6b" }), -- editorGhostText.foreground
		Icon({ fg = "#cccccc" }), -- icon.foregrougray3nd
		Description({ fg = gray4 }), -- descriptionForeground
		ProgressBar({ fg = "#0078d4" }), -- progressBar.background
		MatchedCharacters({ fg = matched_chars }), -- editorSuggestWidget.highlightForeground
		Hint({ MatchedCharacters }), -- for the hint letter in options, e.g., the q in [q]uickfix
		-- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		-- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		-- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		-- UnnecessaryCode({ fg = "#729db4" }),
		UnnecessaryCode({ fg = gray2 }),
		-- Git diff
		DiffTextAdded({ bg = "#214d29" }), -- diffEditor.insertedTextBackground (DiffLineAdded as its background)
		DiffTextDeleted({ bg = "#712928" }), -- diffEditor.removedTextBackground (DiffLineDeleted as its background)
		DiffTextChanged({ bg = "#0E2FDC" }),
		DiffLineAdded({ bg = "#203424" }), -- diffEditor.insertedLineBackground
		DiffLineDeleted({ bg = "#442423" }), -- diffEditor.removedLineBackground
		DiffLineChanged({ bg = "#0e2f44" }),
		-- Quickfix list (can be used to define qf syntax, e.g.,
		-- ~/.config/nvim/syntax/qf.vim)
		QfFileName({ fg = white }),
		QfSelection({ bg = "#3a3d41" }), -- terminal.inactiveSelectionBackground
		QfText({ fg = "#bbbbbb" }), -- normal text in quickfix list (peekViewResult.lineForeground)
		-- Inline hints
		InlayHint({ fg = "#969696", bg = "#242424" }), -- editorInlayHint.foreground/background
		InlayHintType({ InlayHint }), -- editorInlayHint.typeBackground/typeForeground

		--
		-- Editor
		--
		CursorLine({ bg = black3 }),
		CursorColumn({ bg = black3 }),
		ColorColumn({ bg = black2 }), -- #5a5a5a in VSCode (editorRuler.foreground) it's too bright
		Conceal({ fg = gray2 }),
		Cursor({ fg = norm_bg, bg = norm_fg }),
		-- lCursor { },
		-- CursorIM { },
		Directory({ fg = dark_blue }),
		DiffAdd({ DiffLineAdded }),
		DiffDelete({ DiffLineDeleted }),
		DiffChange({ DiffLineChanged }),
		DiffText({ DiffTextChanged }),
		EndOfBuffer({ fg = Normal.bg }),
		-- TermCursor { },
		-- TermCursorNC { },
		ErrorMsg({ fg = error_red }),
		WinSeparator({ fg = "#333333" }), -- editorGroup.border
		VirtSplit({ WinSeparator }), -- deprecated and use WinSeparator instead
		LineNr({ fg = gray2 }), -- editorLineNumber.foreground
		CursorLineNr({ fg = "#cccccc" }), -- editorLineNumber.activeForeground
		Folded({ bg = folded_blue }),
		CursorLineFold({ CursorLineNr }),
		FoldColumn({ LineNr }), -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
		SignColumn({ bg = Normal.bg }),
		IncSearch({ bg = "#9e6a03" }), -- editor.findMatchBackground
		-- Substitute { },
		MatchParen({ bg = gray, gui = "bold, underline" }),
		ModeMsg({ fg = norm_fg }),
		MsgArea({ fg = norm_fg }),
		-- MsgSeparator { },
		MoreMsg({ fg = norm_fg }),
		NonText({ fg = gray2 }),
		Normal({ fg = off_white, bg = "" }),
		-- NormalNC { },
		Pmenu({ fg = norm_fg, bg = Normal.bg }), -- editorSuggestWidget.background/foreground
		PmenuSel({ fg = white, bg = selected_item_bg }),
		-- PmenuKind = {},
		-- PmenuKindSel = {},
		-- PmenuExtra = {},
		-- PmenuExtraSel = {},
		PmenuSbar({ ScrollbarGutter }),
		PmenuThumb({ ScrollbarSlider }),
		PmenuMatch = { fg = matched_chars, bg = norm_bg },
		PmenuMatchSel = { fg = matched_chars, bg = selected_item_bg, bold = true },
		NormalFloat({ Pmenu }),
		Question({ fg = dark_blue }),
		QuickFixLine({ QfSelection }),
		Search({ bg = "#623315" }), -- editor.findMatchHighlightBackground
		SpecialKey({ NonText }),
		SpellBad({ gui = "undercurl", sp = error_red }),
		SpellCap({ gui = "undercurl", sp = warn_yellow }),
		SpellLocal({ gui = "undercurl", sp = info_blue }),
		SpellRare({ gui = "undercurl", sp = info_blue }),
		StatusLine({ bg = black4 }),
		StatusLineNC({ fg = gray, bg = black4 }),
		TabLine({ fg = gray4, bg = black4, gui = "underline", sp = tab_border_fg }), -- tab.inactiveBackground, tab.inactiveForeground
		TabLineFill({ fg = "NONE", bg = black4, gui = "underline", sp = tab_border_fg }), -- editorGroupHeader.tabsBackground
		TabLineSel({ fg = white, bg = Normal.bg, gui = "bold, underline", sp = tab_border_fg }), -- tab.activeBackground, tab.activeForeground
		Title({ fg = dark_blue, gui = "bold" }),
		Visual({ bg = "#264F78" }), -- editor.selectionBackground
		-- VisualNOS { },
		WarningMsg({ fg = warn_yellow }),
		Whitespace({ fg = "#3e3e3d" }),
		WildMenu({ PmenuSel }),
		Winbar({ Breadcrumb }),
		WinbarNC({ Breadcrumb }),

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		--
		-- Syntax
		--
		Comment({ fg = green, gui = "italic" }),

		Constant({ fg = dark_blue }),
		String({ fg = brown }),
		Character({ Constant }),
		Number({ fg = light_green }),
		Boolean({ Constant }),
		Float({ Number }),

		Identifier({ fg = light_blue }),
		Function({ fg = off_white }),

		Statement({ fg = dark_pink }),
		Conditional({ Statement }),
		Repeat({ Statement }),
		Label({ Statement }),
		Operator({ fg = norm_fg }),
		Keyword({ fg = dark_blue }),
		Exception({ Statement }),

		PreProc({ fg = dark_pink }),
		Include({ PreProc }),
		Define({ PreProc }),
		Macro({ PreProc }),
		PreCondit({ PreProc }),

		Type({ fg = blue_green }),
		StorageClass({ Type }),
		Structure({ Type }),
		Typedef({ Type }),

		Special({ fg = yellow_orange }),
		SpecialChar({ Special }),
		Tag({ Special }),
		Delimiter({ Special }),
		SpecialComment({ Special }),
		Debug({ Special }),

		Underlined({ gui = "underline" }),
		-- Ignore { },
		Error({ fg = error_red }),
		Todo({ fg = norm_bg, bg = yellow_orange, gui = "bold" }),

		--
		-- diff
		--
		-- VSCode doesn't have foreground for git added/removed/changed, so here I
		-- use the corresponding colors for gutter instead.
		diffAdded({ GutterGitAdded }),
		diffRemoved({ GutterGitDeleted }),
		diffChanged({ GutterGitModified }),

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		LspReferenceText({ SelectionHighlightBackground }),
		LspReferenceRead({ SelectionHighlightBackground }),
		LspReferenceWrite({ SelectionHighlightBackground }),
		LspCodeLens({ CodeLens }),
		-- LspCodeLensSeparator { }, -- Used to color the separator between two or more code lens.
		LspSignatureActiveParameter({ MatchedCharacters }),
		LspInlayHint({ InlayHint }),

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = error_red }),
		DiagnosticWarn({ fg = warn_yellow }),
		DiagnosticInfo({ fg = info_blue }),
		DiagnosticHint({ fg = hint_gray }),
		DiagnosticOk({ fg = ok_green }),
		DiagnosticVirtualTextError({ DiagnosticError, bg = "#332323" }),
		DiagnosticVirtualTextWarn({ DiagnosticWarn, bg = "#2f2c1b" }),
		DiagnosticVirtualTextInfo({ DiagnosticInfo, bg = "#212a35" }),
		DiagnosticVirtualTextHint({ DiagnosticHint, bg = black }),
		DiagnosticVirtualTextOk({ DiagnosticOk, bg = "#233323" }),
		DiagnosticUnderlineError({ gui = "undercurl", sp = error_red }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = warn_yellow }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = info_blue }),
		DiagnosticUnderlineHint({ gui = "undercurl", sp = hint_gray }),
		DiagnosticUnderlineOk({ gui = "undercurl", sp = ok_green }),
		DiagnosticFloatingError({ DiagnosticError }),
		DiagnosticFloatingWarn({ DiagnosticWarn }),
		DiagnosticFloatingInfo({ DiagnosticInfo }),
		DiagnosticFloatingHint({ DiagnosticHint }),
		DiagnosticFloatingOk({ DiagnosticOk }),
		DiagnosticSignError({ DiagnosticError }),
		DiagnosticSignWarn({ DiagnosticWarn }),
		DiagnosticSignInfo({ DiagnosticInfo }),
		DiagnosticSignHint({ DiagnosticHint }),
		DiagnosticSignOk({ DiagnosticOk }),
		DiagnosticDeprecated({ fg = gray3, gui = "strikethrough" }),
		DiagnosticUnnecessary({ UnnecessaryCode }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		sym("@constant.builtin")({ fg = dark_blue }), -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		sym("@function.builtin")({ fg = yellow }), -- Special
		-- sym"@function.macro"    { }, -- Macro
		sym("@function.call")({ fg = yellow }),
		sym("@function.method.call")({ fg = yellow }),
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		sym("@property")({ fg = off_white }), -- Identifier
		sym("@constructor")({ fg = dark_blue }), -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		sym("@keyword")({ Keyword }), -- Keyword
		sym("@keyword.import")({ Statement }), -- Keyword
		sym("@keyword.repeat")({ Statement }), -- Keyword
		sym("@keyword.return")({ Statement }), -- Keyword
		sym("@keyword.conditional")({ Statement }), -- Keyword
		sym("@keyword.exception")({ Statement }), -- Keyword
		sym("@keyword.coroutine")({ Statement }), -- Keyword
		sym("@keyword.directive.css")({ Statement }), -- Keyword
		sym("@exception")({ Statement }), -- Exception
		sym("@variable")({ fg = off_white }), -- Identifier
		sym("@variable.member")({ fg = light_blue }), -- Identifier
		sym("@variable.member.typescript")({ fg = off_white }), -- Identifier
		sym("@type")({ fg = blue_green }), -- Type
		sym("@type.css")({ Special }), -- Type
		sym("@type.definition")({ fg = blue_green }), -- Typedef
		sym("@type.builtin")({ fg = blue_green }), -- Builtin Type
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		sym("@tag")({ fg = dark_blue }), -- Tag
		sym("@tag.html")({ fg = dark_blue }), -- Tag
		sym("@tag.svelte")({ fg = blue_green }), -- Tag
		sym("@tag.css")({ Special }), -- Tag
		sym("@tag.attribute")({ fg = off_white }), -- Tag
		sym("@tag.delimiter")({ fg = gray2 }), -- Tag

		sym("@lsp.type.macro")({ fg = yellow }),
		sym("@lsp.type.decorator")({ fg = off_white }),
		sym("@lsp.type.namespace")({ fg = off_white }),
		sym("@lsp.type.namespace.rust")({ fg = blue_green }),
		sym("@lsp.type.function")({ fg = yellow }),
		sym("@lsp.type.method")({ fg = yellow }),
		sym("@lsp.type.library")({ fg = blue_green }),
		sym("@lsp.type.property.typescript")({ fg = light_blue }),

		sym("@lsp.typemod.function.library")({ fg = blue_green }),
		sym("@lsp.typemod.namespace")({ fg = blue_green }),
		sym("@lsp.typemod.namespace.library.rust")({ fg = blue_green }),
		sym("@lsp.typemod.namespace.attribute")({ fg = blue_green }),
		sym("@lsp.typemod.defaultLibrary")({ fg = light_blue }),
		sym("@lsp.typemod.variable.defaultLibrary")({ fg = off_white, gui = "bold" }),
		sym("@lsp.typemod.crateRoot")({ fg = blue_green }),

		sym("@module")({ fg = blue_green }),

		---Oil
		OilFileHidden({ fg = gray2, gui = "italic" }),
		OilDirHidden({ fg = gray2, gui = "italic" }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
