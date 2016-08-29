class LeaderBoard
  attr_reader :driver_points
  def initialize(race_results)
    @driver_points = build_drivers_points(race_results)
  end

  def driver_rankings
    rankings = driver_points.sort_by{|name, points| points}.reverse
    return rankings.collect{|name, points| name}
  end

  private

  def build_drivers_points(race_results)
    driver_points = {}
    race_results.each do |race_result|
      driver_points.merge!(race_result) { |driver_name, old_val, new_val| old_val + new_val }
    end
    return driver_points
  end
end

class Driver
  attr_reader :name, :country
  def initialize(name, country)
    @name = name
    @country = country
    post_initialize
  end

  def post_initialize
  end
end

class SelfDrivingCar < Driver
  attr_accessor :algorithm_version
  def post_initialize
    @algorithm_version = @name
    @company = country
  end

  def name
    "Self Driving Car - " + country + " (" + algorithm_version + ")"
  end
end


class Race
  attr_reader :results

  def initialize(name, drivers)
    @name = name
    @results = {}
    @points = [25, 18, 15]
    drivers.each_with_index do |driver, index|
      @results[driver.name] = @points[index]
    end
  end
end
