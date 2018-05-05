# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Dynamic require custome modules and class
# Dir[Rails.root.join('lib/**/*.rb')].each { |f| require f }
