use inc::Module::Install;

name           'MooseX-InstanceTracking';
all_from       'lib/MooseX/InstanceTracking.pm';
githubmeta;

requires 'Moose' => '0.83';
requires 'Set::Object::Weak';

WriteAll;

