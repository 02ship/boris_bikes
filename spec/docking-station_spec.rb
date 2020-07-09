require 'docking-station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "releases working bikes" do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    bike = station.release_bike
    expect(bike).to be_working
  end
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bike) }
  it 'Dock something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
  describe '#release_bike' do
    it 'raises an error' do
      expect {(DockingStation.new).release_bike}.to raise_error "No available bikes"
    end
  end
end
