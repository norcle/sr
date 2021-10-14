class Generate::Factor
  attr_reader :event, :factor_key, :time_counter, :value

  def initialize(event)
    @event = event
    @value = 0
    @time_counter = Time.now
    @factor_key = FactorKey.find(1)
  end

  def generate
    100.times do
      Factor.create! event: @event,
                     factor_key: @factor_key,
                     value: updated_value,
                     created_at: updated_time,
                     updated_at: updated_time
    end
  end

  private

  def updated_time
    @time_counter += 2.second
  end

  def updated_value
    @value += Random.rand(0..3)
  end
end
