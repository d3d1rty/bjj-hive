# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, _object|
  field = Nokogiri::HTML(html_tag)
  field.search('input').add_class(' field_with_errors')
  field.search('select').add_class(' field_with_errors')
  field.search('textarea').add_class(' field_with_errors')
  field.search('label').add_class(' field_with_errors')
  field.to_s.html_safe
end
