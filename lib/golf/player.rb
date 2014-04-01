module Golf
  class Player
    include Virtus.model(:finalize => false)

    attribute :id, Integer
    attribute :name, String
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :scores, Array['Golf::Score']
  end
end
