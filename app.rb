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
    student
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @teacher_list.push(teacher)
    teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @book_list.push(book)
    book
  end

  def create_rental(date, person, book)
    rental = Rental.new(date, person, book)
    @rental_list.push(rental)
    rental
  end

  def retrieve_people
    @student_list + @teacher_list
  end

  def retrieve_books
    @book_list
  end

  def retrieve_rentals
    @rental_list
  end
end
