require_relative 'config/bootstrap'

namespace :import do
  desc "import data from snapshot"
  task :snapshot, [:snapshot_path] do |t, args|
    require 'time'
    snapshot = JSON.parse(File.read(args[:snapshot_path]))
    DB.transaction do
      DB[:courses] = snapshot['courses'].map do |course_snapshot|
        Golf::Course.new(course_snapshot)
      end

      DB[:players] = snapshot['players'].map do |player_snapshot|
        Golf::Player.new(player_snapshot)
      end

      DB[:teams] = snapshot['teams'].map do |team_snapshot|
        players = DB[:players].select{|p| team_snapshot['player_ids'].include?(p.id) }
        team_snapshot.delete('player_ids')
        team_snapshot[:players] = players
        Golf::Team.new(team_snapshot)
      end

      hole_keys = ["hole01", "hole02", "hole03", "hole04", "hole05", "hole06", "hole07", "hole08", "hole09", "hole10", "hole11", "hole12", "hole13", "hole14", "hole15", "hole16", "hole17", "hole18"]
      DB[:games] = snapshot['games'].map do |game_snapshot|
        course = DB[:courses].select{|c| c.id == game_snapshot['course_id'].to_i}.first
        scores = game_snapshot['scores'].map do |score_snapshot|
          player = DB[:players].select{|p| p.id == score_snapshot['player_id'].to_i}.first
          holes = score_snapshot.values_at(*hole_keys).compact
          Golf::Score.new(:player => player, :holes => holes)
        end

        attrs = game_snapshot.merge("scores" => scores, "course" => course)
        attrs.delete("teams")
        attrs.delete("course_id")
        attrs.delete("num_holes")
        game = Golf::Game.new(attrs)
        scores.each{|s| s.game = game}
        game
      end
    end
  end
end
