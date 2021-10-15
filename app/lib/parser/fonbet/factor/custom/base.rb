class Parser::Fonbet::Factor::Custom::Base
  @@last_factors = {}

  def initialize(event, live_json:)
    @event = event
    @live_json = live_json
    @counter = 0
  end

  def parse
    raise NotImplementedYet
  end

  private

  def create_factor(factor, factor_key)
    factor = factor.with_indifferent_access
    return if last_factor_equal(factor_key, factor)
    return if factor.nil?
    return if factor_key.nil?
    return if factor.try(:[], 'v').nil?

    Factor.create! value: factor.try(:[], 'v'),
                   parameter: factor.try(:[], 'p'),
                   factor_key_id: factor_key,
                   event: @event
    @counter += 1
    write_cache(factor, factor_key)
  end

  def last_factor_equal(factor_key, current)
    @last_factor_equal ||= @@last_factors[cache_key(factor_key, 'v')] == current.try(:[], 'v') &&
                           @@last_factors[cache_key(factor_key, 'p')] == current.try(:[], 'p')
  end

  def write_cache(factor, factor_key)
    @@last_factors[cache_key(factor_key, 'v')] = factor['v']
    @@last_factors[cache_key(factor_key, 'p')] = factor['p'] if factor.try(:[], 'p')
  end

  def cache_key(factor_key, adds)
    "#{@event.external_id}_#{factor_key}_#{adds}"
  end

  def find_factor(factor_id)
    factor = @live_json.find { |x| x['e'] == @event.external_id.to_i && x['f'] == factor_id }
    { 'v': factor.try(:[], 'v'), 'p': factor.try(:[], 'p') }
  end
end

