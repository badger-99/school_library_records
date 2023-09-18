class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name='Unknown', age, parent_permission=true)
    @id = Random.rand(1..80000)
    @name = name
    @age = age
  end

  def can_use_services?
    return true if of_age
  end

  private
    def of_age?
      return true if @age >=18
    end
end
