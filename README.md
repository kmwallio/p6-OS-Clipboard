# OS::Clipboard

Manipulate the clipboard from your Perl 6 app.

## Installation

## Usage

Put something in the clipboard.

``` perl6
use v6;
use OS::Clipboard;

clipboard-copy('text')
```

Take something out of the clipboard.

``` perl6
use v6;
use OS::Clipboard;

clipboard-paste();
```
