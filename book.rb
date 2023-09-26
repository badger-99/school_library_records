class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @rentals_ids = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def find_rental_id
    @rentals.each do |rental|
      @rentals_IDs.push(rental.id)
    end
  end

  def to_hash
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rental_IDs
    }
  end
end
