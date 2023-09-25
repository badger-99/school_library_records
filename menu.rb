module MainMenu
  @menu = "\nPlease choose an option by entering a number.
  1 - List all books
  2 - List all people
  3 - Register a person
  4 - Register a book
  5 - Record a rental
  6 - List all rentals for a given person ID
  7 - Exit"

  def self.display_menu
    @menu
  end
end

