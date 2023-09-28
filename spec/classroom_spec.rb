require_relative 'spec_helper'

describe Classroom do
  describe '#new' do
    it 'takes one string parameter and returns a Classroom object' do
      classroom = Classroom.new('Test Class')
      expect(classroom).to be_an_instance_of Classroom
    end
  end

  describe '#add_student' do
    it 'should push a new student to the classroom student array' do
      classroom = Classroom.new('Test Class')
      student = Student.new(18, 'Rspec')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'should not add the same student multiple times' do
      classroom = Classroom.new('Test Class')
      student = Student.new(18, 'Rspec')
      classroom.add_student(student)
      classroom.add_student(student)
      expect(classroom.students.count).to eql(1)
    end
  end
end
