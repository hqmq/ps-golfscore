require_relative 'config/bootstrap'

namespace :import do
  desc "import data from snapshot"
  task :snapshot, [:snapshot_path] do |t, args|
    require 'time'
    snapshot = JSON.parse(File.read(args[:snapshot_path]))
    DB.transaction do
      DB[:courses] = snapshot['courses'].map do |course_snapshot|
        Course.new(course_snapshot)
      end

      DB[:players] = snapshot['players'].map do |player_snapshot|
        Player.new(player_snapshot)
      end

      DB[:teams] = snapshot['teams'].map do |team_snapshot|
        players = DB[:players].select{|p| team_snapshot['player_ids'].include?(p.id) }
        team_snapshot.delete('player_ids')
        team_snapshot[:players] = players
        Team.new(team_snapshot)
      end
    end
  end
end
