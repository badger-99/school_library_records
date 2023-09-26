class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @rentals_IDs = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def get_rental_IDs
    @rentals.each do |rental|
      @rentals_IDs.push(rental.id)
  end

end
