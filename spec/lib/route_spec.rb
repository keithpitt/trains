require 'spec_helper'

describe Route do

  subject { Route.new }

  it 'should have an origin' do
    subject.should respond_to(:origin)
  end

  it 'should have a destination' do
    subject.should respond_to(:destination)
  end

  it 'should have a distance' do
    subject.should respond_to(:distance)
  end

  context '#initialization' do

    let(:origin) { Place.new(:name => "A") }
    let(:destination) { Place.new(:name => "B") }

    it 'should set the origin of the route' do
      route = Route.new(:origin => origin)

      route.origin.should == origin
    end

    it 'should set the destination of the route' do
      route = Route.new(:destination => destination)

      route.destination.should == destination
    end

    it 'should set the distance of the route' do
      route = Route.new(:distance => 12)

      route.distance.should == 12
    end

    it "should set all the properties at once" do
      route = Route.new(:destination => destination, :origin => origin, :distance => 6)

      route.destination.should == destination
      route.origin.should == origin
      route.distance.should == 6
    end

  end

end
