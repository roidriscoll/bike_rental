require './lib/docking_station'

describe DockingStation do

  let(:bike)    { Bike.new                            }
  let(:station) { DockingStation.new(:capacity => 20) }

  it 'should accept a new bike' do
    expect(station.bike_count).to eq 0
    station.store(bike)
    expect(station.bike_count).to eq 1
  end

  it 'should release a bike' do
    station.store(bike)
    station.release(bike)
    expect(station.bike_count).to eq 0
  end

  it 'should know when it is full' do
    expect(station).not_to be_full
    20.times { station.store(Bike.new) }
    expect(station).to be_full
  end

end