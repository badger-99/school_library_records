require_relative 'spec_helper'

describe Teacher do
  before :all do
    @teacher = Teacher.new(28, 'Kakashi', 'Ninjutsu')
  end

  describe '#new' do
    it 'takes a number and two strings and creates a teacher object' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with all of the Teacher objects attributes' do
      teacher_hash = {
        'id' => @teacher.id,
        'name' => @teacher.name,
        'age' => @teacher.age,
        'specialization' => @teacher.specialization,
        'has_rented' => @teacher.has_rented
      }

      expect(@teacher.to_hash).to eql(teacher_hash)
    end
  end
end
