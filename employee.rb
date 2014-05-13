class Employee
  
  attr_reader :salary
  
  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end
end

class Manager < Employee
  
  def initialize(name, title, salary, boss, employees=[])
    super(name, title, salary, boss)
    @employee = employees
  end
  
  def bonus(multiplier) 
    salaries = employees.inject { |accum, employee| accum += employee.salary }
    salaries * multiplier
  end 
  
end
  
  