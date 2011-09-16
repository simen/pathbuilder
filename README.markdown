Pathbuilder
===========

A simple helper to build url-paths (think restful) in a manner that looks like a method call.

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

    PathBuilder.new.users.to_s
      => "users"

    PathBulder.new[5].user_timeline
      => "5/user_timeline"
    
This gem is intended as a building block for restful api-adapters. Typically you could subclass it and implement a get and post method so that you could write

    client = YourIncredibleClient.new
    client.users[5].friends[9182].get

Additionally you can implement the method handle_invocation so that the programmer may "invoke" the url like a method

    class VerySpecialPathBuilder < PathBuilder
      def handle_invocation(*args)
        [@path] + args
      end 
    end

    VerySpecialPathBuilder.new.users[523].updates(:body => "A new update")
      => [users/523/updates, {:body => "A new update"}]
    
