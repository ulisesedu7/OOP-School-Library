require_relative './app'
require_relative './utils/check_to_rent'
require_relative './utils/check_to_list_rentals'

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given id'
  puts '7 - exit'
end

def actions(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    check_to_rent(app)
  when 6
    check_to_list_rentals(app)
  end
end

def main
  app = App.new
  puts 'Welcome to the School Library app!'
  puts ''

  loop do
    list_of_options
    option = gets.chomp.to_i
    if (1..7).include?(option)
      actions(option, app)
    else
      puts 'Sorry, wrong option selected.'
      puts ''
      sleep(1)
    end
    break if option == 7
  end
  puts 'Thanks for using the app!'
end

main
