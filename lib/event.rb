class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendees.map do |person|
      person.name
    end
  end

  def craft_with_most_supplies
    all_interests = Hash.new(0)
    attendees.each do |person|
      person.interests.each do |interest|
        all_interests[interest] += 1
      end
    end
    all_interests.max[0]
  end

  def supply_list
    all_supplies = []
    crafts.each do |craft|
      craft.supplies_required.each do |craft|
        all_supplies << craft[0].to_s
      end
    end
    all_supplies.uniq
  end

  def attendees_by_craft_interest
    total_crafts =crafts.map do |craft|
      craft.name
    end
    make_it = Hash.new([])
    attendees.each do |person|
      available = total_crafts & person.interests
      available.each do |craft|
        make_it[craft] = person
      end
    end
    make_it
  end

  def crafts_that_use

  end
end
