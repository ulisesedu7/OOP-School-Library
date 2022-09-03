require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

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
        puts "[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
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
        puts "#{index}) #{person.class}; Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
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

  # Create a new Book
  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    puts 'A book has been created'
    puts ''
  end

  # Create a new rental
  def create_rental(date, person_i, book_i)
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
        next if rental.person.id == person_id

        puts "Date: #{rental.date}"
        puts rental.rentals
      end
    end
  end
end
