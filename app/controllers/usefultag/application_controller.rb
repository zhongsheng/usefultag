module Usefultag
  class ApplicationController < Usefultag.main_controller
    protect_from_forgery with: :exception
  end
end
