require 'spec_helper'

describe PathBuilder do
  it "returns blank for blank paths" do
    subject.to_s.should eq('/')
  end

  it "yields relative paths" do 
    subject.simplepath.to_s.should eq('/simplepath')
  end

  it "puts slashes between elements" do
    subject.first.second.to_s.should eq('/first/second')
  end

  it "adds indexes as path elements" do
    subject.users[5].to_s.should eq('/users/5')    
  end

  it "adds multiple indexes as separate path elements" do
    subject.location[10.0,20.0].to_s.should eq('/location/10.0/20.0')
  end

  it "pushes method params to the path" do
    subject.three(10,20)
    subject.path.should eq("/three/10/20")
  end

  it "merges hash method params into the params hash" do
    subject.three.two(:a => 3)
    subject.path.should eq "/three/two"
    subject.params.should eq({:a => 3})
  end

end
