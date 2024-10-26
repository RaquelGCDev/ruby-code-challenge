require 'rspec'
require_relative '../../lib/model/segment'

describe 'SegmentTest' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when a segment is created' do
    it 'prints the segment as expected for a Flight' do
      segment = Segment.new(
        type: "Flight",
        origin: "SVQ",
        start_date: "2023-01-05",
        start_time: "20:40",
        destination: "BCN",
        end_date: "2023-01-05",
        end_time: "22:10"
      )
      expect(segment.to_s).to eq("Flight from SVQ to BCN at 2023-01-05 20:40 to 22:10")
    end
    it 'prints the segment as expected for a Train' do
      segment = Segment.new(
        type: "Train",
        origin: "SVQ",
        start_date: "2023-02-15",
        start_time: "09:30",
        destination: "MAD",
        end_date: "2023-02-15",
        end_time: "11:00"
      )
      expect(segment.to_s).to eq("Train from SVQ to MAD at 2023-02-15 09:30 to 11:00")
    end
    it 'prints the segment as expected for a Hotel' do
      segment = Segment.new(
        type: "Hotel",
        origin: "MAD",
        start_date: "2023-02-15",
        start_time: nil,
        destination: nil,
        end_date: "2023-02-17",
        end_time: nil
      )
      expect(segment.to_s).to eq("Hotel at MAD on 2023-02-15 to 2023-02-17")
    end
  end
end
