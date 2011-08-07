class Conductor

  class NoPathError < StandardError; end

  attr_reader :places, :routes

  def initialize
    @places = []
    @routes = []
  end

  def distance_between(*places)
    distance = 0

    last_place = nil
    places.each do |place|
      distance += find_route_between(last_place, place).distance if last_place

      last_place = place
    end

    distance
  end

  private

    def find_route_between(origin, destination)
      route_map["#{origin.name}#{destination.name}"] or raise NoPathError
    end

    # Construct a hash of the origin and destinations by name, example:
    #   { "AB" => #<Route>, "BA" => #<Route> }
    def route_map
      @route_map ||= @routes.inject({}) do |result, element|
        result["#{element.origin.name}#{element.destination.name}"] = element
        result
      end
    end

end
