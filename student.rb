require_relative './person'

class Student < Person
  attr_accessor :parent_permission
  attr_reader :classroom

  def initialize(age, name, classroom, parent_permission)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
