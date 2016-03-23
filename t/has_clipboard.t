use v6;
use Test;
use OS::Clipboard;

ok clipboard-present() == True, "Clipboard present";

done-testing;
