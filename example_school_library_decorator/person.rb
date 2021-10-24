require_relative './corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

  @person_list = []

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    Person.add_person(self)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def self.list
    @person_list
  end

  def self.add_person(person)
    @person_list << person
  end

  private

  def of_age?
    @age >= 18
  end
end
