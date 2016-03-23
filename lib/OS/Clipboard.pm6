use v6;
use File::Which;

module OS::Clipboard {
  constant IS_MAC = $*DISTRO.name eq 'macosx';
  constant MAC_CLIPBOARD = 'pbcopy';
  constant MAC_PASTEBOARD = 'pbpaste';
  constant IS_WIN = $*DISTRO.is-win;
  constant WIN_CLIPBOARD = 'clip';
  constant LIN_CLIPBOARD = 'xclip';
  constant LIN_PASTEBOARD = 'xclip -o';
  my $win_pasteboard = ""; # Hack for windows...

  sub clipboard-current() {
    if (IS_WIN) {
      return WIN_CLIPBOARD;
    } elsif (IS_MAC) {
      return MAC_CLIPBOARD;
    } else {
      return LIN_CLIPBOARD;
    }
  }

  sub clipboard-slash($text) {
    my $str = $text;
    $str ~~ s:g/\"/\\"/;
    return $str;
  }

  sub clipboard-deslash($text) {
    my $str = $text;
    $str ~~ s:g/\\\"/"/;
    return $str;
  }

  sub clipboard-present() is export {
    if (IS_WIN) {
      return !(which(WIN_CLIPBOARD) eq "");
    } elsif (IS_MAC) {
      return !(which(MAC_CLIPBOARD) eq "");
    } else {
      return !(which(LIN_CLIPBOARD) eq "");
    }
  }

  sub clipboard-copy(Str $content) is export {
    my @command = 'echo "', clipboard-slash($content), '"|', clipboard-current();
    my $result = shell @command.join(' ');
    $win_pasteboard = $content;
    return $result;
  }

  sub clipboard-paste() is export {
    my @command;
    if (IS_WIN) {
      return $win_pasteboard;
    } elsif (IS_MAC) {
      @command.push(MAC_PASTEBOARD);
    } else {
      @command.push(LIN_PASTEBOARD);
    }
    return qq:x/@command.join(' ')/;
  }
}
