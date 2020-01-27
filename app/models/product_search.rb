# frozen_string_literal: true

class ProductSearch
  include ActiveModel::Model

  attr_accessor :query, :country, :cursor
  attr_accessor :min_price, :max_price, :price

  def search
    filter
    paginate
    index.execute
    index.results
  end

  private

  def index
    @index ||= Sunspot.new_search(Product)
  end

  def filter
    country_filter
    price_filter
    query_filter
  end

  def country_filter
    index.build { with(:country, country) } if country.present?
  end

  def paginate
    index.build { paginate cursor: cursor.present? ? cursor : '*' }
  end

  def price_filter
    index.build { with(:price).greater_than_or_equal_to(min_price) } if min_price.present?
    index.build { with(:price).less_than_or_equal_to(max_price) } if max_price.present?
    index.build { with(:price, price) } if price.present?
  end

  def query_filter
    index.build { fulltext query } if query.present?
  end
end
