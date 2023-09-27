require 'json'
require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom = 'S-Class', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    assign_classroom(classroom)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hockey
    '¯\(ツ)/¯'
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'classroom' => @classroom.label,
      'parent_permission' => @parent_permission,
      'rental_ids' => rental_ids
    }
  end
end
