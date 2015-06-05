# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl module_check.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';
use Test::More tests => 2;
my %hold = (
    'JE'         => undef,
    'Crypt::RSaA' => undef,
    'Digest::MD5'=> undef,
);
for my $module (keys %hold){
    eval "require $module";
    $hold{$module} = $@?$@:"ok";     
}

ok($hold{'Digest::MD5'} eq "ok", "md5 module check");
ok($hold{'Crypt::RSA'} eq "ok" ||  $hold{'JE'} eq "ok"  ||  0 , "rsa module check");

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
