Pathbuilder
===========

A simple helper to build url-paths (think restful) in a manner that looks like a method call. This gem is intended as 
a component in rpc-style http client libraries.

    PathBuilder.new.users[5].deactivate.to_s
      => "users/5/deactivate"
    
Installation
============

Not yet published as a gem, so you'll have to

    git clone git@github.com:simen/pathbuilder.git
    cd pathbuilder
    rake install

Or if you use the awesomeness that is bundler, you stick this in your Gemfile:

    gem "pathbuilder", :git => git@github.com:simen/pathbuilder.git

Usage
=====

    PathBuilder.new.users.path
      => "/users"

    PathBulder.new.users[5]
      => "/users/5"

    PathBulder.new.geopoints.closest(10.0, 51.2)
      => "/geopoints/closest/10.0/51.2"

    PathBuilder.new[5].user_timeline.path
      => "/5/user_timeline"

    p = PathBuilder.new.identities(:nick => "sigve")
    p.path
      => "/identities"
    p.params
      => {:nick => "sigve"} 
    
