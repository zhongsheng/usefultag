
require "rails/engine"
require 'usefultag'

module Usefultag
  class Engine < ::Rails::Engine
    isolate_namespace Usefultag

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
