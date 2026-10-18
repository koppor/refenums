# refenums – ReferenceableEnumElements [![CTAN](https://img.shields.io/badge/CTAN-refenums-blue.svg?style=flat-square)](https://ctan.org/pkg/refenums)

> Define numbered items with a title, such as requirements, risks, or milestones, and reference them by identifier (`Req-1`), title, or both, with hyperlinks to the definition

This package provides commands to define enumerable items with a number and a long name, which can be referenced later with the name or just the short form.
For instance, "Milestone M1: Specification created" can be defined and later on be referenced with `M1` or `M1 ("Specification created")`.
The text in the references is derived from the definition and also rendered as hyperlink to the definition.
Thus, a change of the definition also leads to a change of all references to the text.
This ensures consistency in the text.

## Usage

```latex
\usepackage{refenums}

% Once per kind of item: identifier and name
\setupRefEnum{Req}{Requirement}

% Define an item: title and label
\defReq{Detect concurrent modification}{detect}
If the library file changed since the save started, the save is aborted.

% Reference it
\zcref{enum:Req:detect}        % Requirement Req-1
\refEnum{Req}{detect}          % Req-1
\refEnumFull{Req}{detect}      % Req-1 ("Detect concurrent modification")
\refEnumFull*{Req}{detect}     % Requirement Req-1 ("Detect concurrent modification")
\refEnumTitle{Req}{detect}     % Detect concurrent modification
```

The definition prints "Requirement 1 (Req-1): *Detect concurrent modification*".
All references are hyperlinks to it.

See [demo.tex](demo.tex) and its rendering [demo.pdf](https://koppor.github.io/refenums/demo.pdf), which shows the LaTeX code next to each result.

refenums needs LaTeX 2023-06-01 and [zref-clever](https://ctan.org/pkg/zref-clever) 0.4.0 or later.
It loads [hyperref](https://ctan.org/pkg/hyperref) and zref-clever itself; if you load them yourself, e.g., to pass options, load refenums after them.

## Advanced usage

### Options of `\setupRefEnum`

```latex
\setupRefEnum[<options>]{<EnumId>}{<PrintName>}
```

If `<PrintName>` is `ONLYSHORT`, only the short form is printed, e.g., `Feature 1` with `separator={ }`.

Options (key-value, all optional):

* `separator=<text>`: separator between `<EnumId>` and number. Default: `-`. Use `separator={}` for none and `separator={ }` for a space.
* `plural=<text>`: plural of `<PrintName>`, printed by `\zcref` for several items. Default: `<PrintName>s`.
* `combined`: print `<PrintName> <EnumId><Number>`, e.g., `Milestone M1`.
* `enclosing=<name>`: name of the command the heading of each element is wrapped in, e.g., `subsection`. Default: `refenumenclosing` (see [Tuning](#tuning)).
* `titleformat=<name>`: name of the command the title of each element is wrapped in, e.g., `textbf`. Default: `emph` (italics), or none if `enclosing` names another command. Use `titleformat={}` for none. References to the title are not affected.

The older `\setupRefEnums[<separator>][<enclosing>]{<EnumId>}{<PrintName>}` takes the same settings as positional optional arguments, with `COMBINED` as separator for `combined`.

### Defining items

`\setupRefEnum{<EnumId>}` defines two shorthands:

* `\def<EnumId>{<FullName>}{<LabelId>}` for `\defRefEnum{<EnumId>}{<FullName>}{<LabelId>}`
* `\def<EnumId>Inline{<FullName>}{<LabelId>}` for `\defRefEnumInline{<EnumId>}{<FullName>}{<LabelId>}`, which prints `(<EnumId>-<Counter>) <FullName>` within the text, similar to the `inparaenum` environment of [paralist](https://ctan.org/pkg/paralist).

If a command with one of these names exists already, LaTeX reports an error; choose another `<EnumId>` then, or turn the shorthands off with `\usepackage[shorthands=false]{refenums}` and use the long forms.

### Referencing

* `\refEnumFullColon{<EnumId>}{<LabelId>}` prints `<EnumId>-<Counter>: "<FullName>"`, e.g., `Req-1: "Detect concurrent modification"`.
* `\refEnumFullP` and `\refEnumFullT` are older names of `\refEnumFull` and `\refEnumFullColon`.
* The starred forms `\refEnum*`, `\refEnumFull*`, `\refEnumFullColon*` prefix the print name, e.g., `Requirement Req-1`.
* `\refEnumTitle{<EnumId>}{<LabelId>}` is short for `\nameref{enum:<EnumId>:<LabelId>}`.
* `\zcref` of [zref-clever](https://ctan.org/pkg/zref-clever) prints the print name and the identifier, e.g., `Requirement Req-1`. It references several items at once, e.g., `\zcref{enum:Req:detect,enum:Req:keep}` prints `Requirements Req-1 and Req-2`.
* `\refEnum{<EnumId>}{<LabelId>}` is short for `\zcref[noname]{enum:<EnumId>:<LabelId>}`, `\refEnum*` for `\zcref`; `\ref{enum:<EnumId>:<LabelId>}` prints the identifier as well.

### Tuning

The heading of an element is wrapped in `\refenumenclosing` (unless `enclosing` says otherwise), the one of an inline element in `\refenuminlineenclosing`.
By default, `\refenumenclosing` prints the heading as is and `\refenuminlineenclosing` in italics.
Both can be redefined after loading the package, e.g., `\renewcommand{\refenumenclosing}[1]{#1.}` adds a dot after each heading.

### cleveref

refenums references with zref-clever; [cleveref](https://ctan.org/pkg/cleveref) is supported for existing documents only.
`\cref` prints the same identifiers as `\refEnum`, no matter whether cleveref is loaded before or after refenums.
Only `\setupRefEnum` must come after `\usepackage{cleveref}`; otherwise, `\cref` prints `?? 1` for that enum.

## Source code

The latest source code is available at <https://github.com/koppor/refenums>.

## Files

* [refenums.sty](refenums.sty): the package
* [demo.tex](demo.tex): small demonstration

## Related packages

* See <https://ctan.org/topic/label-ref> for an overview.
* [zref-clever](https://ctan.org/pkg/zref-clever) (like [cleveref](https://ctan.org/pkg/cleveref)) prints the type and number of a reference.
  refenums builds on zref-clever: `\defRefEnum` also prints the heading of an item, stores its title, and the references can include that title (`\refEnumFull`, `\refEnumFullColon`).
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
