require './app'
require './menu'

module Main
  include MainMenu
  app = App.new
  selection = 0
  puts 'Welcome to the School Library App'

  while selection != 7
    case selection
    when 0
      puts MainMenu.display_menu
      puts "\n"
      selection = gets.chomp.to_i
      next

    when 1 # List all books
      books = app.retrieve_books
      books.each do |volume|
        puts "Title: #{volume.title}, Author: #{volume.author}"
      end
      selection = 0
      puts "\n"
      next

    when 2 # List all people
      people = app.retrieve_people
      people.each do |item|
        puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
      end
      selection = 0
      puts "\n"
      next

    when 3 # Create a person
      print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
      choice = gets.chomp.to_i

      if choice == 1
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        print 'Has the parent(s) given permission? [Y/N]: '
        permission = gets.chomp.downcase
        allowed = nil

        if permission == 'y'
          allowed = true
        elsif permission == 'n'
          allowed = false
        end

        if allowed.nil?
          puts 'Select a valid choice for parental permission'
          selection = 3
        elsif !age.is_a?(Integer) || age < 1
          puts 'Enter positive numbers only for the age.'
          selection = 3
        else
          app.create_student(age, name, allowed)
          puts 'Student has been created successfully'
          selection = 0
        end

      elsif choice == 2
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        print 'Specialization: '
        specialization = gets.chomp
        if !age.is_a?(Integer) || age < 1
          puts 'Enter positive numbers only for the age.'
          selection = 3
        else
          app.create_teacher(age, name, specialization)
          puts 'Teacher has been created successfully'
          selection = 0
        end

      else
        puts 'Select a valid Person option.'
        selection = 3
      end

      puts "\n"
      next

    when 4 # Create a book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.create_book(title, author)
      selection = 0
      puts 'Book has been created successfully'
      puts "\n"
      next

    when 5 # Record a rental
      date = '2023/09/21'
      app.create_rental(date, ichigo, a_book)
      app.create_rental(date, tanjiro, a_sequel)
      app.create_rental(date, kenobi, a_book)
      app.create_rental(date, sheev, a_sequel)
      selection = 0
      puts 'Rental has been recorded successfully'
      puts "\n"
      next

    when 6 # List all rentals by ID
      rentals = app.retrieve_rentals
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author} ID: #{rental.id}"
      end
      puts "\n"
      selection = 0
      next

    when 7
      selection = 7
      next
    else
      # handle wrong selection here
    end
  end
  puts 'Thank you for using the School Library App'
end
