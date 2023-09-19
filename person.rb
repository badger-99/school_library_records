require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..80_000)
    @name = name
    @age = age
    @parent_permissioin = parent_permission
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

class Decorator < Nameable
  attr_accessor :nameable_object

  def initialize(nameable_object)
    @nameable_object = nameable_object
  end

  def correct_name
    @nameable_object.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable_object.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable_object.correct_name[0, 10]
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
