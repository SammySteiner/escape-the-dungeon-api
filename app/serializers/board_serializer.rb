class BoardSerializer < ActiveModel::Serializer

  attributes :id, :name, :size
  has_one :player
  has_one :key
  has_one :door
  has_many :monsters

end
