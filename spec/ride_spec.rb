require_relative '../lib/ride'
require_relative '../lib/visitor'

RSpec.describe Ride do
  describe '#initialize' do
    it 'creates a ride with name, minimum height, admission fee, and excitement level' do
      ride = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride.name).to eq('Carousel')
      expect(ride.min_height).to eq(24)
      expect(ride.admission_fee).to eq(1)
      expect(ride.excitement).to eq(:gentle)
    end

    it 'creates a ride with an empty rider log' do
      ride = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride.rider_log).to eq({})
    end
  end

  describe '#board_rider' do
    it 'boards a rider and adds them to the rider log' do
      ride = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      ride.board_rider(visitor1)
      expect(ride.rider_log).to eq({ visitor1 => 1 })
    end

    it 'does not board a rider who is not eligible' do
      ride = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 20, '$10')
      ride.board_rider(visitor1)
      expect(ride.rider_log).to eq({})
    end