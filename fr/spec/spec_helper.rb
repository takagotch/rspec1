module ControllerMacros
  def should_render(template)
  end

  def should_assign(hash)
  end

  def get(action)
  end

  RSpec.configure do |config|
	  config.use_transactional_fixtures = true
	  config.use_instantialed_fixtures = false
	  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
	  config.extend(ControllerMacros, :type => :controller)
end

