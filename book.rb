class Book
  attr_accessor :title, :author, :id, :is_rented
  attr_reader :rentals

  def initialize(title, author)
    @id = Random.rand(1..10_000)
    @title = title
    @author = author
    @rentals = []
    @is_rented = false
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_ids
    @rentals.map(&:id)
  end

  def to_hash
    {
      'id' => @id,
      'title' => @title,
      'author' => @author,
      'is_rented' => @is_rented
    }
  end
end
