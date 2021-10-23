# frozen_string_literal: true

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @id = Random.rand(1..1000)
    @label = label
    @students = []
  end

  def add_students(students)
    @students << students
    student.classroom = self
  end
end
