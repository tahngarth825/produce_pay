# frozen_string_literal: true

class Cell
  NEWBORN = 1
  ADULT = 2
  SENIOR = 3

  attr_reader :age

  def initialize(age)
    @age = age
  end

  def pass_time(neighbors)
    neighbors_ages = neighbors.map(&:age).compact

    @age =
      case age
      when nil
        age_nil(neighbors_ages)
      when NEWBORN
        age_newborn(neighbors_ages)
      when ADULT
        age_adult(neighbors_ages)
      when SENIOR
        nil # "natural causes"
      else
        raise "Invalid new age: #{age}"
      end
  end

  def clone
    self.class.new(@age)
  end

  private

  def age_nil(neighbors_ages)
    adults = neighbors_ages.select { |el| el == ADULT }
    NEWBORN if adults.count == 2 # reproduction
  end

  def age_newborn(neighbors_ages)
    if neighbors_ages.count >= 5
      nil # overcrowding
    elsif neighbors_ages.count <= 1
      nil # isolation
    else
      ADULT # growing up
    end
  end

  def age_adult(neighbors_ages)
    if neighbors_ages.count >= 3
      nil # overcrowding
    elsif neighbors_ages.count.zero?
      nil # isolation
    else
      SENIOR # aging
    end
  end
end
