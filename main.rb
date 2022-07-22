require_relative './app'

def request
  puts 'Please choose an option below :'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

puts 'Welcome to School Library App!'

def actions
  case input_actions
  when '1'
    list_all_books
  when '2'
    list_all_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_all_rental
  else
    puts 'Thank you for using this app'
  end
end

def main
  app = App.new
  app.request
end

main
