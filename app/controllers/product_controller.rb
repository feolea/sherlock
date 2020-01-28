# frozen_string_literal: true

class ProductController < ApplicationController
  def index
    @search = ProductSearch.new(search_params)

    @products = @search.search
  end

  private

  def search_params
    return {} unless params[:search]

    params
      .require(:search)
      .permit(:query, :country, :page, :per_page, :min_price, :max_price, :price)
  end
end
