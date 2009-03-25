package MooseX::InstanceTracking::Role::Constructor;
use Moose::Role;

around _generate_instance => sub {
    my $orig = shift;
    my ($self, $var, $class_var) = @_;

    my $generate_instance = $orig->(@_);

    $generate_instance .= "Moose::Meta::Class->initialize($class_var)->_track_instance($var);\n";

    return $generate_instance;
};

1;

