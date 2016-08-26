require "test/unit"

require_relative 'tire_pressure'

class TestAlarm < Test::Unit::TestCase

  def test_alarm_off_by_default
    assert(!Alarm.new().is_alarm_on)
  end

  def test_alarm_on_when_lower_than_low_boundary
    alarm = Alarm.new()
    alarm.check(15)
    assert(alarm.is_alarm_on)
  end

  def test_alarm_on_when_higher_than_high_boundary
    alarm = Alarm.new()
    alarm.check(22)
    assert(alarm.is_alarm_on)
  end

  def test_alarm_off_when_pressure_is_normal
    alarm = Alarm.new()
    alarm.check(20)
    assert(!alarm.is_alarm_on)
  end
end
