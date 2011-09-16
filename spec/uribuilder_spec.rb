require 'spec_helper'

describe UriBuilder do
  it "returns blank for blank paths" do
    subject.to_s.should eq('')
  end

  it "yields relative paths" do 
    subject.simplepath.to_s.should eq('simplepath')
  end

  it "puts slashes between elements" do
    subject.first.second.to_s.should eq('first/second')
  end

  it "adds indexes as path elements" do
    subject.users[5].to_s.should eq('users/5')    
  end

  it "adds multiple indexes as separate path elements" do
    subject.location[10.0,20.0].to_s.should eq('location/10.0/20.0')
  end

  it "calls the invocation handler when called with parameters" do
    subject.should_recieve(:handle_invocation)
    subject.dummy(10)
  end

  it "temporarily pushes invocation methods and parameters to the path and then restores the path" do
    class InnerPathCheck < UriBuilder
      def handle_invocation(*args)
        @inner_path = self.to_s
      end
    end
    path = InnerPathCheck.new.one.two
    path.three(10,20)
    path.instance_variable_get(:@inner_path).should eq("one/two/three/10/20")
    path.to_s.should eq("one/two")
  end

  it "doesn't push hashes to the path on invocation, but passes them to the invocation handler" do
    class HashHandlerCheck < UriBuilder
      def handle_invocation(*args)
        @args = args
        @url = self.to_s
      end
    end
    hash_handler = HashHandlerCheck.new
    parameter_hash = {:a => 1, :b => 2}
    hash_handler.bingo(parameter_hash)
    hash_handler.instance_variable_get(:@args).first.should eq(parameter_hash)
    hash_handler.instance_variable_get(:@url).should eq("bingo")
  end

end
