class LeaderBoard
  def initialize(races)
    @races = races
  end

  def driver_points
    driver_points = {}
    @races.each do |race|
      race.results.each do |driver_name, points|
        driver_points[driver_name] = driver_points.fetch(driver_name, 0) + points
      end
    end

    return driver_points
  end

  def driver_rankings
    rankings = driver_points.sort_by{|name, points| points}.reverse
    return rankings.collect{|name, points| name}
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
  @@points = [25, 18, 15]
  attr_reader :results

  def initialize(name, drivers)
    @name = name
    @results = {}
    drivers.each_with_index do |driver, index|
      @results[driver.name] = @@points[index]
    end
  end
end
