# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `\setupRefEnum` sets up an enum with key-value options (`separator`, `enclosing`, `combined`).
- `\setupRefEnum` accepts `titleformat` to format the title of each element.
- `\setupRefEnum` defines `\def<EnumId>` as a shorthand for `\defRefEnum{<EnumId>}`. Documents defining such a command themselves need the package option `shorthands=false`.
- When zref-clever is loaded, `\zcref` prints the same identifier as `\refEnum`.
- The full LPPL license text is now included as `LICENSE`.
- `\setupRefEnums` accepts a second optional argument naming the command each element is wrapped in (e.g., `subsection`). The optional argument of `\defRefEnum` still overrides it per element.

### Changed

- Titles of elements are set in italics, unless the elements are wrapped in another command, e.g., `subsection`. Use `titleformat={}` for the former upright titles.
- `demo.pdf` shows the LaTeX code of each example next to its output.
- `demo.tex` demonstrates the package with requirements and a decision record (MADR style) modeled on JabRef.
- `demo.tex` is typeset with LuaLaTeX.
- refenums requires LaTeX 2020-10-01 or later.

### Removed

- `README` was removed; `README.md` is the only readme.
- `test/demo-sec-param.tex` was removed; `demo.tex` covers the same case.

### Fixed

- The CTAN archive contains `README.pdf` again.

## [1.1.2] - 2016-10-07

### Added

- The CTAN archive contains a PDF version of `README.md`.

[Unreleased]: https://github.com/koppor/refenums/compare/v1.1.2...HEAD
[1.1.2]: https://github.com/koppor/refenums/compare/v1.1.1...v1.1.2
