require './book'
require './student'
require './teacher'
require './rental'
require './classroom'

class PersonsManager
  def initialize
    @students_list = []
    @teachers_list = []
    @classroom = Classroom.new('S-class')
  end

  attr_reader :students_list, :teachers_list

  def persons_list
    @students_list + @teachers_list
  end

  def create_student(age, name, permission)
    student = Student.new(age, name, @classroom, parent_permission: permission)
    @students_list.push(student)
    student
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @teachers_list.push(teacher)
    teacher
  end

  def save_to_file
    students_data = students_list.map { |student| student.to_json }
    File.open('students.json', 'w') do |file|
      file.puts JSON.generate(students_data)
    end

    teachers_data = teachers_list.map { |teacher| teacher.to_json }
    File.open('teachers.json', 'w') do |file|
      file.puts JSON.generate(teachers_data)
    end
  end
end

class BooksManager
  def initialize
    @books_list = []
  end

  attr_reader :books_list

  def create_book(title, author)
    book = Book.new(title, author)
    @books_list.push(book)
    book
  end

  def save_to_file
    books_data = books_list.map { |book| book.to_json }
    File.open('books.json', 'w') do |file|
      file.puts JSON.generate(books_data)
    end
  end
end

class RentalsManager
  def initialize
    @rentals_list = []
  end

  attr_reader :rentals_list

  def create_rental(date, person, book)
    return unless person.is_a?(Person) && book.instance_of?(Book)

    rental = Rental.new(date, person, book)
    @rentals_list.push(rental)
    rental
  end

  def save_to_file
    rentals_data = rentals_list.map { |rental| rental.to_json }
    File.open('rentals.json', 'w') do |file|
      file.puts JSON.generate(rentals_data)
    end
  end
end
