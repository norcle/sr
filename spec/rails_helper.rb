require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
Rails.application.load_seed # loading seeds

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
    Rails.application.load_seed
  end

  config.before(:suite) do
    Rails.application.load_seed # loading seeds
  end

  config.before(:each) do
    Parser::Fonbet::Event::Entity.clear_cache
    Parser::Fonbet::League.clear_cache
    Parser::Fonbet::Team.clear_cache
    Parser::Fonbet::Factor::Custom::Base.clear_cache
    Parser::Fonbet::Factor::Misc.clear_cache
  end
end
