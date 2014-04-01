module Golf
  class Directory
    def initialize
      @players = {}
    end

    def add(player)
      raise DuplicateRecord.new("We already have a player with id = #{player.id}") if players[player.id]
      if player.respond_to?(:players)
        player.players.each do |p|
          add(p) rescue DuplicateRecord
        end
      end
      players[player.id] = player
    end

    def count
      players.count
    end

    def find_by_id(id)
      players.fetch(id){ raise UnknownRecord.new("no such record for #{id}") }
    end

    private
    attr_reader :players
  end
end
