package MooseX::InstanceTracking;
use Moose::Role;
use Set::Object::Weak;

has _instances => (
    is      => 'ro',
    isa     => 'Set::Object::Weak',
    default => sub { Set::Object::Weak->new },
    handles => {
        instances => 'members',
    },
    lazy    => 1,
);

sub track_instance {
    my $self = shift;
    $self->_instances->insert(@_);
}

around 'construct_instance', 'clone_instance' => sub {
    my $orig = shift;
    my $self = shift;

    my $instance = $orig->($self, @_);
    $self->track_instance($instance);

    return $instance;
};

before make_immutable => sub {
    confess "Instance tracking does not yet work with make_immutable.";
};

1;

