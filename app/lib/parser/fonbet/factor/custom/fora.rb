class Parser::Fonbet::Factor::Custom::Fora < Parser::Fonbet::Factor::Custom::Base
  def parse
    create_factor(fora1, 20)
    create_factor(fora2, 21)
    @counter
  end

  private

  def fora1
    @fora1 ||= find_factor(927)
  end

  def fora2
    @fora2 ||= find_factor(928)
  end
end

