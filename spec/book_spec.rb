require_relative '../methods/book'

describe Book do
  context 'Testing the class Book' do
    before :each do
      @book = Book.new('Narnia', 'C.S Lewis')
    end

    it '@book should be an instance of the class Book' do
      expect(@book).to be_instance_of Book
    end

    it "The book's title should be Narnia" do
      expect(@book.title).to eq('Narnia')
    end

    it "The book's author should be C.S Lewis" do
      expect(@book.author).to eq('C.S Lewis')
    end

    it 'The method add_rental should be available for the instance @book' do
      expect(@book).to respond_to(:add_rental)
    end
  end
end
