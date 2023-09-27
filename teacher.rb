require 'json'
require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization,
      'has_rented' => @has_rented
    }
  end
end
