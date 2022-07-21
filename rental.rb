require_relative './book'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @rentals = []
    @person = person

    @person.rentals << self unless @person.rentals.include?(self)

    @book = book
    @book.rentals << self unless @book.rentals.include?(self)
  end
end
