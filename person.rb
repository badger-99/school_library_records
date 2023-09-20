require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..80_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    true if of_age || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    true if @age >= 18
  end
end
