# ReferenceableEnumElement

## Usage

### Define the "Referenceable Enum Environment"

Decide for `<EnumId>`.
E.g., `req`.

#### Initialize
`\setupReferencableEnumElements{<EnumId>}{<PrintName>}

In case `<PrintName>` is set to `ONLYSHORT`, only the short name is used.

Optional parameter: Separator between `<EnumId>` and number.

#### (Optional) Define shorthand macro to define the macros for referencing

`\newcommand{\define<EnumId>}[2]{\defineReferenceableEnumElement{<EnumId>}{#1}{#2}}`


### Usage in the text

#### Setup
`\define<EnumId>{<FullName>}{<LabelId>}`

#### Referencing
 
* `\refEnumFull{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter> ("<FullName>")`, e.g. `CA-1 ("Quality")`
* `\refEnum{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>`, e.g. `CA-1`
* References to the label
** `\nameref{enum:<EnumId>:<LabelId>}` = `<FullName>`
** `\ref{enum:<EnumId>:<LabelId>}` = `<Counter>`, e.g. `1`

 
## Example

```
\setupReferencableEnumElements{R}{Requirement}

\newcommand{\defineReq}[2]{\defineReferenceableEnumElement{R}{#1}{#2}}
```

...

`\defineReq{Quality}{qual}`

See also [demo.tex](demo.tex).

## Files

* `referenceableenumelement.tex`: the macro definitions
* `demo.tex`: small demonstration
