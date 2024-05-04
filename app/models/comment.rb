class Comment < ApplicationRecord
  belongs_to :post
  validates :name, 
            presence: true, 
            length: { minimum: 5, maximum: 100 }
  validates :body, 
            presence: true, 
            length: { minimum: 30, maximum: 250 }
end
