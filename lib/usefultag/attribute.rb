# lib/attribute.rb

module Usefultag
  module Attribute
    extend ActiveSupport::Concern

    class_methods do
      def has_many_useful_tags(name)
        class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}
            useful_tag_#{name}
          end

          def #{name}?
            useful_tag_#{name}.present?
          end

          def #{name}=(body)
            {}
          end
        CODE

        has_many :"useful_tag_#{name}", -> { where(name: name) },
          class_name: "Usefultag::Tag", as: :record, inverse_of: :record, autosave: true, dependent: :destroy

      end
    end
  end
end
