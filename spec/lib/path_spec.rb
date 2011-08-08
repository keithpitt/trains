require 'spec_helper'

describe Path do

  subject { Path.new }

  let (:a) { Place.new(:name => "A") }
  let (:b) { Place.new(:name => "B") }

  let (:a_b_route) { Route.new(:origin => a, :destination => b, :distance => 5) }
  let (:b_a_route) { Route.new(:origin => b, :destination => a, :distance => 4) }

  it 'should inherit from Array' do
    Path.superclass.should == Array
  end

  describe '#distance' do

    it 'should return the distance of all the routes summed together' do
      subject << a_b_route
      subject << b_a_route

      subject.distance.should == 9
    end

  end

  describe '#to_s' do

    it 'should return the route joined by a dash' do
      subject << a_b_route
      subject << b_a_route

      subject.to_s.should == 'A-B-A'
    end

    it 'should allow you to debug the path' do
      subject << a_b_route
      subject << b_a_route

      subject.to_s(:debug => true).should == 'A-B-A (Distance: 9, Stops: 2)'
    end

    it 'should return nothing if there are no routes' do
      subject.to_s.should == nil
    end

  end

end
