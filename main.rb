require_relative './app'

def list_of_options
  puts 'Welcome to the School Library app!'
  puts ''
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given id'
  puts '7 - exit'
end

def actions(option)
  case option
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals_by_id
  end
end

def list_books
  App.list_books
end

def list_people
  App.list_people
end

def create_person
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  selection = gets.chomp.to_i
  puts 'Age: '
  age = gets.chomp.to_i
  puts 'Name: '
  name = gets.chomp

  case selection
  when 1
    puts 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    App.create_student(age, name, parent_permission: parent_permission)
  when 2
    puts 'Specialization: '
    specialization = gets.chomp
    App.create_teacher(age, name, specialization)
  end
end

def create_book
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  App.create_book(title, author)
end

def create_rental
  # Display options
  puts 'Select a book from the following list by number: '
  App.list_books_with_index
  book_i = gets.chomp.to_i

  # Display People Options
  puts 'Select a person from the following list by number(not id): '
  App.list_people_with_index
  people_i = gets.chomp.to_i

  # Date option
  puts 'Date: '
  date = gets.chomp

  App.create_rental(date, person_i, book_i)
end

def list_rentals_by_id
  puts 'ID of the person'
  person_id = gets.chomp.to_i
  App.list_rentals_by_id(person_id)
end

def main
  app = App.new()
  loop do
    list_of_options
    option = gets.chomp.to_i
    if (1..7).include?(option)
      actions(option)
    else
      puts 'Sorry, wrong option selected.'
      sleep(1)
    end
    break if option == 7
  end
  puts 'Thanks for using the app!'
end

main()
