require 'spec_helper'

describe Place do

  subject { Place.new }

  it 'should have a name' do
    subject.should respond_to(:name)
  end

  context '#initialization' do

    it 'should set the name of the place' do
      place = Place.new(:name => "A")

      place.name.should == "A"
    end

  end

end
