require_relative './example_school_library_decorator/book'
require_relative './example_school_library_decorator/person'
require_relative './example_school_library_decorator/student'
require_relative './example_school_library_decorator/teacher'
require_relative './example_school_library_decorator/classroom'
require_relative './example_school_library_decorator/rental'

def create_student
  print "Age: "
  age = gets.chomp
  print "Name: "
  name = gets.chomp
  print "Has parent permission? [Y/N]: "
  permission = gets.chomp
  puts
  if permission == 'y' || permission == 'Y'
    permission = true
  elsif permission == 'n' || permission == 'N'
    permission = false
  else
    puts 'Invalid input, try again'
    puts
    create_student()
  end
  Student.new(age, Classroom.new("Comics"), name, permission)
end

def create_teacher
  print "Age: "
  age = gets.chomp
  print "Name: "
  name = gets.chomp
  print "Specialization: "
  specialization = gets.chomp
  puts
  teacher = Teacher.new(age, specialization, name)
end
