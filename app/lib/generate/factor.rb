class Generate::Factor
  attr_reader :event, :factor_key, :time_counter, :value, :thread

  def initialize(event, factor_key:, live_mode: false, step_time: 2.second, repeats: 10, random_value: Generate::Value::Score, random_parameter: nil)
    @event = event
    @value = 0
    @parameter = 10
    @time_counter = Time.now
    @factor_key = factor_key
    @live_mode = live_mode
    @step_time = step_time
    @repeats = repeats
    @random_value = random_value
    @random_parameter = random_parameter
  end

  def generate
    @thread = Thread.new do
      if @live_mode
        factor_cycle
      else
        ActiveRecord::Base.transaction { factor_cycle }
      end
    end
  end

  private

  def factor_cycle
    @repeats.times do
      create_factor
      sleep @step_time if @live_mode
    end
  end

  def create_factor
    Factor.create!   event: @event,
                     factor_key: @factor_key,
                     value: updated_value,
                     parameter: updated_parameter,
                     created_at: updated_time,
                     updated_at: updated_time
  end

  def updated_time
    @time_counter += @step_time
  end

  def updated_value
    @value = @random_value.new(@value).random
  end

  def updated_parameter
    @parameter = @random_parameter.new(@parameter).random if @random_parameter
  end
end
