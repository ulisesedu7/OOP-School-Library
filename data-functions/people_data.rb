require_relative '../utils/update_file'
require_relative '../methods/person.rb'

def save_people(people)
  people_data = []
  
  people.each do |person|

    people_data.push({
      age: person.age,
      name: person.name,
      id: person.id,
      type: person.type
    })
  end
  
  update_file('people', people_data)
end

def loaded_people
  loaded_people = []

  unless File.zero?('./library-data/people.json')
    people_file = File.open("./library-data/people.json")
    hash_people = JSON.parse(people_file.read)
  end

  unless hash_people.empty?
    hash_people.each do |person|
      loaded_people << Student.new(person['age'], person['name']) if person['type'] == 'Student'

      loaded_people << Teacher.new(person['age'], person['name']) if person['type'] == 'Teacher'
    end
    people_file.close
  end

  loaded_people

end
