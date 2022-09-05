require_relative '../app.rb'

# Check if there's information to rent
# rubocop:disable Style/GuardClause
def check_to_rent(app)
  unless app.list_books_with_index.nil?
    # Display options
    puts 'Select a book from the list by index number: '
    book_i = gets.chomp.to_i
    puts ''

    # Display People Options
    unless app.list_people_with_index.nil?

      puts 'Select a person from the list by index number(not id): '
      person_i = gets.chomp.to_i
      puts ''

      # Date option
      puts 'Date: '
      date = gets.chomp

      app.create_rental(date, book_i, person_i)
    end
  end
end
# rubocop:enable Style/GuardClause
