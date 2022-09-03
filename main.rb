require_relative './app'

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
    list_books(app)
  when 2
    list_people(app)
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    create_rental(app)
  when 6
    list_rentals_by_id(app)
  end
end

def list_books(app)
  app.list_books
end

def list_people(app)
  app.list_people
end

def create_person(app)
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
    app.create_student(age, name, parent_permission:)
  when 2
    puts 'Specialization: '
    specialization = gets.chomp
    app.create_teacher(age, name, specialization)
  end
end

def create_book(app)
  puts 'Title: '
  title = gets.chomp
  puts 'Author: '
  author = gets.chomp
  app.create_book(title, author)
end

def create_rental(app)
  # Display options
  puts 'Select a book from the following list by number: '
  app.list_books_with_index
  book_i = gets.chomp.to_i

  # Display People Options
  puts 'Select a person from the following list by number(not id): '
  app.list_people_with_index
  people_i = gets.chomp.to_i

  # Date option
  puts 'Date: '
  date = gets.chomp

  app.create_rental(date, person_i, book_i)
end

def list_rentals_by_id(app)
  puts 'ID of the person'
  person_id = gets.chomp.to_i
  app.list_rentals_by_id(person_id)
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
      sleep(1)
    end
    break if option == 7
  end
  puts 'Thanks for using the app!'
end

main()
