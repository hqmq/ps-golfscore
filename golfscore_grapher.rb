require_relative 'config/bootstrap'
class GolfscoreGrapher < ::Sinatra::Base
  get '/' do
    JSON.generate(DB[:courses].map(&:name))
  end
end
