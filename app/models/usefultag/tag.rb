module Usefultag
  class Tag < ActiveRecord::Base
    self.table_name = "userful_tags"

    belongs_to :record, polymorphic: true, touch: true
  end
end
ActiveSupport.run_load_hooks :useful_tag, Usefultag::Tag
