require_relative './methods/person'
require_relative './methods/student'
require_relative './methods/teacher'
require_relative './methods/book'
require_relative './methods/rental'
require_relative './data-functions/books_data'
require_relative './data-functions/people_data'
require_relative './data-functions/rentals_data'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  attr_accessor :books, :people, :rentals

  # List all books method
  def list_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
      puts ''
    else
      books.each do |book|
        puts "Title: #{book.title} by Author: #{book.author}"
        puts ''
      end
    end
  end

  # List all books with index
  def list_books_with_index
    if @books.empty?
      puts 'There is no books to rent!'
      puts ''
    else
      books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\" by Author: #{book.author}"
      end
    end
  end

  # List all people
  def list_people
    puts 'List of people: '
    if @people.empty?
      puts 'There is no people registered!'
      puts ''
    else
      people.each do |person|
        puts "[#{person.type}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
        puts ''
      end
    end
  end

  # List all people with index
  def list_people_with_index
    if @people.empty?
      puts 'There is no people to rent a book!'
      puts ''
    else
      people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
        puts ''
      end
    end
  end

  # Create a new student
  def create_student(age, name, parent_permission: true)
    student = Student.new(age, name, parent_permission:)
    @people.push(student)
    puts 'Student has been created!'
    puts ''
  end

  # Create a new teacher
  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher has been created!'
    puts ''
  end

  # Create Person
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    selection = gets.chomp.to_i
    if [1, 2].include?(selection)
      puts 'Age: '
      age = gets.chomp.to_i
      puts 'Name: '
      name = gets.chomp

      case selection
      when 1
        puts 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        create_student(age, name, parent_permission:)
      when 2
        puts 'Specialization: '
        specialization = gets.chomp
        create_teacher(age, name, specialization)
      end
    else
      puts 'Wrong Selection, returning to menu'
    end
  end

  # Create a new Book
  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'A book has been created'
    puts ''
  end

  # Create a new rental
  def create_rental(date, book_i, person_i)
    rental = Rental.new(date, @books[book_i], @people[person_i])
    @rentals.push(rental)
    puts 'Rental succesfully made'
    puts ''
  end

  # List all rentals for a given ID
  def list_rentals_by_id(person_id)
    puts 'List of rentals: '
    if @rentals.empty?
      puts 'Nothing has been rented here'
      puts ''
    else
      rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
        puts ''
      end
    end
  end

  # Save Data funciton
  def save_data
    save_books(@books)
    save_people(@people)
    save_rentals(@rentals)
  end

  # Load Data Function
  def load_data
    @books = loaded_books()
    @people = loaded_people()
    @rentals = loaded_rentals()
  end
end
