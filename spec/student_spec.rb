require_relative 'spec_helper'

describe Student do
  context 'there are  two optional parameters to create a Student object' do
    describe '#new' do
      it 'takes a number and a string and creates a Student' do
        gohan = Student.new(12, 'Gohan')
        expect(gohan).to be_an_instance_of(Student)
      end

      it 'takes a number, a string and a Classroom object and creates a Student' do
        scouts = Classroom.new('Scouts')
        eren = Student.new(19, 'Eren', scouts)
        expect(eren).to be_an_instance_of(Student)
      end

      it 'takes a number, a string, a Classroom object, and a boolean and creates a Student' do
        ds_corps = Classroom.new('Demon Slayer Corps')
        tanjiro = Student.new(16, 'Tanjiro', ds_corps, parent_permission: false)
        expect(tanjiro).to be_an_instance_of(Student)
      end
    end
  end

  describe '#assign_classroom' do
    it 'adds a Classroom object to the classroom attribute inside the student object' do
      victor = Student.new(13, 'Victor Stone')
      gcw = Classroom.new('Gotham City Wildcats')
      victor.assign_classroom(gcw)
      expect(victor.classroom).to eq(gcw)
    end
  end

  describe '#play_hockey' do
    it 'returns a smiley :)' do
      nhl = Classroom.new('NHL Hall Of Fame')
      wayne = Student.new(62, 'Wayne Gretzky', nhl)

      expect(wayne.play_hockey).to eql('¯\(ツ)/¯')
    end
  end
end
