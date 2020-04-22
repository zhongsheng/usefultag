# lib/attribute.rb

module Usefultag
  module Attribute
    extend ActiveSupport::Concern

    class_methods do
      def all_tags(name)
        Usefultag::Tag.select('count(id) as total, tag_name').group(:tag_name).where(name: name, record_type: self.name)
      end

      def has_many_useful_tags(name)
        class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}
            useful_tag_#{name}
          end

          def #{name}?
            useful_tag_#{name}.present?
          end

          def #{name}=(body)
            self.#{name}.delete_all
            self.#{name}.new(body.uniq.compact.select{ |tag_name| tag_name.size > 0 }.map{|tag_name| {name: '#{name}', tag_name: tag_name} })
          end
        CODE

        has_many :"useful_tag_#{name}", -> { where(name: name) },
          class_name: "Usefultag::Tag", as: :record, inverse_of: :record, autosave: true, dependent: :destroy

      end
    end
  end
end
