require_relative '../utils/update_file'
require_relative '../methods/book'

def save_books(books)
  books_data = []

  books.each do |book|
    rentals = []

    book.rentals.each do |rental|
      rentals.push({
                     date: rental.date,
                     title: rental.book.title,
                     author: rental.book.author,
                     person_id: rental.person.id
                   })
    end

    books_data.push({
                      title: book.title,
                      author: book.author,
                      rentals:
                    })
  end

  update_file('books', books_data)
end

def loaded_books
  loaded_books = []

  unless File.zero?('./library-data/books.json')
    books_file = File.open('./library-data/books.json')
    hash_books = JSON.parse(books_file.read)
  end

  unless hash_books.empty?
    hash_books.each do |book|
      loaded_books << Book.new(book['title'], book['author'])
    end
    books_file.close
  end

  loaded_books
end
