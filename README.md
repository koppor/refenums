# refenums – ReferenceableEnumElements [![CTAN](https://img.shields.io/badge/CTAN-refenums-blue.svg?style=flat-square)](https://ctan.org/pkg/refenums)

> Define named items and provide back-references with that name

This package provides commands to define enumerable items with a number and a long name, which can be referenced referenced later with the name or just the short form.
For instance, "Milestone M1: Specification created" can be defined and later on be referenced with `M1` or `M1 ("Specification created")`.
The text in the references is derived from the definition and also rendered as hyperlink to the definition.
Thus, a change of the definition also leads to a change of all references to the text.
This ensures consistency in the text.

## Usage

```latex
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

```latex
\setupRefEnum[<options>]{<EnumId>}{<PrintName>}
```

In case `<PrintName>` is set to `ONLYSHORT`, only the short name is used.

Options (key-value, all optional):

* `separator=<text>`: separator between `<EnumId>` and number. Default: `-`. Use `separator={}` for none and `separator={ }` for a space.
* `enclosing=<name>`: name of the command the heading of each element is wrapped in, e.g., `subsection`. Default: `refenumenclosing`, which prints the heading as is (see [Tuning](#tuning)).
* `combined`: print `<PrintName> <EnumId><Number>`, e.g., `Milestone M1`.
* `titleformat=<name>`: name of the command the title of each element is wrapped in, e.g., `emph`. Default: `emph` (italics), or none if `enclosing` names another command. Use `titleformat={}` for none. References to the title are not affected.

For instance, `\setupRefEnum[enclosing=subsection]{Step}{Step}` puts every step into its own subsection.

The older `\setupRefEnums[<separator>][<enclosing>]{<EnumId>}{<PrintName>}` takes the same settings as positional optional arguments, with `COMBINED` as separator for `combined`.

#### (Optional) Shorthand commands

With `\usepackage[shorthands]{refenums}`, `\setupRefEnum{<EnumId>}{...}` also defines `\def<EnumId>{<FullName>}{<LabelId>}` as a shorthand for `\defRefEnum{<EnumId>}{<FullName>}{<LabelId>}`.
If a command with that name exists already, LaTeX reports an error; choose another `<EnumId>` then.

### Usage in the text

#### Define a single enum

* `\defRefEnum{<EnumId>}{<FullName>}{<LabelId>}` (always supported)
* `\def<EnumId>{<FullName>}{<LabelId>}` (with the package option `shorthands`)

#### Define a single enum using the inline format

`\defineReferenceableEnumElementInline{<EnumId>}{<FullName>}{<LabelId>}`.
Using this, a enumeration similar to the ones of the `inparaenum` environment is possible.
`inparaenum` is offered by the [paralist package](https://www.ctan.org/pkg/paralist).

#### Referencing
 
* `\refEnumFull{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter> ("<FullName>")`, e.g. `R-1 ("Quality")`
* `\refEnumFullP{<EnumId>}{<LabelId>}` is the long form for `\refEnumFull`.
* `\refEnumFullT{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>: "<FullName>"`, e.g. `R-1: "Quality"`
* `\refEnum{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>`, e.g. `R-1`
* References to the label
  * `\nameref{enum:<EnumId>:<LabelId>}` = `<FullName>`
  * `\ref{enum:<EnumId>:<LabelId>}` = `<Counter>`, e.g. `1`
  * `\zcref{enum:<EnumId>:<LabelId>}` = same as `\refEnum`, when [zref-clever](https://ctan.org/pkg/zref-clever) is loaded before `\setupRefEnum`
 
## Example

**Initialize**: `\setupRefEnum{R}{Requirement}`

**Define a single enum**: `\defRefEnum{R}{Quality}{qual}`.
When you want to put all elements in a section, set it at initialization:
`\setupRefEnum[enclosing=section]{R}{Requirement}`.

**Referencing**:

* Reference only Name + Number: `\refEnum{R}{qual}`
* Full reference with the print name in brackets: `\refEnumFull{R}{qual}`
* Full reference with the print name appended after ":": `\refEnumFullT{R}{qual}`

**See also** [demo.tex](demo.tex) and its rendering [demo.pdf](https://koppor.github.io/refenums/demo.pdf), which shows the LaTeX code next to each result.

## Tuning

The heading of an element is wrapped in `\refenumenclosing` (unless `enclosing` says otherwise), the one of an inline element in `\refenuminlineenclosing`.
By default, `\refenumenclosing` prints the heading as is and `\refenuminlineenclosing` in italics.
Both can be redefined after loading the package, e.g., `\renewcommand{\refenumenclosing}[1]{#1.}` adds a dot after each heading.

## Source code

The latest source code is available at <https://github.com/koppor/refenums>.

## Files

* [refenums.sty](refenums.sty): the package
* [demo.tex](demo.tex): small demonstration

## Related packages

* See <https://ctan.org/topic/label-ref> for an overview.
* [zref-clever](https://ctan.org/pkg/zref-clever) (like [cleveref](https://ctan.org/pkg/cleveref)) prints the type and number of a reference.
  refenums builds on such references: `\defRefEnum` also prints the heading of an item, stores its title, and the references can include that title (`\refEnumFull`, `\refEnumFullT`).
  When zref-clever is loaded, refenums sets it up, so that `\zcref` prints the same identifier as `\refEnum`.
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

This work consists of the files `refenums.sty`, `demo.tex`, and `README.md`.
In case files are not listed here, but available at <https://github.com/koppor/refenums>, these additional files also form part of this work.
