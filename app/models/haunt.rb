class Haunt < ApplicationRecord
  belongs_to :ghost
  belongs_to :house
end
