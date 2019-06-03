class CreditsMachine < ApplicationRecord

  def self.change_credits(original, new_amt)
    original + new_amt
  end

end
