require 'rubygems'
require 'bundler/setup'
require 'trains'

# Factory data as supplied by ThoughtWorks
#
# Test Input:
# For the test input, the towns are named using the first few letters of the alphabet from A to D.
# A route between two towns (A to B) with a distance of 5 is represented as AB5.
#
# Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

TestConductor = Conductor.new

TestConductor.places << (a = Place.new(:name => "A"))
TestConductor.places << (b = Place.new(:name => "B"))
TestConductor.places << (c = Place.new(:name => "C"))
TestConductor.places << (d = Place.new(:name => "D"))
TestConductor.places << (e = Place.new(:name => "E"))

TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
TestConductor.routes << Route.new(:origin => a, :destination => b, :distance => 5)
