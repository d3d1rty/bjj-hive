# frozen_string_literal: true

##
# = LayoutHelper
# Author::    Richard Davis
#
# This helper module provides methods for use in layouts.
module LayoutHelper
  def title(page_title)
    content_for :title, I18n.t('app_title', page_title: page_title)
  end

  def description(description)
    content_for :description, description
  end
end
