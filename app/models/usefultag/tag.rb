module Usefultag
  class Tag < ActiveRecord::Base
    self.table_name = "userful_tags"

    belongs_to :record, polymorphic: true, touch: true

    def body=(tags)
    end

    class << self
      def all_types
        select('count(id) as total, record_type').group('record_type')
      end

      def all_name_with_type(type)
        select('count(id) as total, name, record_type').group('name', 'record_type').where(record_type: type)
      end

    end

  end
end
ActiveSupport.run_load_hooks :useful_tag, Usefultag::Tag
