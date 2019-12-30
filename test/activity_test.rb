require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_it_has_attributes
    activity = Activity.new("Brunch")
    expected = {}

    assert_equal "Brunch", activity.name
    assert_equal expected, activity.participants
  end

  def test_can_add_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal ({"Maria" => 20}), activity.participants
  end

  def test_can_find_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal 20, activity.total_cost

    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
  end

  def test_can_split_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 30, activity.split
  end

  def test_can_calculate_what_participants_owe
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end
end
