require_relative './person'
require_relative './student.rb'
require_relative './teacher.rb'
require_relative './book'
require_relative './rental'

class App
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  attr_accessor :books, :people, :rentals

  # List all books method
  def list_books
    puts 'List of books: '
    if @books.empty?
      puts 'No books have been registered!'
    else
      books.each { |book| 
        puts "Title: #{book.titile} by Author: #{book.author}"
      }
    end
  end

  # List all people
  def list_people
    puts 'List of people: '
    if @people.empty?
      puts 'There is no people registered!'
    else
      people.each { |person| 
        puts "#{person.class}; Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      }
    end
  end

  # Create a new student 
  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission: parent_permission, @classroom)
    @people.push(student)
    puts 'Student has been created!'
  end

  # Create a new teacher 
  def create_student(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Teacher has been created!'
  end

  # Create a new Book
  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    puts 'A book has been created'
  end

  # Create a new rental
  def create_rental(date, person_i, book_i)
    rental = Rental.new(date, @people[person_i], @people[book_i])
    @rentals.push(rental)
    puts 'Rental succesfully made'
  end

  # List all rentals for a given ID
  def list_rentals_by_id(person_id)
    puts 'List of rentals: '
    if @rentals.empty?
      puts 'Nothing has been rented here'
    else
      rentals.each { |rental|
        next if rental.person.id == person_id
        puts "Date: #{rental.date}"
        puts rental.rentals
      }
    end
  end

end
