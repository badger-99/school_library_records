require 'json'

class Rental
  attr_accessor :date
  attr_reader :person, :book, :id

  def initialize(date, person, book)
    @date = date

    @person = person
    person.add_rental(self) if person.respond_to?(:add_rental)
    person.has_rented = true

    @book = book
    book.add_rental(self) if book.respond_to?(:add_rental)
    book.is_rented = true
  end

  def title
    @book.title
  end

  def author
    @book.author
  end

  def person_id
    @person.id
  end

  def to_hash
    {
      'date' => @date,
      'person_id' => @person.id,
      'book_id' => @book.id
    }
  end
end
