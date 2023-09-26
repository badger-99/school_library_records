require './app'

class ConsoleManager
  def initialize
    @persons_manager = PersonsManager.new
    @books_manager = BooksManager.new
    @rentals_manager = RentalsManager.new
  end

  # Option 1 - List all books
  def list_books(include_indexes: false)
    books = @books_manager.books_list
    if books.length.positive?
      print_books(include_indexes)
    else
      puts "\nThere are no registered books."
    end
  end

  def print_books(include_indexes)
    books = @books_manager.books_list
    books.each_with_index do |book, index|
      puts "#{include_indexes ? "#{index + 1}) " : ''}Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Option 2 - List all persons
  def list_persons(include_indexes: false)
    persons = @persons_manager.persons_list
    if persons.length.positive?
      print_persons(include_indexes)
    else
      puts "\nThere are no registered people.\n"
    end
  end

  def print_persons(include_indexes)
    persons = @persons_manager.persons_list
    persons.each_with_index do |person, index|
      puts "#{include_indexes ? "#{index + 1}) " : ''}" \
           "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Option 3 - Register a person
  def add_person
    # Prompt
    print 'Do you want to create a Student(1) or a Teacher(2)? [Input the number]: '
    choice = gets.chomp

    # Input validation
    until %w[1 2].include?(choice)
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
    @persons_manager.create_student(age, name, parent_permission == 'Y')

    # Feedback
    puts 'Student has been registered successfully.\n\n'
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
    @persons_manager.create_teacher(age, name, specialization)

    # Feedback
    puts 'Teacher has been registered successfully.\n\n'
  end

  # Option 4 - Register a book
  def add_book
    # Prompt
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    # Action
    @books_manager.create_book(title, author)

    # Feedback
    puts "\nBook has been registered successfully.\n\n"
  end

  # Option 5 - Record a rental
  def add_rental
    # get date
    date_pattern = %r{\A\d{4}/\d{2}/\d{2}\z}
    print 'Date [YYYY/MM/DD]: '
    date = gets.chomp

    # Input validation
    until date.match?(date_pattern)
      puts "\nEnter a valid date in the shown format."
      date = gets.chomp
    end

    # Prompt
    puts "\nSelect a book from the following list by number, or press ENTER if the list is empty.\n\n"
    list_books(include_indexes: true)
    book_selection = gets.chomp.to_i - 1

    # Prompt 2
    puts "\nSelect a person from this list by number (Not the ID), or press ENTER if the list is empty.\n\n"
    list_persons(include_indexes: true)
    person_selection = gets.chomp.to_i - 1

    # Action
    person = @persons_manager.persons_list[person_selection]
    book = @books_manager.books_list[book_selection]
    @rentals_manager.create_rental(date, person, book)

    # Feedback
    puts "\nRental has been recorded."
  end

  # Option 6 - List all rentals for a given person ID
  def list_rental_for_id
    # Prompt
    print 'ID of person: '
    person_id = gets.chomp.to_i

    # Action
    rentals = @rentals_manager.rentals_list.select { |rental| rental.person_id == person_id }

    # Feedback
    if rentals.length.positive?
      print_rentals(rentals)
    else
      puts "\nThere are no rentals under the ID number you provided.\n\n"
    end
  end

  def print_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
    end
  end

  # Option 7 - Save data to file and exit
  def exit
    puts 'Saving data to file...'
    @persons_manager.save_to_file()
    @books_manager.save_to_file()
    @rentals_manager.save_to_file()
    puts 'Data has been saved!'
    puts 'Thank you for using this app!'
  end
end
