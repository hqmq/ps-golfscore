module Golf 
  class Game
    include Virtus.model(:finalize => false)

    attribute :id, Integer
    attribute :played_at, Time
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :scores, Array['Golf::Score']
  end
end
