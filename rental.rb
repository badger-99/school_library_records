require 'json'

class Rental
  attr_accessor :date
  attr_reader :person, :book, :id

  def initialize(date, person, book)
    @id = Random.rand(1..1000)
    @date = date

    @person = person
    person.add_rental(self) if person.respond_to?(:add_rental)

    @book = book
    book.add_rental(self) if book.respond_to?(:add_rental)
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

  def rental_to_hash
    {
      'id' => @id,
      'date' => @date,
      'person' => @person.to_hash,
      'book' => @book.to_hash
    }
  end

  def to_json(rental_to_hash)
    JSON.generate(rental_to_hash)
  end
end
