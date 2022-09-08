require_relative '../methods/person'

describe Person do
  context 'Testing the class Person' do
    before :each do
      @person1 = Person.new(16, 'John Doe', parent_permission: false)
    end

    it '@person1 should be instances of the class Person' do
      expect(@person1).to be_instance_of Person
    end

    it "@person1's age should be 16 and parent_permission should be false" do
      expect(@person1.age).to eq(16)
      expect(@person1.parent_permission).to eq(false)
    end

    it 'The method can_use_services? should be available for the instances @person1' do
      expect(@person1).to respond_to(:can_use_service?)
    end

    it 'The method correct_name should be available for the instances @person1' do
      expect(@person1).to respond_to(:correct_name)
    end
  end
end
