require_relative './app'

public

def request
  puts 'Please choose an option below :'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.chomp.to_s
end

puts 'Welcome to School Library App!'

public

# rubocop:disable Metrics/CyclomaticComplexity
def actions(input_actions, app)
  case input_actions
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_all_rental
  when '7'
    puts 'Thank you for using this app'
    exit
  else
    puts 'Choose a number between 1 to 7'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def main
  app = App.new
  loop do
    input = request
    actions(input, app)
  end
end

main
