class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, 
            presence: true, 
            length: { minimum: 5, maximum: 100 }
            # uniqueness: { case_sensitive: false }

  validates :body, 
            presence: true, 
            length: { minimum: 30, maximum: 3000 }
end
