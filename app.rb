require './book'
require './student'
require './teacher'
require './rental'
require './classroom'

class App
  attr_reader :bookList, :studentList, :teacherList, :rentalList
  def initialize
    @bookList = []
    @studentList = []
    @teacherList = []
    @rentalList = []
    @classroom = Classroom.new('S-class')
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, @classroom, parent_permission: permission)
    @studentList.push(student)
  end

  def retrieve_students
    @studentList
  end
end 
