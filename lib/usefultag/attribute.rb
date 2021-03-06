# lib/attribute.rb

module Usefultag
  module Attribute
    extend ActiveSupport::Concern

    class_methods do
      def all_tags(name, scope: nil)
        Usefultag::Tag.select('count(id) as total, tag_name')
          .group(:tag_name)
          .where(name: name, record_type: self.name, scope: scope)
      end

      def has_many_useful_tags(name, scope: :nil)
          class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}
            useful_tag_#{name}
          end

          def #{name}_array
            useful_tag_#{name}.map(&:tag_name)
          end

          def #{name}_str(delimiter=',')
            useful_tag_#{name}.map(&:tag_name).join(delimiter)
          end

          def #{name}?
            useful_tag_#{name}.present?
          end

          def #{name}=(body)
            self.#{name}.delete_all
            self.#{name}.new(body.uniq.compact.select{ |tag_name| tag_name.size > 0 }.map{|tag_name| {name: '#{name}', scope: #{scope}, tag_name: tag_name} })
          end
        CODE

        if scope == :nil
          has_many :"useful_tag_#{name}", -> { where(name: name) },
            class_name: "Usefultag::Tag", as: :record, inverse_of: :record, autosave: true, dependent: :destroy
        else

          has_many :"useful_tag_#{name}", ->(record) { where(name: name, scope: record.send(scope.to_sym).to_s) },
            class_name: "Usefultag::Tag", as: :record, inverse_of: :record, autosave: true, dependent: :destroy

        end
      end
    end
  end
end
