# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `\setupRefEnum[inline]` defines all elements of a kind inline, so `\def<EnumId>` prints the same as `\def<EnumId>Inline`.

## [2.0.0] - 2026-10-19

### Added

- `\setupRefEnum` sets up an enum with key-value options (`separator`, `enclosing`, `combined`).
- `\setupRefEnum` accepts `titleformat` to format the title of each element.
- `\setupRefEnum` accepts `plural` for the plural of the print name.
- `\refEnumFullColon` is the new name of `\refEnumFullT`; the old name still works.
- `\refEnum*`, `\refEnumFull*`, and `\refEnumFullColon*` prefix the print name, e.g., "Requirement Req-1 ("Detect concurrent modification")".
- `\refEnumTitle` prints the title of an element.
- `\setupRefEnum` defines shorthands: `\def<EnumId>` for `\defRefEnum{<EnumId>}`, `\def<EnumId>Inline` for `\defRefEnumInline{<EnumId>}`, and `\ref<EnumId>`, `\ref<EnumId>Full`, `\ref<EnumId>FullColon`, `\ref<EnumId>Title` for the corresponding `\refEnum…{<EnumId>}`. Documents defining such commands themselves need the package option `shorthands=false`.
- The full LPPL license text is now included as `LICENSE`.
- `\setupRefEnums` accepts a second optional argument naming the command each element is wrapped in (e.g., `subsection`). The optional argument of `\defRefEnum` still overrides it per element.

### Changed

- `\ref` prints the identifier, e.g., `Req-1` instead of `1`.
- Titles of elements are set in italics, unless the elements are wrapped in another command, e.g., `subsection`. Use `titleformat={}` for the former upright titles.
- `refenums-demo.pdf` shows the LaTeX code of each example next to its output.
- `refenums-demo.tex` demonstrates the package with requirements and a decision record (MADR style) modeled on JabRef.
- `demo.tex` was renamed to `refenums-demo.tex`, so that `texdoc refenums-demo` finds it, and is typeset with LuaLaTeX.
- refenums references with zref-clever instead of cleveref; `\zcref` prints the print name and the identifier, e.g., "Risk R1" or "Risks R1 and R2". `\cref` prints the identifier, like `\refEnum`, if cleveref is loaded before `\setupRefEnum`.
- refenums requires LaTeX 2023-06-01 and zref-clever 0.4.0 or later.

### Removed

- `README` was removed; `README.md` is the only readme.
- `README.pdf` is no longer in the CTAN archive; CTAN renders `README.md`.
- `test/demo-sec-param.tex` was removed; `refenums-demo.tex` covers the same case.

### Fixed

- The README named the inline command `\defineReferenceableEnumElementInline` instead of `\defRefEnumInline`.

## [1.1.2] - 2016-10-07

### Added

- The CTAN archive contains a PDF version of `README.md`.

## [1.1.1] - 2014-01-03

### Changed

- refenums loads cleveref without options, so that loading cleveref before refenums with own options no longer causes an "options clash". The README recommends `\usepackage[capitalise,nameinlink]{cleveref}` before refenums.
- The CTAN archive contains `demo.pdf` again.

### Fixed

- The README links to the packages on CTAN.

## [1.1.0] - 2013-12-16

### Added

- `\defRefEnumInline` defines an element inline, e.g., in an `inparaenum` environment. Inline elements are enclosed in `\refenuminlineenclosing`, which sets them in italics by default.
- `\refEnumFullP` is the long name of `\refEnumFull`.
- The README documents `\refEnumFullT`, `\refenumenclosing`, and `\refenuminlineenclosing`.

### Changed

- `\setupReferencableEnumElements` was renamed to `\setupRefEnums`.
- `\defineReferenceableEnumElement` was renamed to `\defRefEnum`, and `\defineReferenceableEnumElementInline` to `\defRefEnumInline`.

### Removed

- `release.sh` is no longer in the CTAN archive.

## [1.0.0] - 2013-12-16

### Added

- Initial release on CTAN: `\setupReferencableEnumElements`, `\defineReferenceableEnumElement`, `\defineReferenceableEnumElementInline`, `\refEnum`, `\refEnumFull`, and `\refEnumFullT`, with the options `ONLYSHORT` and `COMBINED`.

[Unreleased]: https://github.com/koppor/refenums/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/koppor/refenums/compare/v1.1.2...v2.0.0
[1.1.2]: https://github.com/koppor/refenums/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/koppor/refenums/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/koppor/refenums/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/koppor/refenums/releases/tag/v1.0.0
