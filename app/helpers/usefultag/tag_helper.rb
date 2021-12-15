require "active_support/core_ext/object/try"
require "action_view/helpers/tags/placeholderable"

module Usefultag
  module TagHelper
    cattr_accessor(:id, instance_accessor: false) { 0 }

    def useful_tags(object, name, value = [], options = {})
      # render(:par)

      pp options
      content_tag(:div, options) do
      render(
        partial: 'usefultag/tags',
        locals: {
          all_tags: object.class.all_tags(name, scope: options['scope']),
          tags: value,
          options: options,
          input_name: "#{options['name']}[]" }
            )
      end
      # binding.pry
      # options = options.symbolize_keys

      # options[:class] ||= "useful-tags"

      # input_tag = hidden_field_tag(name, value, id: options[:input])

      # input_tag
    end
  end
end


module ActionView::Helpers
  class Tags::Usefultag < Tags::Base
    include Tags::Placeholderable

    delegate :dom_id, to: ActionView::RecordIdentifier

    def render
      options = @options.stringify_keys
      add_default_name_and_id(options)
      options["id"] = dom_id(object, [options["id"], :useful_tag].compact.join("_")) \
        if object

      @template_object.useful_tags(object, @method_name, value, options)
    end
  end

  module FormHelper
    def useful_tags_field(object_name, method, options = {})
      Tags::Usefultag.new(object_name, method, self, options).render
    end
  end

  class FormBuilder
    def useful_tags_field(method, options = {})
      @template.useful_tags_field(@object_name, method, objectify_options(options))
    end
  end
end
