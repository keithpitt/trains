require 'spec_helper'

describe Conductor do

  subject { Conductor.new }

  # Factory data as supplied by ThoughtWorks
  #
  # Test Input:
  # For the test input, the towns are named using the first few letters of the alphabet from A to D.
  # A route between two towns (A to B) with a distance of 5 is represented as AB5.
  #
  # Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

  let (:a) { Place.new(:name => "A") }
  let (:b) { Place.new(:name => "B") }
  let (:c) { Place.new(:name => "C") }
  let (:d) { Place.new(:name => "D") }
  let (:e) { Place.new(:name => "E") }

  before :all do
    subject.places << a
    subject.places << b
    subject.places << c
    subject.places << d
    subject.places << e

    subject.routes << Route.new(:origin => a, :destination => b, :distance => 5)
    subject.routes << Route.new(:origin => b, :destination => c, :distance => 4)
    subject.routes << Route.new(:origin => c, :destination => d, :distance => 8)
    subject.routes << Route.new(:origin => d, :destination => c, :distance => 8)
    subject.routes << Route.new(:origin => d, :destination => e, :distance => 6)
    subject.routes << Route.new(:origin => a, :destination => d, :distance => 5)
    subject.routes << Route.new(:origin => c, :destination => e, :distance => 2)
    subject.routes << Route.new(:origin => e, :destination => b, :distance => 3)
    subject.routes << Route.new(:origin => a, :destination => e, :distance => 7)
  end

  it 'should have a places array' do
    subject.places.should be_kind_of(Array)
  end

  it 'should have a routes array' do
    subject.routes.should be_kind_of(Array)
  end

  describe '#distance_between' do

    it 'should return the correct distance between routes' do
      # TW: Question 1
      subject.distance_between(a, b, c).should == 9

      # TW: Question 2
      subject.distance_between(a, d).should == 5

      # TW: Question 3
      subject.distance_between(a, d, c).should == 13

      # TW: Question 4
      subject.distance_between(a, e, b, c, d).should == 22
    end

    it 'should raise an error if no path can be found' do
      expect do
        # TW: Question 5
        subject.distance_between(a, e, d)
      end.should raise_error(Conductor::NoPathError)
    end

  end

  describe '#paths_between' do

    it 'should return the number of paths between 2 places with a maximum amount of stops' do
      # TW: Question 6
      paths = subject.paths_between(c, c, :maximum_stops => 3).map(&:to_s)

      paths.length.should == 2
      paths.should include("C-D-C")
      paths.should include("C-E-B-C")
    end

    it 'should return the number of paths between 2 places with an exact number of stops' do
      # TW: Question 7
      paths = subject.paths_between(a, c, :exact_stops => 4).map(&:to_s)

      paths.length.should == 3
      paths.should include("A-B-C-D-C")
      paths.should include("A-D-C-D-C")
      paths.should include("A-D-E-B-C")
    end

    it 'should return the number of paths between 2 places with a maximum amount of distance' do
      # TW: Question 10
      paths = subject.paths_between(c, c, :maximum_distance => 30).map(&:to_s)

      paths.length.should == 7
      paths.should include("C-D-C")
      paths.should include("C-E-B-C")
      paths.should include("C-E-B-C-D-C")
      paths.should include("C-D-C-E-B-C")
      paths.should include("C-D-E-B-C")
      paths.should include("C-E-B-C-E-B-C")
      paths.should include("C-E-B-C-E-B-C-E-B-C")
    end

    it 'should raise an NoRuleError error if no rule is defined' do
      expect do
        subject.paths_between(a, e)
      end.should raise_error(Conductor::NoRuleError)
    end

  end

end
