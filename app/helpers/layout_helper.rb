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

  def content_wrapper(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "ContentWrapper#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def container(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Container#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def ribbon(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Ribbon#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def paginator(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Paginator#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_deck(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "CardDeck#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Card#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_header(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Card__header#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_body(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Card__body#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_footer(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Card__footer#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_title(title, id: nil, modifier: nil, classes: nil)
    tag.h1 title, id: (id unless id.blank?), class: "Card__title#{merge_mod_and_classes(modifier, classes)}"
  end

  def card_header_text(id: nil, modifier: nil, classes: nil, &block)
    tag.p id: (id unless id.blank?), class: "Card__header-text#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_body_text(id: nil, modifier: nil, classes: nil, &block)
    tag.p id: (id unless id.blank?), class: "Card__body-text#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def card_footer_text(id: nil, modifier: nil, classes: nil, &block)
    tag.p id: (id unless id.blank?), class: "Card__footer-text#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def form_group(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Form__group#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def form_action(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Form__action#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def hero(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "Hero#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def hero_headline(headline, id: nil, modifier: nil, classes: nil)
    tag.h1 headline, id: (id unless id.blank?), class: "Hero__headline#{merge_mod_and_classes(modifier, classes)}"
  end

  def hero_lede(id: nil, modifier: nil, classes: nil, &block)
    tag.p id: (id unless id.blank?), class: "Hero__lede#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def info_box(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "InfoBox#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def info_box_group(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "InfoBox__group#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def info_box_label(text, id: nil, modifier: nil, classes: nil)
    tag.span text, id: (id unless id.blank?), class: "InfoBox__label#{merge_mod_and_classes(modifier, classes)}" 
  end

  def info_box_content(id: nil, modifier: nil, classes: nil, &block)
    tag.div id: (id unless id.blank?), class: "InfoBox__content#{merge_mod_and_classes(modifier, classes)}" do
      yield
    end
  end

  def merge_mod_and_classes(modifier, classes)
    merge_modifier(modifier).to_s + merge_classes(classes).to_s
  end

  def merge_modifier(modifier)
    '--' + modifier if modifier.present?
  end

  def merge_classes(classes)
    ' ' + classes if classes.present?
  end
end
