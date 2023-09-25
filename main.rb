require './Console.manager'
require './menu'

module Main
  ConsoleManager.new
  include MainMenu
  puts 'Welcome to the School Library App!\n'
  loop do
    puts "#{MainMenu.display_menu}\n"
    choice = get.chomp

    until %w[1 2 3 4 5 6 7].include?(choice)
      puts 'Please enter a valid choice:'
      choice = gets.chomp
    end

    case choice
    when 1
      console_manager.list_books
    when 2
      console_manager.list_persons
    when 3
      console_manager.add_person
    when 4
      console_manager.add_book
    when 5
      console_manager.add_rental
    when 6
      console_manager.list_rental_for_id
    when 7
      puts 'Thank you for using this app!'
      break
    end
  end
end
