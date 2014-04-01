module Golf
  class Team
    include Virtus.model(:finalize => false)

    attribute :id, Integer
    attribute :name, String
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :players, Array['Golf::Player']
    attribute :scores, Array['Golf::Score']
  end
end
