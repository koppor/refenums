# ReferenceableEnumElement

This package provides commands to define enumerable items, which can be referenced
For instance, "Milestone M1: Specification created"
Later, one can reference the short name of the item (M1) or the short name together with the print name (M1 ("Specification created"))


## Usage

```
\usepackage{refenums}
```

### Define the "Referenceable Enum Environment"

Decide for `<EnumId>`.
E.g., `req`.

#### Initialize
`\setupReferencableEnumElements{<EnumId>}{<PrintName>}`

In case `<PrintName>` is set to `ONLYSHORT`, only the short name is used.

Optional parameter: Separator between `<EnumId>` and number.

#### (Optional) Define shorthand macro to define the macros for referencing

`\newcommand{\define<EnumId>}[2]{\defineReferenceableEnumElement{<EnumId>}{#1}{#2}}`


### Usage in the text

#### Define a single enum
`\define<EnumId>{<FullName>}{<LabelId>}`

#### Referencing
 
* `\refEnumFull{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter> ("<FullName>")`, e.g. `CA-1 ("Quality")`
* `\refEnum{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>`, e.g. `CA-1`
* References to the label
  * `\nameref{enum:<EnumId>:<LabelId>}` = `<FullName>`
  * `\ref{enum:<EnumId>:<LabelId>}` = `<Counter>`, e.g. `1`

 
## Example

**Initialize**: `\setupReferencableEnumElements{R}{Requirement}`

**Define a single enum**: `\defineReferenceableEnumElement{R}{Quality}{qual}`.
When you want to put the element in a section, use the optional parameter:
`\defineReferenceableEnumElement[section]{R}{Quality}{qual}`

**Referencing**:

* Reference only Name + Number: `\refEnum{R}{qual}`
* Full reference with the print name in brackets: `\refEnumFull{R}{qual}`
* Full reference with the print name appended after ":": `\refEnumFullT{R}{qual}`

**See also** [demo.tex](demo.tex).


## TODO

The decision to put the enum in a section should be taken at `\setupReferencableEnumElements` not at `\defineReferenceableEnumElement`.

## Files

* [refenums.sty](refenums.sty): the package
* [demo.tex](demo.tex): small demonstration
