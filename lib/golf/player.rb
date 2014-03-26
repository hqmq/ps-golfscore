class Player
  include Virtus.model

  attribute :id, Integer
  attribute :name, String
  attribute :created_at, Time
  attribute :updated_at, Time
end
