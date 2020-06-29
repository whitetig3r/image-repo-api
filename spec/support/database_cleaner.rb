RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    DatabaseCleaner.start
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end