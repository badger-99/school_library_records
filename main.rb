require './console_manager'
require './menu'

module Main
  console_manager = ConsoleManager.new
  include MainMenu
  console_manager.load_data
  puts 'Welcome to the School Library App!'
  loop do
    puts "#{MainMenu.display_menu}\n"
    choice = gets.chomp

    until %w[1 2 3 4 5 6 7].include?(choice)
      puts 'Please enter a valid choice:'
      choice = gets.chomp
    end

    case choice
    when '1'
      console_manager.list_books
    when '2'
      console_manager.list_persons
    when '3'
      console_manager.add_person
    when '4'
      console_manager.add_book
    when '5'
      console_manager.add_rental
    when '6'
      console_manager.list_rental_for_id
    when '7'
      console_manager.exit
      break
    end
  end
end
