require 'bundler/setup'
require 'virtus'
require_relative '../lib/golf/course'
require_relative '../lib/golf/course_catalog'
require_relative '../lib/golf/player'

require 'sinatra/base'
require 'json'
require 'pstore'

DB = PStore.new("tmp/golfscore_grapher.pstore", true)

class DbTransactionMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    DB.transaction do
      @app.call(env)
    end
  end
end
