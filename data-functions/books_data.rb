require_relative '../utils/update_file.rb'

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
      rentals: rentals
    })
  end
  
  update_file('books', books_data)
end
