require './app'

app = App.new

ichigo = app.create_student(18, 'Ichigo', true)
app.create_student(16, 'Tanjiro', false)

app.create_teacher(42, 'Obi-Wan', 'Jedi')
app.create_teacher(66, 'Sheev', 'Sith')

# algorithm to list al the people (students + teachers)
people = app.retrieve_people
people.each do |item|
  puts "[#{item.class}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
end

book = app.create_book('A book', 'John Doe')
app.create_book('A sequel', 'Jane Doe')

books = app.retrieve_books
books.each do |volume|
  puts "Title: #{volume.title}, Author: #{volume.author}"
end

date = '2023/09/21'
app.create_rental(date, ichigo, book)

puts book.title
puts ichigo.id

rentals = app.retrieve_rentals
rentals.each do |rental|
  puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author} ID: #{rental.id}"
end

def main
  app = App.new()
  selection = 0
  while selection != 7
    case(selection)
    when 0
      puts menu
    when 1
      # List all books
    when 2
      # list all the people
    when 3
      # create a person
    when 4
      # create a book
    when 5
      # create a rental
    when 6
      # list all rentals for a given ID
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
