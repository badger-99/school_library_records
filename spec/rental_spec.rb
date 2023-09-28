require_relative 'spec_helper'

describe Rental do
  describe '#new' do
    it 'takes date, book and person parameters and returns a Rental object' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental).to be_an_instance_of Rental
    end

    it 'calls person.add_rental and sets person.has_rented to true' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental.person.has_rented).to eql(true)
      expect(rental.person.rentals).to eql([rental])
    end

    it 'calls book.add_rental and sets book.is_rented to true' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental.book.is_rented).to eql(true)
      expect(rental.book.rentals).to eql([rental])
    end
  end

  describe '#title' do
    it 'returns title of rented book' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental.title).to eql('Title')
    end
  end

  describe '#author' do
    it 'returns author of rented book' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental.author).to eql('Author')
    end
  end

  describe '#person_id' do
    it 'returns the id of the person that rented book' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(rental.person_id).to eql(person.id)
    end
  end

  describe '#to_hash' do
    it 'returns a hash with all of the Rental\'s attributes, substituting id\'s for book and person' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)

      rental_hash = {
        'date' => '2023/11/11',
        'person_id' => person.id,
        'book_id' => book.id
      }

      expect(rental.to_hash).to eql(rental_hash)
    end
  end
end
