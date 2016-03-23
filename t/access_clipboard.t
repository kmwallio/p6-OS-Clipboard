use v6;
use Test;
use OS::Clipboard;

ok clipboard-present() == True, "Clipboard present";

ok clipboard-copy('hello world') == 0, 'Stored string in clipboard';
ok clipboard-paste() ~~ m/'hello world'/, 'Got back string';

ok clipboard-copy('hello \'world') == 0, 'Stored string in clipboard';
ok clipboard-paste() ~~ m/'hello \'world'/, 'Got back string';

ok clipboard-copy('hello "world"') == 0, 'Stored string in clipboard';
ok clipboard-paste() ~~ m/'hello "world"'/, 'Got back string';

ok clipboard-copy('hello \"world\"') == 0, 'Stored string in clipboard';
ok clipboard-paste() ~~ m/'hello \"world\"'/, 'Got back string';

done-testing;
