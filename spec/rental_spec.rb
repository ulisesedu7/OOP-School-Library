require_relative '../methods/rental'
require_relative '../methods/book'
require_relative '../methods/person'

describe Rental do
  context 'Testing the class Rental' do
    before :each do
      @person = Person.new(16, 'John Doe', parent_permission: false)
      @book = Book.new('Narnia', 'C.S Lewis')
      @rental = Rental.new('2019-09-18', @book, @book.title, @book.author, @person, @person.id)
    end

    it '@rental should be an instance of the class Rental' do
      expect(@rental).to be_instance_of Rental
    end

    it "@rental's date should be 2019-09-18" do
      expect(@rental.date).to eq('2019-09-18')
    end

    it "@rental's book title should be Narnia and author should be C.S Lewis" do
      expect(@rental.book.title).to eq('Narnia')
      expect(@rental.book.author).to eq('C.S Lewis')
    end

    it "@rental's person parent_permission should be false, age should be 16 and name should be John Doe" do
      expect(@rental.person.parent_permission).to eq(false)
      expect(@rental.person.age).to eq(16)
      expect(@rental.person.name).to eq('John Doe')
    end
  end
end
