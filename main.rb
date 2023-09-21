require './app'

app = App.new

person = app.create_student(18, 'Ichigo', true)
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
books.each do |book|
  puts "Title: #{book.title}, Author: #{book.author}"
end

date = '2023/09/21'
app.create_rental(date, person, book)

puts book.title

rentals = app.retrieve_rentals
rentals.each do |rental|
  puts "Date: #{rental.date}, Book \"#{rental.title}\" by #{rental.author}"
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
