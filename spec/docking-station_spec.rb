require 'docking-station'
DEFAULT_CAPACITY = 20
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
  it { is_expected.to respond_to(:bikes) }
  it 'Dock something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end
  describe '#release_bike' do
    it 'raises an error if there is no bike to release' do
      expect {(DockingStation.new).release_bike}.to raise_error "No available bikes"
    end
  end
  describe '#dock(bike)' do
    it 'raises an error if the docking station is full' do
      subject.capacity.times do
        subject.dock(Bike.new)
      end
      expect {subject.dock Bike.new }.to raise_error "docking station full"
    end
  end
  it 'has a capacity of DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end
  describe '#initialize' do
    it 'has a variable capacity' do
      station = DockingStation.new(50)
      50.times { station.dock(Bike.new) }
      expect{ station.dock Bike.new }.to raise_error "docking station full"
    end
    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(Bike.new)
      end
      expect { subject.dock(Bike.new) }.to raise_error "docking station full"
    end
  end
end
