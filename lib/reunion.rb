class Reunion

  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    costs = @activities.map {|activity| activity.total_cost}
    costs.sum
  end

  def breakout
    final_owed = {}
    @activities.each do |activity|
      owed = activity.owed
      owed.each do |participant|
        if final_owed.keys.include?(participant.first)
          final_owed[participant.first] += participant.last
        else
          final_owed[participant.first] = participant.last
        end
      end
    end
    final_owed
  end

  def summary
    final_owed = breakout
    summary = final_owed.map do |participant|
      participant
    end.flatten
    string = summary*", "
    p "#{string[0..4]}: #{string[7..9]} \n#{string[12..17]}: #{string[20..22]}\n#{string[25..29]}: #{string[32..33]}"
  end
end
