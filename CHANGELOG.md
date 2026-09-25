# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- The full LPPL license text is now included as `LICENSE`.
- `\setupRefEnums` accepts a second optional argument naming the command each element is wrapped in (e.g., `subsection`). The optional argument of `\defRefEnum` still overrides it per element.

### Changed

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
