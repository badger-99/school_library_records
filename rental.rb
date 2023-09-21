class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
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
  end
end
