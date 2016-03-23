use v6;
use Test;
use OS::Clipboard;

ok clipboard-present() == True, "Clipboard present";
my $current = clipboard-paste(); # Get current contents...

ok clipboard-copy('hello world') == 0, 'Stored string in clipboard';
my $paste = clipboard-paste();
ok clipboard-paste() ~~ m/'hello world'/, 'Got back string';

clipboard-copy($current);
