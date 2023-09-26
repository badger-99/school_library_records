require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @rentals_ids = []
  end

  def can_use_services?
    true if of_age || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def find_rental_id
    @rentals.each do |rental|
      @rentals_IDs.push(rental.id)
    end
  end

  private

  def of_age?
    true if @age >= 18
  end
end
