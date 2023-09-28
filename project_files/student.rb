require 'json'
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom = nil, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
    assign_classroom(classroom)
  end

  def assign_classroom(classroom)
    return unless classroom.is_a?(Classroom)

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
      'has_rented' => @has_rented
    }
  end
end
