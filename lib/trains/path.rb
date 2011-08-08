class Path < Array

  def distance
    map(&:distance).inject(0) { |result, element| result + element }
  end

  def to_s(options = {})
    if length > 0
      places = [ *map(&:origin).map(&:name), last.destination.name ].join('-')
      places = places + " (Distance: #{distance}, Stops: #{length})" if options[:debug]
      places
    end
  end

end
