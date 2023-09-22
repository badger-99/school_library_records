require './app'
require './menu.rp'

module Main
  include MainMenu
  app = App.new
  selection = 0

  puts 'Welcome to the School Library App'

  while selection != 7
    case selection
    when 0
      MainMenu.print_menu
    when 1
      books = app.retrieve_books
      books.each do |volume|
        puts "Title: #{volume.title}, Author: #{volume.author}"
      end
    when 2
      people = app.retrieve_people
      people.each do |item|
        puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
      end
    when 3
      ichigo = app.create_student(18, 'Ichigo', true)
      tanjiro = app.create_student(16, 'Tanjiro', false)
      kenobi = app.create_teacher(42, 'Obi-Wan', 'Jedi')
      sheev = app.create_teacher(66, 'Sheev', 'Sith')
    when 4
      a_book = app.create_book('A book', 'John Doe')
      a_sequel = app.create_book('A sequel', 'Jane Doe')
    when 5
      date = '2023/09/21'
      app.create_rental(date, ichigo, a_book)
      app.create_rental(date, tanjiro, a_sequel)
      app.create_rental(date, kenobi, a_book)
      app.create_rental(date, sheev, a_sequel)
    when 6
      rentals = app.retrieve_rentals
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author} ID: #{rental.id}"
      end
    when 7
      # exit loop
    end
  end
end

# require './person'
# require './student'
# require './teacher'
# require './classroom'
# require './capitalize'
# require './trimmer'

# s_class = Classroom.new('S-Class')
# ichigo = Student.new(s_class, '18', 'Ichigo')
# puts s_class.students.first.name
# puts ichigo.classroom.label

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
