# refenums – ReferenceableEnumElements [![CTAN](https://img.shields.io/badge/CTAN-refenums-blue.svg?style=flat-square)](https://ctan.org/pkg/refenums)

> Define named items and provide back-references with that name

This package provides commands to define enumerable items with a number and a long name, which can be referenced referenced later with the name or just the short form.
For instance, "Milestone M1: Specification created" can be defined and later on be referenced with `M1` or `M1 ("Specification created")`.
The text in the references is derived from the definition and also rendered as hyperlink to the definition.
Thus, a change of the definition also leads to a change of all references to the text.
This ensures consistency in the text.

## Usage

```
\usepackage{refenums}
```

Load the package after all packages (hyperref, cleveref, ...).
For best results, use the `nameinlink` option at cleveref.
The option `capitalise` is also useful if you use cleveref's `\cref` command, therefore we recommend loading `cleveref` before `refenums` with follwing line:
`\usepackage[capitalise,nameinlink]{cleveref}`


### Define the "Referenceable Enum Environment"

Decide for `<EnumId>`.
E.g., `req`.

#### Initialize
`\setupRefEnums{<EnumId>}{<PrintName>}`

In case `<PrintName>` is set to `ONLYSHORT`, only the short name is used.

Optional parameter: Separator between `<EnumId>` and number.

#### (Optional) Define shorthand macro to define the macros for referencing

`\newcommand{\def<EnumId>}[2]{\defRefEnum{<EnumId>}{#1}{#2}}`


### Usage in the text

#### Define a single enum
* `\defRefEnum{<EnumId>}{<FullName>}{<LabelId>}` (always supported)
* `\def<EnumId>{<FullName>}{<LabelId>}` (when the shorthand command is defined)

#### Define a single enum using the inline format
`\defineReferenceableEnumElementInline{<EnumId>}{<FullName>}{<LabelId>}`.
Using this, a enumeration similar to the ones of the `inparaenum` environment is possible.
`inparaenum` is offered by the [paralist package](https://www.ctan.org/pkg/paralist).

#### Referencing
 
* `\refEnumFull{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter> ("<FullName>")`, e.g. `R-1 ("Quality")`
* `\refEnumFullP{<EnumId>}{<LabelId>}` is the long form for `\refEnumFull'.
* `\refEnumFullT{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>: "<FullName>"`, e.g. `R-1: "Quality"`
* `\refEnum{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>`, e.g. `R-1`
* References to the label
  * `\nameref{enum:<EnumId>:<LabelId>}` = `<FullName>`
  * `\ref{enum:<EnumId>:<LabelId>}` = `<Counter>`, e.g. `1`

 
## Example

**Initialize**: `\setupRefEnums{R}{Requirement}`

**Define a single enum**: `\defRefEnum{R}{Quality}{qual}`.
When you want to put the element in a section, use the optional parameter:
`\defRefEnum[section]{R}{Quality}{qual}`

**Referencing**:

* Reference only Name + Number: `\refEnum{R}{qual}`
* Full reference with the print name in brackets: `\refEnumFull{R}{qual}`
* Full reference with the print name appended after ":": `\refEnumFullT{R}{qual}`

**See also** [demo.tex](demo.tex).


## Tuning

When defining a referenceable element, this element is enclosed using `\refenumenclosing` for normal enums and `\refenumenclosinginline` for inline enums.
These commands can be redefined after package usage.

## TODO

* The decision to put the enum in a section should be taken at `\setupRefEnums` not at `\defRefEnum`.
* Enable automatically generating `\def<EnumId>` at `\setupRefEnums` via a package parameter.


## Source code

The latest source code is available at <https://github.com/latextemplates/refenums>.

## Files

* [refenums.sty](refenums.sty): the package
* [demo.tex](demo.tex): small demonstration

## Related packages

* See <https://ctan.org/topic/label-ref> for an overview.
* In the conext of chemistry, [chemsec](https://ctan.org/pkg/chemsec) offers taylored functionality.

## License

Copyright 2013 Oliver Kopp, Tobias Binz

This work may be distributed and/or modified under the conditions of
the LaTeX Project Public License, version 1.3c of the license.
The latest version of this license is in
  <http://www.latex-project.org/lppl.txt>
and version 1.3c or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status "maintained".

The Current Maintainer and author of this work is Oliver Kopp.

This work consists of the files `refenums.sty`, `demo.tex`, `README.md`, and `test/demo-sec-param.tex`.
In case files are not listed here, but available at <https://github.com/latextemplates/refenums>, these additional files also form part of this work.
