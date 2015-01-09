ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require_relative '../lib/namie'

include Namie

require 'coveralls'
Coveralls.wear!
