module Golf
  class Score
    include Virtus.model

    attribute :participant #Player or Team
    attribute :holes, Array[Integer]
  end
end
