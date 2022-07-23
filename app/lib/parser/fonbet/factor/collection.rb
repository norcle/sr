class Parser::Fonbet::Factor::Collection
  ALL_KEYS = FactorKey.all.pluck(:external_id).freeze

  def initialize(events, live_json:)
    @events = events
    @live_json = live_json
  end

  def parse
    ActiveRecord::Base.transaction do
      @events&.each do |event|
        counter = 0
        counter += Parser::Fonbet::Factor::Misc.new(event, live_json: @live_json).parse
        counter += Parser::Fonbet::Factor::Custom::Win.new(event, live_json: exclude_factors).parse
        counter += Parser::Fonbet::Factor::Custom::Total.new(event, live_json: exclude_factors).parse
        counter += Parser::Fonbet::Factor::Custom::Fora.new(event, live_json: exclude_factors).parse
        event.touch if counter.positive?
      end
    end
  end

  private

  def exclude_factors
    @exclude_factors ||= @live_json.ru['customFactors'].select { |x| ALL_KEYS.include?(x['f']) }
  end
end
