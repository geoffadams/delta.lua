# Changelog

All notable changes to delta.lua will be documented in this file.

This project adheres (or tries) to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
I try to attach a commit to each log, but in the initial pr, I may use the pr instead. Will change the pr to the commit hash (if merged) in a later pr.

## Latest

### [0.1.1] - 2026-04-24

#### Added
pull request - 

- `Significant performance optimizations for word level diff highlighting`: affected functions include `get_adjacent_line_sets`, `calculate_similarity`, `get_treesitter_token_strings`, `is_metadata_pattern`, and `get_two_tier_highlights`.
- `test_git_diff_async`: new example test function in API that schedules each decoration step via `vim.schedule`, allowing the buffer to render in the window before syntax highlighting and diff highlighting is applied

#### Fixes

- `get_highlights` errored when opts.highlighting was nil. No longer errors.

## History

### [0.1.0] - 2026-03-16

#### Added
commit - 305dd5d5c2d7138f10052ba2cbff8e3bb9b1bc76 

- `Delta.git_diff(ref, path, opts)` — create a diff buffer from a live git diff
- `Delta.text_diff(s1, s2, language, opts)` — create a diff buffer from two strings via `vim.text.diff`
- `Delta.patch_diff(diffstring, is_git_diff, language, opts)` — create a diff buffer from a unified diff/patch string
- Two-tier diff highlighting: line-level background highlights for added/removed lines, and word-level highlights for changed tokens within paired lines
- Treesitter syntax highlighting: `syntax_highlight_git_diff` (reads source files from disk) and `syntax_highlight_diff_set` (reconstructs content from diff data)
- Treesitter token-based word diffing, with Lua-pattern splitting as a fallback when no language is available
- Similarity-based line pairing using Levenshtein distance before word-level highlighting is applied; configurable via `max_similarity_threshold`
- `highlight_delta_artifacts` — highlights file titles, hunk headers, and separator lines
- `setup_delta_statuscolumn(bufnr, winid)` — custom statuscolumn showing old/new line numbers coloured by line type; restores previous statuscolumn on buffer unload
- Hunk headers with context function name extracted from the `@@` marker
- Light and dark theme support; highlight groups automatically reapplied on colorscheme change
- All eight highlight groups configurable per background via `setup()`: `DeltaDiffAddedLine`, `DeltaDiffRemovedLine`, `DeltaDiffAddedWord`, `DeltaDiffRemovedWord`, `DeltaTitle`, `DeltaLineNrAdded`, `DeltaLineNrRemoved`, `DeltaLineNrContext`
- `Delta.parse` sub-table exposing `get_diff_data`, `get_diff_data_git`, and `get_language_from_filename`
- `Delta` global variable as an alias for `require('delta')`
- New-file support: `new_file` opt diffs untracked files against `/dev/null`
- Absolute path normalisation when passing file paths into `git_diff`
- `:checkhealth delta` integration

#### Fixes

- support for git diff.mnemonicPrefix in path parsing - 99759f8ae4d2304214637de41b331043eb469b91
- error handling for binary files - 9d3a6884cb60bc6e653ba9868b82bb26648d5aae
- make the git diff api independent of the neovim cwd, unless no path is given - 898b2dc31945846df3abf89b47251a6492feb90d
- fix bad react file treesitter parser mapping - https://github.com/kokusenz/delta.lua/pull/5
