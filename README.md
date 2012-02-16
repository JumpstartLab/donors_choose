# DonorsChoose

DonorsChoose.org is an online charity that makes it easy for anyone to help students in need.

This is a gem that wraps [their API](http://developer.donorschoose.org/home).

## Installation

Add this line to your application's Gemfile:

    gem 'donors_choose'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install donors_choose

## Usage

The first thing you should do is [request an API
key](http://developer.donorschoose.org/help-contact). They provide a test key,
"DONORSCHOOSE", that will occasionally be turned off. So be nice and get your
own. :)

We're currently developing support for the full API, but right now, there are
just two methods.

    DonorsChoose.api_key = "DONORSCHOOSE"

    projects = DonorsChoose::Project.near_me("40.4405556", "-79.9961111")
    projects = DonorsChoose::Project.by_zip("15232")

Projects will be an array of objects that contain all of the data returned by
the request. You can learn about these objects through introspection:

    > projects.first.methods(false)
    => [:id, ...
 
For example. These objects are dynamically created based on the response, so
minor API updates may change the attributes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
