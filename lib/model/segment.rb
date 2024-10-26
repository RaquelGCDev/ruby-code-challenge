class Segment
  attr_reader :type, :origin, :start_date, :start_time, :destination, :end_date, :end_time

  def initialize(type:, origin:, start_date:, start_time:, destination:, end_date:, end_time:)
    @type = type
    @origin = origin
    @start_date = start_date
    @start_time = start_time
    @destination = destination
    @end_date = end_date
    @end_time = end_time
  end

  def to_s
    case type
    when "Flight", "Train"
      "#{type} from #{origin} to #{destination} at #{start_date} #{start_time} to #{end_time}"
    when "Hotel"
      "Hotel at #{origin} on #{start_date} to #{end_date}"
    else
      "Unknown segment type"
    end
  end
end
