require './app'

app = App.new

app.create_student(18, 'Ichigo', true)
app.create_student(16, 'Tanjiro', false)
list = app.retrieve_students
puts list[1].name

app.create_teacher(66, 'Sheev', 'Sith')
puts app.retrieve_teachers[0].name

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
