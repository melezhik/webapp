#!/usr/bin/env perl

use Dancer2;
use Dancer2::Plugin::Auth::Tiny;

set show_errors => 1;
set session     => 'Simple';


get '/' => sub {
    "Hello World!"
};


get '/public' => sub { return 'public area' };

get '/private' => needs login => sub { return 'private area' };

get '/login' => sub {
    session "user" => "Robin Good";
    return "login and to back to " . params->{return_url};
};

get '/logout' => sub {
    app->destroy_session;
    redirect uri_for('/public');
};

dance;

