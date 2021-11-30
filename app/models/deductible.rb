class Deductible < ApplicationRecord
    validates :icon, presence: true
    validates :name, :amount, :categories, presence: true, length: { maximum: 100 }
    validates :amount, numericality: { greater_than: 0 }
  
    has_one_attached :icon
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :categories
end
