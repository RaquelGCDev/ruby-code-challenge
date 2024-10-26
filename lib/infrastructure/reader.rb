require_relative '../model/trip'
require_relative '../model/segment'

class Reader

  def read(file)
    based = ENV['BASED']
    segments = create_segment(file)
    ordered_segments = order_segments_by_date(segments)

  end

  def create_segment(file)
    segments = []
    file.each_line do |line|
      unless line =~ /
          SEGMENT:\s*
          (\w+)\s+              # Type (Flight, Train, Hotel...)
          (\w+)\s+              # Origin
          (\d{4}-\d{2}-\d{2})   # Start date
          (?:\s+(\d{2}:\d{2}))? # Start time
          \s*->\s*              # Consider given separator '->'
          (\w+)                 # Destination
          (?:\s+(\d{4}-\d{2}-\d{2}))? # End date optional because flights don't have it
          (?:\s+(\d{2}:\d{2}))? # End time optional because hotels may not have it
        /x
        next
      end

      type = $1
      origin = $2
      start_date = $3
      start_time = $4
      destination = type == 'Hotel' ? $2 : $5
      end_date = $6 || start_date
      end_time = $7

      segment = Segment.new(
        type: type,
        origin: origin,
        start_date: start_date,
        start_time: start_time,
        destination: destination,
        end_date: end_date,
        end_time: end_time
      )
      segments << segment
    end
    segments
  end

  def order_segments_by_date(segments)
    segments.sort_by do |segment|
      [segment.start_date, segment.start_time || '23:00']
    end
  end
end
