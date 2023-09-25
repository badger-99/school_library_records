require './app'

class ConsoleManager
  def initialize
    @persons_manager = PersonsManager.new()
    @books_manager = BooksManager.new()
    @rentals_manager = RentalsManager.new()
  end

  # Option 1 - List all books
  def list_books(include_indexes: false)
    books = @books_manager.books_list
    if !books.length.positive?
      puts "\nThere are no registered books."
    else
      print_books(books, include_indexes)
    end
  end

  def print_books(include_indexes)
    books = @books_manager.books_list
    books.each_with_index do |book, index|
      puts "#{include_indexes && "#{index + 1})" } Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Option 2 - List all persons
  def list_persons(include_indexes: false)
    persons = @persons_manager.persons_list
    if !persons.length.positive?
      puts "\nThere are no registered people.\n"
    else
      print_persons(include_indexes)
    end
  end

  def print_persons(include_indexes)
    persons = @persons_manager.persons_list
    persons.each_with_index do |person|
        puts "#{include_indexes && "#{index + 1})" } [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Option 3 - Register a person
  def add_person
    # Prompt
    print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
    choice = gets.chomp

    # Input validation
    until choice == '1' || choice == '2'
      puts 'Please enter either 1 or 2:'
      choice = gets.chomp
    end

    # Action
    if choice == '1'
      add_student
    elsif choice == '2'
      add_teacher
    end
  end

  def add_student
    # Prompt
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase

    # Action
    persons_manager.create_student(age, name, permission == 'Y')

    # Feedback
    puts 'Student created!'
  end

  def add_teacher
    # Prompt
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    # Action
    persons_manager.create_teacher(age, name, specialization)

    # Feedback
    puts 'Teacher created!'
  end

  # Option 4 - Register a book
  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books_manager.create_book(title, author)
    puts "\nBook has been registered successfully.\n\n"
  end

  # Option 5 - Record a rental
  def add_rental
    # get date
      date_pattern = %r{\A\d{4}/\d{2}/\d{2}\z}
      print 'Date [YYYY/MM/DD]: '
      date = gets.chomp

      if date.match?(date_pattern)
        # select person
        puts "\nSelect a book from the following list by number, or press ENTER if the list is empty.\n\n"
        list_books(include_indexes: true)
        book_selection = gets.chomp.to_i - 1

        # select book
        puts "\nSelect a person from this list by number (Not the ID), or press ENTER if the list is empty.\n\n"
        list_persons(include_indexes: true)
        person_selection = gets.chomp.to_i - 1

        # create the rental record
        # I used variables for readability because the names are too long
        person = persons_manager.persons_list[person_selection]
        book = books_manager.books_list[book_selection]
        app.create_rental(date, person, book)
        puts "\nRental has been recorded."
      else
        puts "\nEnter a valid date in the shown format."
      end
      puts "\n"
  end

  # Option 6 - List all rentals for a given person ID
  def list_rental_for_id(id)
    rentals = rentals_manager.rentals_list.select { |rental| rental.person_id == id }
    if !rentals.length.positive?
      puts "\nThere are no rentals under the ID number you provided.\n\n"
    else
      list_rentals(rentals)
    end
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
    end
  end

end
