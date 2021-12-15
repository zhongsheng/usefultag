
require "rails/engine"
require 'usefultag'

module Usefultag
  class Engine < Rails::Engine
    isolate_namespace Usefultag

    config.eager_load_namespaces << Usefultag
    config.autoload_once_paths = %W(
      #{root}/app/channels
      #{root}/app/controllers
      #{root}/app/controllers/concerns
      #{root}/app/helpers
      #{root}/app/models
      #{root}/app/models/concerns
      #{root}/app/jobs
    )

    initializer "usefultag.attribute" do
      ActiveSupport.on_load(:active_record) do
        include Usefultag::Attribute
      end
    end
    initializer "usefultag.helper",  before: :load_config_initializers do
      ActiveSupport.on_load(:action_controller_base) do
        helper Usefultag::Engine.helpers
      end
    end

  end
end
