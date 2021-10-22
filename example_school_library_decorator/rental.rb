class Rental
  attr_accessor :date,:book, :person
  attr_reader :id

  def initialize(date, book, person)
    @id = Random.rand(1..1000)
    @date = date
    @book = book
    @person = person
    @person.rentals << self
    @book.rentals << self
  end
end
