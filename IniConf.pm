package IniConf;

use strict;
use Config::IniFiles;

use vars       qw($VERSION @ISA);
$VERSION = '1.01';
@ISA         = qw(Config::IniFiles);

sub new {
    my $self = new Config::IniFiles( @_ );
    return undef unless defined $self;

    my $proto = shift;
    my $class = ref($proto) || $proto;
    bless ($self, $class);

    return $self;
}
1;
