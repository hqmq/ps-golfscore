module Golf
  class Score
    include Virtus.model

    attribute :player, Player
    attribute :game, Game
    attribute :holes, Array[Integer]
  end
end
