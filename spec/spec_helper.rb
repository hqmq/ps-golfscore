require 'bundler/setup'
require 'rspec'

$:.unshift File.join(__FILE__, '../../lib')
require 'golf'

RSpec.configure do |c|
  c.order = :rand
  c.color = true
end
