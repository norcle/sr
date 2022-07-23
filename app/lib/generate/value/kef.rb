class Generate::Value::Kef < Generate::Value::Base
  def random
    if @previous_value < 0.2 
      @previous_value += Random.rand(0.2..0.4).round(2)
    elsif @previous_value > 1.6
      @previous_value += Random.rand(-0.4..0.2).round(2)
    else
      @previous_value += Random.rand(-0.2..0.2).round(2)
    end
  end
end
