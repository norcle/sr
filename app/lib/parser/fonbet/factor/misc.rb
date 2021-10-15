class Parser::Fonbet::Factor::Misc
  @@last_score = {}
  def initialize(event, live_json:)
    @event = event
    @live_json = live_json
  end

  def parse
    create_score(1)
    create_score(2)
  end

  private

  def create_score(num)
    return if last_score_equal(num)
    return if misc.try(:[], "score#{num}").nil?

    p "#{@@last_score[cache_key(num)]} == #{misc["score#{num}"]}"
    Factor.create factor_key_id: num,
                  value: misc["score#{num}"],
                  event: @event
    write_last_score
  end

  def write_last_score
    @@last_score[cache_key(1)] = misc['score1']
    @@last_score[cache_key(2)] = misc['score2']
  end

  def last_score_equal(num)
    @@last_score[cache_key(num)] == misc.try(:[], "score#{num}")
  end

  def cache_key(num)
    "#{@event.external_id}_#{num}"
  end

  def misc
    @misc ||= @live_json.ru['eventMiscs'].select { |misc| misc['id'] == @event.external_id.to_i }.last rescue nil
  end
end
