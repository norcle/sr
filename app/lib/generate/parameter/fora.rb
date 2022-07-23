class Generate::Parameter::Fora < Generate::Parameter::Base
  def random
    @previous_value += Random.rand(1..2)
  end
end
