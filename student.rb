require './person'

class Student < Person
  attr_reader :classroom
  
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission:)
    assign_classroom(classroom)
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hockey
    '¯\(ツ)/¯'
  end
end
