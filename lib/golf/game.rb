module Golf 
  class Game
    include Virtus.model

    attribute :id, Integer
    attribute :played_at, Time
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :scores, Array[Score]
  end
end
