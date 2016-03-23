# OS::Clipboard

Manipulate the clipboard from your Perl 6 app. [![Build Status](https://travis-ci.org/kmwallio/p6-OS-Clipboard.svg?branch=master)](https://travis-ci.org/kmwallio/p6-OS-Clipboard)

## Installation

Requires xclip (Linux), pbcopy (OS X), or clip (Windows).

Ubuntu: `sudo apt-get install xclip`

```
panda --notests install git://github.com/kmwallio/p6-OS-Clipboard.git
```

*--notests for now.  Attempting to install over SSH halts during tests.*

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

my $content = clipboard-paste();
```

## TODO

 * Add support for arbitrary content...
 * Check for multiline support and whatnot...
   * Improve tests
 * Properly escape strings...
 * Figure out proper Windows support...
 * pod comments

## Acknowledgements

* [File::Which](https://github.com/azawawi/perl6-file-which)
