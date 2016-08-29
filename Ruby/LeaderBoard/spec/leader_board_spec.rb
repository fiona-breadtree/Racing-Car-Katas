require_relative '../leader_board'

describe 'Self Driving Car' do
  context 'when initializing a self driving car' do
    let(:car) {  SelfDrivingCar.new("1.2", "ACME") }

    it 'has version information in its name' do
      expect(car.name).to eq 'Self Driving Car - ACME (1.2)'
    end

    it 'has the same infromation in company and country' do
      expect(car.country).to eq 'ACME'
    end

    it 'changes the name when setting to different version' do
      car.algorithm_version = '1.3'
      expect(car.name).to eq 'Self Driving Car - ACME (1.3)'
    end
  end
end

describe 'Race' do
  let(:driver_1) { double('Driver', name: 'driver_1')}
  let(:driver_2) { double('Driver', name: 'driver_2')}
  let(:driver_3) { double('SelfDrivingCarr', name: 'self_driver')}

  let(:race) { Race.new("Australian Grand Prix", [driver_1, driver_2, driver_3]) }

  it 'returns correct ranking results' do
    expect(race.results[driver_1.name]).to eq 25
    expect(race.results[driver_2.name]).to eq 18
    expect(race.results[driver_3.name]).to eq 15
  end
end

describe 'LeaderBoard' do
  let(:driver_1_name) { 'driver_1' }
  let(:driver_2_name) { 'driver_2' }
  let(:driver_3_name) { 'self_driver_1.1' }
  let(:driver_4_name) { 'driver_4' }
  let(:driver_5_name) { 'self_driver_1.2' }

  let(:results_1) { { driver_1_name => 25, driver_5_name => 18, driver_4_name => 15 } }
  let(:results_2) { { driver_5_name => 25, driver_2_name => 18, driver_3_name => 15 } }
  let(:results_3) { { driver_4_name => 25, driver_3_name => 18, driver_2_name => 15 } }

  let(:leader_board) { LeaderBoard.new([results_1, results_2, results_3]) }

  context "#winner" do
    it "returns the driver with the most points" do
      expect(leader_board.driver_rankings.first).to eq("self_driver_1.2")
    end
  end

  context "#driver_points" do
    it "returns the correct number of points for a driver" do
      expect(leader_board.driver_points["self_driver_1.2"]).to eq(18 + 25)
    end
  end
end
