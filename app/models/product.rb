class Product < ApplicationRecord
  has_many :reviews
  acts_as_likeable

  def reviews_new
    reviews.new
  end
end
