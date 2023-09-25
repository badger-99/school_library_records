require './app'
require './menu'


def print_rentals(arr)
  if arr.length.positive?
    arr.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
    end
  else
    puts "\nThere are no rentals under the ID number you provided.\n\n"
  end
end

module Main
  include MainMenu
  app = App.new
  selection = 0
  puts 'Welcome to the School Library App'

  while selection != 7
    case selection
    when 0
      puts "#{MainMenu.display_menu}\n"
      selection = gets.chomp.to_i

    when 1..2
      app.print_books(app.retrieve_books) if selection == 1
      app.print_people(app.retrieve_people) if selection == 2
      selection = 0
      puts "\n"

    when 3 # Create a person
      print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
      choice = gets.chomp.to_i
      age = name = permission = specialization = ''
      allowed = student = teacher = nil

      student = true if choice == 1
      teacher = true if choice == 2
      unless student || teacher
        puts "\nSelect a valid Person option.\n\n"
        selection = 3
        next
      end

      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp

      if student
        print 'Has the parent(s) given permission? [Y/N]: '
        permission = gets.chomp.downcase
      elsif teacher
        print 'Specialization: '
        specialization = gets.chomp
      end

      # input validation
      allowed = true if permission == 'y'
      allowed = false if permission == 'n'

      if student && !allowed.nil? && age.positive?
        app.create_student(age, name, allowed)
        puts "\nStudent has been registered successfully."
        selection = 0
      elsif student && allowed.nil?
        puts "\nSelect a valid choice for parental permission."
        selection = 3
      elsif teacher && age.positive?
        app.create_teacher(age, name, specialization)
        puts "\nTeacher has been registered successfully."
        selection = 0
      elsif (student || teacher) && age < 1
        puts "\nEnter positive numbers only for the age."
        selection = 3
      end
      puts "\n"

    when 4 # Create a book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.create_book(title, author)
      selection = 0
      puts "\nBook has been registered successfully.\n\n"

    when 5 # Record a rental
      # get date
      date_pattern = %r{\A\d{4}/\d{2}/\d{2}\z}
      print 'Date [YYYY/MM/DD]: '
      date = gets.chomp

      if date.match?(date_pattern)
        # select person
        puts "\nSelect a book from the following list by number, or press ENTER if the list is empty.\n\n"
        books_list = app.retrieve_books
        app.print_books_with_index(books_list)
        book_selection = gets.chomp.to_i - 1

        # select book
        puts "\nSelect a person from this list by number (Not the ID), or press ENTER if the list is empty.\n\n"
        people_list = app.retrieve_people
        app.print_people_with_index(people_list)
        person_selection = gets.chomp.to_i - 1

        # create the rental record
        app.create_rental(date, people_list[person_selection], books_list[book_selection])
        selection = 0
        puts "\nRental has been recorded."
      else
        puts "\nEnter a valid date in the shown format."
        selection = 5
      end
      puts "\n"

    when 6 # List all rentals by ID
      print 'ID of person: '
      id = gets.chomp.to_i
      rentals = app.retrieve_rentals
      rental_records = rentals.select { |rental| rental.id == id }
      app.print_rentals(rental_records)
      selection = 0
      puts "\n"

    when 7
      selection = 7
    else
      selection = 0
    end
    next
  end
  puts 'Thank you for using the School Library App'
end


class ConsoleManager

  def initialize
    @app = App.new()
  end

  def list_books(include_indexes: false)
    if app.books_list.length.positive?
      app.books_list.each_with_index do |book, index|
        puts "#{include_indexes && "#{index + 1})" } Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts "\nThere are no registered books."
    end
  end

  def list_persons(include_indexes: false)
    if app.persons_list.length.positive?
      app.persons_list.each_with_index do |person|
        puts "#{include_indexes && "#{index + 1})" } [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    else
      puts "\nThere are no registered people.\n"
    end
  end

  def add_person

  end

  def add_book

  end

  def add_rental

  end

  def list_rental_for_id

  end
end