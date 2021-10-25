class Book
  attr_accessor :author, :title, :rentals
  attr_reader :id

  @book_list = []

  def initialize(author, title)
    @id = Random.rand(1..1000)
    @rentals = []
    @title = title
    @author = author
    Book.add_book(self)
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def self.list
    @book_list
  end

  def self.add_book(book)
    @book_list << book
  end
end
