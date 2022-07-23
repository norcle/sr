class FonbetJSON
  attr_reader :json

  def initialize
    @json = {}
  end

  def generate
    define_version
    define_sports
    define_events
    define_event_miscs
    custom_factors
    @json
  end

  private

  def define_version
  end

  def define_sports 
  end

  def define_events
  end

  def define_event_miscs
  end

  def custom_factors
  end
end
