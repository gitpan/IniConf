# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use IniConf;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# test 2
print "Opening ini file ..... ";
if ($ini = new IniConf -file => "./test.ini") {
	print "ok 2\n";
} else {
	print "not ok 2\n";
}

# test 3
print "Reading a value ...... ";
$value = $ini->val('test1', 'one');
if ($value eq 'value1') {
	print "ok 3\n";
} else {
	print "not ok 3\n";
}

# test 4
print "Creating a new value . ";
$ini->newval('test2', 'seven', 'value7');
$ini->RewriteConfig;
$ini->ReadConfig;
$value = $ini->val('test2', 'seven');
if ($value eq 'value7') {
	print "ok 4\n";
} else {
	print "not ok 4\n";
}

# test 5
print "Deleting a value ..... ";
$ini->delval('test2', 'seven');
$ini->RewriteConfig;
$ini->ReadConfig;
$value='';
$value = $ini->val('test2', 'seven');
if ($value eq '') {
	print "ok 5\n";
} else {
	print "not ok 5\n";
}

# test 6
print "Weird characters in section name..... ";
$value = $ini->val('[w]eird characters', 'multiline');
if ($value eq "This\nis a multi-line\nvalue") {
      print "ok 6\n";
} else {
      print "not ok 6\n";
}


