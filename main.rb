require_relative './example_school_library_decorator/book'
require_relative './example_school_library_decorator/person'
require_relative './example_school_library_decorator/student'
require_relative './example_school_library_decorator/teacher'
require_relative './example_school_library_decorator/classroom'
require_relative './example_school_library_decorator/rental'

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity

def person_instance?(person)
  person.instance_of?(Student) ? '[STUDENT]' : '[TEACHER]'
end

def create_student
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Has parent permission? [Y/N]:\n'
  permission = gets.chomp
  case permission
  when 'y', 'Y'
    permission = true
  when 'n', 'N'
    permission = false
  else
    puts 'Invalid input, try again\n'
    create_student
  end
  Student.new(age, Classroom.new('Comics'), name, permission)
end

def create_teacher
  print 'Age: \n'
  age = gets.chomp
  print 'Name: \n'
  name = gets.chomp
  print 'Specialization: \n'
  specialization = gets.chomp
  Teacher.new(age, specialization, name)
end

def create_book
  print 'Title: \n'
  title = gets.chomp
  print 'Author: \n'
  author = gets.chomp
  book = Book.new(author, title)

  if book
    puts 'Book created successfully!\n'
  else
    puts 'Invalid inputs try again\n'
    sleep 1
    create_book
  end
  display_menu
end

def create_rental
  persons = Person.list
  books = Book.list
  puts 'Select a book from the following list by number:\n'
  books.each_with_index do |book, i|
    puts "#{i}) ID: #{book.id}, Title: #{book.title}, Author: #{book.author}\n"
  end
  book = gets.chomp
  puts 'Select a book from the following list by number:\n'
  persons.each_with_index do |person, i|
    result = person_instance?(person)
    puts "#{i} #{result} ID: #{person.id}, Name: #{person.name}, Age: #{person.age}\n"
  end
  person = gets.chomp
  if (person.match(/[0-9]/) && person.to_i < person.length) && (book.match(/[0-9]/) && book.to_i < book.length)
    person = person.to_i
    book = book.to_i
  else
    puts 'Invalid input, try again\n'
    create_rental
  end
  print 'Date: '
  date = gets.chomp
  Rental.new(date, books[book], persons[person])
  display_menu
end

def rental_list
  persons = Person.list
  print 'ID of person: '
  id = gets.chomp
  puts
  if id.match(/[0-9]/)
    id = id.to_i
  else
    puts 'Invalid input, try again\n'
    rental_list
  end

  person = persons.filter { |per| per.id == id }

  person[0].rentals.each do |rental|
    book = rental.book
    puts "Date: #{rental.date}, Book: \"#{book.title}\" by #{book.author}\n"
  end
  display_menu
end

def book_list
  books = Book.list
  books.each do |book|
    puts "ID: #{book.id}, Title: #{book.title}, Author: #{book.author}\n"
  end
  if books.length.zero?
    puts 'No books yet\n'
  end
  display_menu
end

def person_list
  persons = Person.list
  persons.each do |person|
    result = person_instance?(person)
    puts "#{result} ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end
  if persons.length.zero?
    puts 'No persons yet\n'
  end
  display_menu
end

def create_person
  print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:\n'
  input = gets.chomp

  case input
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts 'Invalid input, please try again!\n'
    sleep 1
    create_person
  end
  display_menu
end

def display_menu
  puts 'Please choose an option enterin a number:'
  puts '1 - List all books'
  puts '2 - List all persons'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit\n'
  response = gets.chomp
  case response
  when '1'
    book_list
  when '2'
    person_list
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    rental_list
  when '7'
    nil
  else
    puts 'invalid input, try again\n'
    display_menu
  end
end

display_menu

# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
