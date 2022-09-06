require_relative '../app'

# rubocop:disable Style/GuardClause
def check_to_list_rentals(app)
  unless app.list_people_with_index.nil?
    puts 'ID of the person'
    person_id = gets.chomp.to_i
    app.list_rentals_by_id(person_id)
  end
end
# rubocop:enable Style/GuardClause
