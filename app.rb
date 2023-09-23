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
    book_list = []
    book_list.push(book)
    book
  end

  def create_rental(date, person, book)
    return unless person.is_a?(Person) && book.instance_of?(Book)

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

  def print_books(arr)
    if arr.length.positive?
      arr.each do |volume|
        puts "Title: #{volume.title}, Author: #{volume.author}"
      end
    else
      puts "\nThere are no registered books."
    end
  end

  def print_books_with_index(arr)
    if arr.length.positive?
      arr.each_with_index do |book, index|
        puts "#{index + 1} - #{book.title}"
      end
    else
      puts "\nThere are no registered books."
    end
  end

  def print_people(arr)
    if arr.length.positive?
      arr.each do |item|
        puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
      end
    else
      puts "\nThere are no registered people.\n"
    end
  end

  def print_people_with_index(arr)
    if arr.length.positive?
      arr.each_with_index do |person, index|
        puts "#{index + 1} - #{person.name}  #{person.class}"
      end
    else
      puts "\nThere are no registered people.\n"
    end
  end

  def print_rentals(arr)
    if arr.length.positive?
      arr.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
      end
    else
      puts "\nThere are no rentals under the ID number you provided.\n\n"
    end
  end
end
