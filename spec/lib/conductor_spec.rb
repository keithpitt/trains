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

  let (:place_a) { Place.new(:name => "A") }
  let (:place_b) { Place.new(:name => "B") }
  let (:place_c) { Place.new(:name => "C") }
  let (:place_d) { Place.new(:name => "D") }
  let (:place_e) { Place.new(:name => "E") }

  before :all do
    subject.places << place_a
    subject.places << place_b
    subject.places << place_c
    subject.places << place_d
    subject.places << place_e

    subject.routes << Route.new(:origin => place_a, :destination => place_b, :distance => 5)
    subject.routes << Route.new(:origin => place_b, :destination => place_c, :distance => 4)
    subject.routes << Route.new(:origin => place_c, :destination => place_d, :distance => 8)
    subject.routes << Route.new(:origin => place_d, :destination => place_c, :distance => 8)
    subject.routes << Route.new(:origin => place_d, :destination => place_e, :distance => 6)
    subject.routes << Route.new(:origin => place_a, :destination => place_d, :distance => 5)
    subject.routes << Route.new(:origin => place_c, :destination => place_e, :distance => 2)
    subject.routes << Route.new(:origin => place_e, :destination => place_b, :distance => 3)
    subject.routes << Route.new(:origin => place_a, :destination => place_e, :distance => 7)
  end

  context 'properties' do

    it 'should have a places array' do
      subject.places.should be_kind_of(Array)
    end

    it 'should have a routes array' do
      subject.routes.should be_kind_of(Array)
    end

  end

end
