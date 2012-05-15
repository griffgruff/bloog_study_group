require "bundler/setup"
require_relative 'spec_helper_lite'

require 'active_record'

module SpecHelpers
  def setup_nulldb
    require 'nulldb/rails'
    schema_path = File.expand_path('../db/schema.rb', File.dirname(__FILE__))
    # NullDB.nullify(:adapter => :nulldb, :schema => schema_path)
    ActiveRecord::Base.establish_connection(:adapter => :nulldb, :schema => schema_path)
  end

  def teardown_nulldb
    # NullDB.restore
    spec_path = File.expand_path('../config/database.yml', File.dirname(__FILE__))
    spec = YAML.load_file(spec_path)
    ActiveRecord::Base.establish_connection(spec['test'])
  end
end
