module Golf
  class Score
    include Virtus.model

    attribute :participant #Player or Team
    attribute :holes, Array[Integer]

    def total
      holes.inject(0){ |sum, hole| sum + hole }
    end
  end
end
