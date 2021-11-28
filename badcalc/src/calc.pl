#!/usr/bin/perl
use strict;
use warnings;
use Mojolicious::Lite;


any '/'   => sub {
    my $self = shift;

    my $expr = '';
    if ($expr = $self->param('expr')) {        
        my $result = eval $expr;
        $result = "$@" if $@;
        
        $self->stash(result => $result);
    }
    else {
        $self->stash(result => undef);
    }

    $self->render('calc', expr => $expr);
};

app->start;


__DATA__

@@ calc.html.ep
<!DOCTYPE html>
<html>
    <head>
    <title>Calc App</title>
    </head>

    <body>
    <h1>Calculator</h1>
<form method="post">
    <label for="expr">Calculate:</label>
    <input id="expr" name="expr" value="<%= $expr %>">
    <button type="submit">Go!</button>
</form>

% if ($result) {
    <p>
    Result: <mark><%= $result %></mark>
    </p>
% }
    </body>
</html>
