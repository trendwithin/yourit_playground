ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/pride'
require 'minitest/rails/capybara'
require 'minitest/reporters'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    within(:css, 'div.actions') { click_button 'Log in' }
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions

  def teardown
    Capybara.reset_sessions!
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
