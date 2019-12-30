class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    values = @participants.values
    values.sum
  end

  def split
    total = total_cost
    total / @participants.length
  end

  def owed
    owed = {}
    @participants.each do |participant|
      name = participant.first
      paid = participant.last
      owe = split - paid
      owed[name] = owe
    end
    owed
  end
end
