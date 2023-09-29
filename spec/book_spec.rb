require_relative 'spec_helper'

describe Book do
  describe '#new' do
    it 'takes title and author string parameters and returns a Book object' do
      book = Book.new('Title', 'Author')
      expect(book).to be_an_instance_of Book
      expect(book.title).to eql('Title')
      expect(book.author).to eql('Author')
      expect(book.rentals).to eql([])
      expect(book.is_rented).to eql(false)
    end
  end

  describe '#add_rental' do
    it 'should push a rental to the rentals array' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      expect(book.rentals).to eql([rental])
    end

    it 'should push subsequent rentals to the rentals array' do
      book = Book.new('Title', 'Author')
      person = Person.new(18, 'Human', parent_permission: true)
      rental = Rental.new('2023/11/11', person, book)
      rental2 = Rental.new('2023/12/12', person, book)
      expect(book.rentals).to eql([rental, rental2])
    end
  end

  describe '#to_hash' do
    it 'returns a hash with all of the Book\'s attributes, excluding rentals' do
      book = Book.new('Title', 'Author')
      book_id = book.id
      book_hash = {
        'id' => book_id,
        'title' => 'Title',
        'author' => 'Author',
        'is_rented' => false
      }
      expect(book.to_hash).to eql(book_hash)
    end
  end
end
