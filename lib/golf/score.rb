module Golf
  class Score
    include Virtus.model(:finalize => false)

    attribute :participant #Player or Team
    attribute :game, 'Golf::Game'
    attribute :holes, Array[Integer]
  end
end
