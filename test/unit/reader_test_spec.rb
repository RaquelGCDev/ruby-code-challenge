require 'rspec'
require_relative '../../lib/infrastructure/reader'
require_relative '../../lib/model/segment'
require_relative '../../lib/model/trip'
require 'stringio'


describe 'ReaderTest' do
  let(:base) { 'MAD' }
  let(:segment1) do
    Segment.new(type: 'Flight', origin: 'MAD', start_date: '2024-01-01', start_time: '10:00', destination: 'BCN',
                end_date: '2024-01-01', end_time: '11:00')
  end
  let(:segment2) do
    Segment.new(type: 'Flight', origin: 'BCN', start_date: '2024-01-02', start_time: '15:00', destination: 'MAD',
                end_date: '2024-01-02', end_time: '16:00')
  end
  let(:segment3) do
    Segment.new(type: 'Hotel', origin: 'BCN', start_date: '2024-01-01', start_time: '15:00', destination: 'BCN',
                end_date: '2024-01-02', end_time: nil)
  end

  before do
    ENV['BASED'] = base
  end

  context 'when segments are received' do
    it 'are ordered by date and time' do
      ordered_segments = Reader.new.order_segments_by_date([segment1, segment3, segment2])
      expect(ordered_segments).to eq([segment1, segment3, segment2])
    end
  end
end
