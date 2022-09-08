require_relative '../methods/student'

describe Student do
  context 'Testing the class Student' do
    before :each do
      @student = Student.new(19, 'John Doe', parent_permission: true)
    end

    it '@student should be an instance of the class Student' do
      expect(@student).to be_instance_of Student
    end

    it "@student's age should be 19, name shoud be John Doe and parent_permission should be true" do
      expect(@student.age).to eq(19)
      expect(@student.name).to eq('John Doe')
      expect(@student.parent_permission).to eq(true)
    end

    it "@student's id should be a number between 1 and 1000" do
      expect(@student.id).to be_between(1, 1000)
    end

    it 'The method play_hooky should be available for the instances @student' do
      expect(@student).to respond_to(:play_hooky)
    end
  end
end
