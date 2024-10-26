require 'rspec'
require_relative '../../lib/model/trip'
require_relative '../../lib/model/segment'

describe 'TripTest' do
  context 'when a trip is created with all its data' do
    it 'prints the trip as expected' do
      trip = Trip.new('BCN', 'SVQ')

      trip.add_segment(Segment.new(
        type: "Flight",
        origin: "SVQ",
        start_date: "2023-01-05",
        start_time: "20:40",
        destination: "BCN",
        end_date: "2023-01-05",
        end_time: "22:10"
      ))

      trip.add_segment(Segment.new(
        type: "Hotel",
        origin: "BCN",
        start_date: "2023-01-05",
        start_time: nil,
        destination: nil,
        end_date: "2023-01-10",
        end_time: nil
      ))

      trip.add_segment(Segment.new(
        type: "Flight",
        origin: "BCN",
        start_date: "2023-01-10",
        start_time: "15:00",
        destination: "NYC",
        end_date: "2023-01-10",
        end_time: "22:45"
      ))

      expected_output = <<~OUTPUT.chomp
        TRIP to BCN
        Flight from SVQ to BCN at 2023-01-05 20:40 to 22:10
        Hotel at BCN on 2023-01-05 to 2023-01-10
        Flight from BCN to NYC at 2023-01-10 15:00 to 22:45
      OUTPUT

      expect(trip.to_s).to eq(expected_output)
    end
  end
end
