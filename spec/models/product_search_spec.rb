# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductSearch, type: :model do
  it { is_expected.to respond_to(:query) }
  it { is_expected.to respond_to(:country) }
  it { is_expected.to respond_to(:min_price) }
  it { is_expected.to respond_to(:max_price) }
  it { is_expected.to respond_to(:price) }
  it { is_expected.to respond_to(:cursor) }

  describe '#search' do
    context 'without any filter' do
      it 'returns all products' do
      end
    end

    context 'with a single filter' do
      context 'country' do
        it 'returns product from that country' do
        end

        it 'does not show products from other countries' do
        end
      end

      context 'query' do
        it 'puts title match at first' do
        end

        it 'show product with keyword on description' do
        end

        it 'show product with keyword on tag' do
        end
      end

      context 'min_price' do
        it 'shows product with the min_price' do
        end

        it 'shows products with price greater than min_price' do
        end

        it 'do not show with price less than min_price' do
        end
      end

      context 'max_price' do
        it 'shows product with the max_price' do
        end

        it 'shows products with price less than max_price' do
        end

        it 'do not show with price greater than max_price' do
        end
      end

      context 'price' do
        it 'show products with that price' do
        end

        it 'do not show products with other prices' do
        end
      end
    end

    context 'with combined filters' do
      it 'combine the results properly' do
      end
    end
  end
end
