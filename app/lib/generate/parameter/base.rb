class Generate::Parameter::Base
  def initialize(previous_value)
    @previous_value = previous_value
  end

  def random
    raise NotImplementedYet
  end
end
