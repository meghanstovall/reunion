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

    output = ""
    until summary.empty?
      if summary.length == 2
        output += "#{summary.shift}: #{summary.shift}"
      else
        output += "#{summary.shift}: #{summary.shift}\n"
      end
    end
    output
  end
end
