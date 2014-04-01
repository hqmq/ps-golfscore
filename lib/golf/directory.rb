module Golf
  class Directory
    def initialize
      @players = {}
    end

    def add(player)
      raise DuplicateRecord.new("We already have a player with id = #{player.id}") if players[player.id]
      players[player.id] = player
    end

    def count
      players.count
    end

    private
    attr_reader :players
  end
end
