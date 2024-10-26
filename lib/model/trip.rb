class Trip
  attr_accessor :destination
  attr_reader :based, :segments

  def initialize(destination, based)
    @destination = destination
    @based = based
    @segments = []
  end

  def add_segment(segment)
    @segments << segment
  end

  def to_s
    "TRIP to #{destination}\n" + segments.map(&:to_s).join("\n")
  end
end
