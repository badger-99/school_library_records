class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = Random.rand(1..10000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def rental_IDs
    @rentals.map {|rental| rental.id}
  end

  def to_hash
    {
      'title' => @title,
      'author' => @author,
      'rentals' => rental_IDs
    }
  end

  def to_json
    JSON.generate(to_hash)
  end
end
