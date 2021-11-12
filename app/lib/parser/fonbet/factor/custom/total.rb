class Parser::Fonbet::Factor::Custom::Total < Parser::Fonbet::Factor::Custom::Base
  def parse
    create_factor(total1, 16)
    create_factor(total2, 17)
    create_factor(total3, 18)
    create_factor(total4, 19)
    @counter
  end

  private

  def total1
    @total1 ||= find_factor(930)
  end

  def total2
    @total2 ||= find_factor(931)
  end

  def total3
    @total3 ||= find_factor(940)
  end

  def total4
    @total4 ||= find_factor(941)
  end
end

