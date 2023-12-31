require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :id, :has_rented
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @has_rented = false
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    true if @age.to_i >= 18
  end
end
