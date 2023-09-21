require './book'
require './student'
require './teacher'
require './rental'
require './classroom'

class App
  attr_reader :book_list, :student_list, :teacher_list, :rental_list

  def initialize
    @book_list = []
    @student_list = []
    @teacher_list = []
    @rental_list = []
    @classroom = Classroom.new('S-class')
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, @classroom, parent_permission: permission)
    @student_list.push(student)
  end

  def retrieve_students
    @student_list
  end
end
