class Book
  attr_accessor :title, :author
  attr_reader :rental

  def intiialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
end
