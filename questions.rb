class Questions
  attr_reader :answer, :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end
end