require_relative 'spec_helper'

describe Person do
  describe '#new' do
    it 'takes a number, a string, and a boolean and creates a Person object' do
      person = Person.new(18, 'Human', parent_permission: true)
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#can_use_services?' do
    context 'Testing the different conditions for this method' do
      it 'returns true when age is equal to or greater than 18 or parent_permission is true' do
        person = Person.new(18, 'Human', parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end

      it 'returns true when age is equal to or greater than 18 or parent_permission is false' do
        person = Person.new(25, 'Human', parent_permission: false)
        expect(person.can_use_services?).to be(true)
      end

      it 'returns true when age is less than 18 or parent_permission is true' do
        person = Person.new(15, 'Human', parent_permission: true)
        expect(person.can_use_services?).to be(true)
      end

      it 'returns false when age is less than 18 and parent_permission is false' do
        person = Person.new(15, 'Human', parent_permission: false)
        expect(person.can_use_services?).to be(false)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      person = Person.new(15, 'Human')

      expect(person.correct_name).to eq('Human')
    end
  end

  describe '#add_rental' do
    context 'Creating a Rental object automatically calls "add_rental"' do

      it 'adds a Rental object only once to the rentals array' do
        book = Book.new('Title', 'Author')
        person = Person.new(50, 'Cent')
        rental = Rental.new('2023/09/28', person, book)
        person.add_rental(rental)

        expect(person.rentals).to include(rental)
        expect(person.rentals.count).to be(1)
      end
    end
  end
end
