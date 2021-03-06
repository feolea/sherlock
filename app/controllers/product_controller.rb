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
      .permit(:query, :country, :sort_by, :order, :per_page, :min_price, :max_price, :price)
      .merge({ page: params[:page] })
  end
end
