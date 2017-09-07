# refenums - ReferenceableEnumElements [![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

Define named items and provide back-references with that name

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
`inparaenum` is offered by the [paralist package].

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

The latest source code is available at https://github.com/koppor/refenums

## Files

* [refenums.sty](refenums.sty): the package
* [demo.tex](demo.tex): small demonstration

  [paralist]: www.ctan.org/pkg/paralist
