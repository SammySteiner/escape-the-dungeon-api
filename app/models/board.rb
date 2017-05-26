class Board < ApplicationRecord
  has_many :monsters
  has_one :player
  has_one :key
  has_one :door
end
