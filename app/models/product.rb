# frozen_string_literal: true

class Product < ApplicationRecord
  acts_as_taggable

  searchable do
    text :title, default_boost: 2
    text :description
    text :country
    text :tags do
      tags.map { |tag| tag.name }
    end
    time :created_at
  end

  def tags=(tags)
    self.tag_list = tags
  end
end
