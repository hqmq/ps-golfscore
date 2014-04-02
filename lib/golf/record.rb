module Golf
  class Record
    attr_reader :score, :game
    include Comparable

    def initialize(score, game)
      @score = score
      @game = game
    end

    def player
      score.participant
    end

    def total
      score.total
    end

    def <=>(other)
      game.played_at <=> other.game.played_at
    end
  end
end
