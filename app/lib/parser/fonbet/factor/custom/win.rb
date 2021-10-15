class Parser::Fonbet::Factor::Custom::Win < Parser::Fonbet::Factor::Custom::Base
  def parse
    create_factor(w1, 10)
    create_factor(wx, 11)
    create_factor(w2, 12)
    create_factor(onex, 13)
    create_factor(onetwo, 14)
    create_factor(xtwo, 15)
  end

  private

  def w1
    @w1 ||= find_factor(921)
  end

  def wx
    @wx ||= find_factor(922)
  end

  def w2
    @w2 ||= find_factor(923)
  end

  def onex
    @onex ||= find_factor(924)
  end

  def onetwo
    @onetwo ||= find_factor(925)
  end

  def xtwo
    @xtwo ||= find_factor(926)
  end
end
