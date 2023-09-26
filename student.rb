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
      'name' => @name,
      'age' => @age,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission,
      'rentals' => @rental_IDs
    }
  end
end
