#require 'airborne_report'
require "rspec/expectations"
require 'allure-rspec'

RSpec.configure do |config|
  config.before(:each) do
    @before_each = "before each"
    print "before each global config\n"
  end
  config.before(:all) do
    @before_all = "before all"
    print "before all global config\n"

  end

  config.include AllureRSpec::Adaptor
end

AllureRSpec.configure do |c|
  #c.output_dir = "/whatever/you/like" # default: gen/allure-results
  c.clean_dir = false # clean the output directory first? (default: true)
  c.logging_level = Logger::DEBUG # logging level (default: DEBUG)
end