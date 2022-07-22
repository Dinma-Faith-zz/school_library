require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './person'

def student_age
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Classroom:'
  classroom = gets.chomp
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp
  student = Student.new(age, name, classroom, parent_permission)
  @people.push(student)
  puts "Person created successfuly\n"
end

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      print 'No books in library'
      return
    end
    @books.each do |book|
      print "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully\n"
  end

  def list_all_people
    if @people.empty?
      puts 'Your Library is empty'
      return
    end
    @people.each do |person|
      print "[#{person.class.name}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      student_age
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)
      puts "Person created successfully\n"
    end
  end

  def list_all_rental
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '

    rentals = @rentals.select { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found'
      return
    end

    rentals.each do |rental|
      print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
    end
  end

  def create_rental
    puts 'Your Library is empty' if @people.empty? && @books.empty?
    puts 'Select a book by number'
    @books.each_with_index do |book, i|
      print "#{i}) Title: #{book.title}, Author: #{book.author}\n"
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person by number'
    @people.each_with_index do |person, i|
      print "#{i}) [#{person.class}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]
    print "\nDate: "
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts "Rental created successfully\n"
  end
end
