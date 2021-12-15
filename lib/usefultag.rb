require "usefultag/version"
require "usefultag/engine"
require "usefultag/attribute"

module Usefultag
  extend ActiveSupport::Autoload

  autoload :Attribute

  mattr_accessor :main_app_path, :main_controller
  Usefultag.main_app_path ||= '/'
  Usefultag.main_controller ||= '::ApplicationController'
  def self.main_controller
    @@main_controller.constantize
  end
end
