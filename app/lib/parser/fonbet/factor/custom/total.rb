class Parser::Fonbet::Factor::Custom::Total < Parser::Fonbet::Factor::Custom::Base
  def parse
    create_factor(total1, 16)
    @counter
  end

  private

  def total1
    @total1 ||= find_factor(930)
  end
end
