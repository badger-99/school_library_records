class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..80_000)
    @name = name
    @age = age
    @parent_permissioin = parent_permission
  end

  def can_use_services?
    true if of_age
  end

  private

  def of_age?
    true if @age >= 18 || @parent_permission
  end
end
