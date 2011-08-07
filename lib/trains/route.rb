class Route

  attr_reader :origin, :destination, :distance

  def initialize(attrs = {})
    @origin = attrs[:origin]
    @destination = attrs[:destination]
    @distance = attrs[:distance]
  end

end
