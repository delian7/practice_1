# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    scope :search, ->(query) { where('name LIKE ?', "%#{query}%") }
  end

  class_methods do
    def search(query)
      where('name LIKE ?', "%#{query}%")
    end
  end
end
