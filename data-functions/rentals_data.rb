require_relative '../utils/update_file'
require_relative '../methods/rental'

def save_rentals(rentals)
  rentals_data = []

  rentals.each do |rental|
    
    rentals_data.push({
      date: rental.date,
      book: rental.book,
      person: rental.person,
    })
  end
  
  update_file('rentals', rentals_data)
end

def loaded_rentals
  loaded_rentals = []

  unless File.zero?('./library-data/rentals.json')
    rentals_file = File.open("./library-data/rentals.json")
    hash_rentals = JSON.parse(rentals_file.read)
  end

  unless hash_rentals.empty?
    hash_rentals.each do |rental|
      loaded_rentals << Rental.new(rental['date'], rental['book'], rental['person'])
    end
    rentals_file.close
  end

  loaded_rentals
end