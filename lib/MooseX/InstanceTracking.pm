package MooseX::InstanceTracking;
use Moose::Role;
use Set::Object::Weak;

has _instances => (
    is      => 'ro',
    isa     => 'Set::Object::Weak',
    default => sub { Set::Object::Weak->new },
    lazy    => 1,
    handles => {
        instances        => 'members',
        track_instance   => 'insert',
        untrack_instance => 'remove',
    },
);

around 'construct_instance', 'clone_instance' => sub {
    my $orig = shift;
    my $self = shift;

    my $instance = $orig->($self, @_);
    $self->track_instance($instance);

    return $instance;
};

after rebless_instance => sub {
    my $self     = shift;
    my $instance = shift;

    $self->track_instance($instance);
};

before rebless_instance_away => sub {
    my $self     = shift;
    my $instance = shift;

    $self->untrack_instance($instance);
};

before make_immutable => sub {
    confess "Instance tracking does not yet work with make_immutable.";
};

1;

