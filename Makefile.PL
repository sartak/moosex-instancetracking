use inc::Module::Install;

name           'MooseX-InstanceTracking';
all_from       'lib/MooseX/InstanceTracking.pm';

requires 'Class::MOP' => '0.79';
requires 'Moose';

WriteAll;

