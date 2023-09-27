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
      'rental_ids' => rental_ids
    }
  end

  def teacher_to_json
    JSON.generate(to_hash)
  end
end
