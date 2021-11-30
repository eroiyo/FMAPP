class Deductible < ApplicationRecord
    belongs_to :user
    belongs_to :categories
    has_one_attached :icon
    validates :icon, presence: true
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
    validates :name, presence: true
end
