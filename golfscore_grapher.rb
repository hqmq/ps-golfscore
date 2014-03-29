require_relative 'config/bootstrap'
class GolfscoreGrapher < ::Sinatra::Base
  get '/courses.json' do
    JSON.generate(DB[:courses].map(&:attributes))
  end

  get '/players.json' do
    JSON.generate(DB[:players].map(&:attributes))
  end

  get '/teams.json' do
    JSON.generate(DB[:teams].map(&:attributes))
  end

  get "/recent_games.json" do
    games = DB[:games].sort_by(&:played_at).reverse[0..9]
    JSON.generate(games.map(&:to_flat_hash))
  end
end
