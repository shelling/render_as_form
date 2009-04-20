module ActionView
  module Render
    module From

      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::DateHelper

      TypeMapper = {
        :integer  => :text_field,
        :string   => :text_field,
        :text     => :text_area,
        :datetime => :datetime_select,
      }
  

      def render_as_form(ar_instance, options = {})
        res = String.new
        
        obj = ar_instance.class.to_s.downcase.to_sym

        ar_instance.class.columns.each do |c|

          next if c.name =~ /(id|created_at)/

          res.concat "<label>#{c.name}</label><br>"

          res.concat self.send TypeMapper[c.type], obj, c.name.to_sym, { :class => obj.to_s + "-" + c.name }

          res = "<p>" + res + "</p>"

        end
        
        res.concat submit_tag "submit"

        "<form>" + res + "</form>"
      end

    end
  end
end

module ActiveRecord
  module Render
    module Form
    end
  end
end
