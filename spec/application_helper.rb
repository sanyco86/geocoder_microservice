require 'spec_helper'

ENV['RACK_ENV'] ||= 'test'

require_relative '../config/environment'

abort("The Rake environment is running in production mode!") if Application.environment == :production

Dir[Application.root.concat('/spec/support/**/*.rb')].sort.each { |f| require f }
