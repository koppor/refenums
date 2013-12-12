# ReferenceableEnumElement

## Usage

### Define the "Referenceable Enum Environment"

Decide for `<EnumId>`.
E.g., `req`.

#### Set global counter
`\newcounter{<EnumId>}`

#### Define macro to define the macros for referencing

`\newcommand{\define<EnumId>}[2]{\defineReferenceableEnumElement{<EnumId>}{Requirement}{#1}{#2}}`

### Usage in the text

#### Setup
`\define<EnumId>{}{}`

#### Referencing
 
* `\refEnumFull{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter> ("<fullName>")`, e.g. `CA-1 ("Quality")`
* `\refEnum{<EnumId>}{<LabelId>}` = `<EnumId>-<Counter>`, e.g. `CA-1`
* References to the label
** `\nameref{enum:<EnumId>:<LabelId>}` = `<fullName>`
** `\ref{enum:<EnumId>:<LabelId>}` = `<Counter>`, e.g. `1`

 
## Example

```
\newcommand{\enumCrawlerReq}{CR}
\newcounter{\enumCrawlerReq}
\newcommand{\defineCrawlerReq}[2]{\defineReferenceableEnumElement{\enumCrawlerReq}{Requirement}{#1}{#2}}
```

`\defineCrawlerReq{ETG Quality}`

See also [demo.tex](demo.tex).

## Files

* `referenceableenumelement.tex`: the macro definitions
* `demo.tex`: small demonstration
