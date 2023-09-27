class Book
  attr_accessor :title, :author, :id
  attr_reader :rentals

  def initialize(title, author)
    @id = Random.rand(1..10_000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def rental_ids
    @rentals.map(&:id)
  end

  def to_hash
    {
      'id' => @id,
      'title' => @title,
      'author' => @author,
      'rental_ids' => rental_ids
    }
  end

  def book_to_json
    JSON.generate(to_hash)
  end
end
