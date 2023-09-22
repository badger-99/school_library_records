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
      ichigo = app.create_student(18, 'Ichigo', true)
      tanjiro = app.create_student(16, 'Tanjiro', false)
      kenobi = app.create_teacher(42, 'Obi-Wan', 'Jedi')
      sheev = app.create_teacher(66, 'Sheev', 'Sith')
      selection = 0
      puts 'Person has been created successfully'
      puts "\n"
      next

    when 4 # Create a book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      app.create_book(title, author)
      # a_book = app.create_book('A book', 'John Doe')
      # a_sequel = app.create_book('A sequel', 'Jane Doe')
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
    end
  end
  puts 'Thank you for using the School Library App'
end
