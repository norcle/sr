class Generate::Value::Score < Generate::Value::Base
  def random
    @previous_value += Random.rand(0..3)
  end
end
