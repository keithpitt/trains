class Conductor

  class NoPathError < StandardError; end
  class NoRuleError < StandardError; end

  attr_reader :places, :routes

  def initialize
    @places = []
    @routes = []
  end

  def distance_between(*places)
    distance = 0

    last_place = nil
    places.each do |place|
      distance += paths_between(last_place, place, :maximum_stops => 1).first.distance if last_place

      last_place = place
    end

    distance
  end

  def shorted_path_between(origin, destination)
    paths = paths_between(origin, destination, :maximum_stops => routes.length)

    paths.sort { |x,y| y.distance <=> x.distance }.last
  end

  def paths_between(origin, destination, rules = {})

    if rules.has_key?(:maximum_stops)

      find_by_traversing origin, destination do |path|
        if path.length <= rules[:maximum_stops]
          path.last.destination == destination ? :match : :continue
        else
          :stop
        end
      end

    elsif rules.has_key?(:exact_stops)

      find_by_traversing origin, destination do |path|
        if path.length == rules[:exact_stops]
          path.last.destination == destination ? :match : :stop
        elsif path.length < rules[:exact_stops]
          :continue
        else
          :stop
        end
      end

    elsif rules[:maximum_distance]

      find_by_traversing origin, destination do |path|
        if path.distance < rules[:maximum_distance]
          path.last.destination == destination ? :match : :continue
        else
          :stop
        end
      end

    else

      raise NoRuleError.new

    end

  end

  private

    # The block is called each with current path as it traverses through
    # the route graph. The block can return either :stop, :continue or :match
    def traverse_route_map(origin, destination, path, matches, &block)
      route_map[origin].each do |route|

        new_path = path ? path.dup : Path.new
        new_path << route

        action = yield(new_path)

        matches << new_path if action == :match

        if action == :continue || action == :match
          traverse_route_map(route.destination, destination, new_path, matches, &block)
        end

      end
    end

    def find_by_traversing(origin, destination, &block)
      traverse_route_map(origin, destination, nil, matches = [], &block)
      raise NoPathError if matches.empty?

      matches
    end

    # Construct a hash of the origins and their possible destinations
    # Example:
    #   { #<Place> => [ #<Route>, #<Route> ] }
    def route_map
      @route_map ||= @routes.inject({}) do |result, element|
        result[element.origin] ||= []
        result[element.origin] << element
        result
      end
    end

end
