class Book
  attr_accessor :author, :title, :rentals
  attr_reader :id

  @@book_list = []

  def initialize(author, title)
    @id = Random.rand(1..1000)
    @rentals = []
    @title = title
    @author = author
    @@book_list << self
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
