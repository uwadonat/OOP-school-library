require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './book'
require 'date'

class Student < Person
  arrt_accessor :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, classroom, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
