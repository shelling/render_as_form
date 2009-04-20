$:.unshift File.dirname(__FILE__) + "/lib/"

require "render_as_form"

ActionView::Base.send :include, ActionView::Render::From
ActiveRecord::Base.send :include, ActiveRecord::Render::Form
