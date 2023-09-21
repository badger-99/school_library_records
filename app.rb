require './book'
require './student'
require './teacher'
require './rental'
require './classroom'

class App
  attr_reader :bookList, :studentList, :teacherList, :rentalList
  def initialize
    @bookList = []
    @studentList = []
    @teacherList = []
    @rentalList = []
    @classroom = Classroom.new('S-class')
  end

end 
