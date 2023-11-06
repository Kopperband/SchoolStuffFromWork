class User
  attr_accessor :name, :address :department
  def initialize(name, address, department)
    @name = name
    @address = address
    @department = department
  end
end

class Company
  attr_accessor :name, :url, :departments
  def initialize(name, url)
    @name = name
    @url = url.parse(url
  end
  def users
    departments.map(&:users).flatten
  end

end

class Department
  attr_accessor :name, :users
  def initialize(name)
    @name = name
    @users = []
  end
end

c = Company.new("Acme Inc", "https://example.com")
sales = Department.new("sales")
engineering = Department.new("Engineering")

bob = User.new("Bob Smith", "1 Main Street", sales)
mary = User.new("Mary Jane", "10 Independance Blvd", engineering)
c.departments = [sales, engineering]
