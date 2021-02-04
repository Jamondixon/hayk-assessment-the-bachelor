require 'pry'


def get_first_name_of_season_winner(data, season)
  # The method should return the *first name* of that season's winner. string manipulation
  data[season].find {|contestant| contestant["status"] == "Winner"}["name"].split.first
end
def get_contestant_name(data, occupation)
  # that takes in the data hash and an occupation string and returns name of woman with occupation
    matching_contestant = data.values.flatten.find do |contestant|
    contestant["occupation"] == occupation
  end
  matching_contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  # This method should return a counter of the number of contestants who are from that hometown.
  data.values.flatten.reduce(0) do |count, contestant| #can use .count instead of reduce
    if contestant["hometown"] == hometown
      count + 1
    else
      count
    end
  end
end

def get_occupation(data, hometown)
  # It returns the occupation of the first contestant who hails from that hometown.
   found_contestant = data.values.flatten.find do |contestant|
    contestant["hometown"] == hometown
  end
    found_contestant["occupation"]
end

def get_average_age_for_season(data, season)
  # return the average age of all of the contestants for that season
  total_ages = data[season].sum do |contestant|
    contestant["age"].to_f
  end
  total_contestants = data[season].length
  (total_ages/total_contestants).round
end
