require 'bundler/setup'
require 'virtus'

$:.unshift File.join(__FILE__, '../../lib')
require 'golf'

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
