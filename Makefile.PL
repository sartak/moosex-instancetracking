use inc::Module::Install;

name           'MooseX-InstanceTracking';
all_from       'lib/MooseX/InstanceTracking.pm';

requires 'Moose' => '0.72';
requires 'Class::MOP' => '0.79';

WriteAll;

