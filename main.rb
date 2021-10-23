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

def create_book
  print "Title: "
  title = gets.chomp
  puts
  print "Author: "
  author = gets.chomp
  puts
  book = Book.new(author, title)

  if book
    puts 'Book created successfully!'
    puts
  else
    puts 'Invalid inputs try again'
    sleep 1
    create_book()
  end
end

def create_rental
  persons = Person.list
  books = Book.list

  puts "Select a book from the following list by number:"
  books.each do |book, i|
    puts "#{i}) ID: #{book.id}, Title: #{book.title}, Author: #{book.author}\n"
  end
  
  puts
  book = gets.chomp

  if book.match(/[0-9]/) && book.to_i < book.length
    book = book.to_i
  else
    puts "Invalid input, try again"
    create_rental()
  end

  puts "Select a book from the following list by number:"
  persons.each do |person|
    result = person.instance_of?(Student) ? "[STUDENT]" : "[TEACHER]"
    puts "#{result} ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end

  puts
  person = gets.chomp

  if person.match(/[0-9]/) && person.to_i < person.length
    person = person.to_i
  else
    puts "Invalid input, try again"
    create_rental()
  end

  print "Date: "
  date = gets.chomp

  Rental.new(date, books[book], persons[person])
end