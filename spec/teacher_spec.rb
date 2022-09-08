require_relative '../methods/teacher'

describe Teacher do
  context 'Testing the class Teacher' do
    before :each do
      @teacher = Teacher.new(50, 'Jane Doe', 2, 'Software Developer')
    end

    it '@teacher should be an instance of the class teacher' do
      expect(@teacher).to be_instance_of Teacher
    end

    it "@teacher's age should be 50, name shoud be Jane Doe and specialization should be Software Developer" do
      expect(@teacher.age).to eq(50)
      expect(@teacher.name).to eq('Jane Doe')
      expect(@teacher.specialization).to eq('Software Developer')
    end

    it "@teacher's id should be a number between 1 and 1000" do
      expect(@teacher.id).to be_between(1, 1000)
    end

    it 'The method can_use_services? should be available for the instances @teacher' do
      expect(@teacher).to respond_to(:can_use_service?)
    end
  end
end