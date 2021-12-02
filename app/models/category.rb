class Category < ApplicationRecord
    validates :name, presence: true, length: { maximum: 100 }
    validates :icon, presence: true

    has_one_attached :icon
    belongs_to :user
    has_and_belongs_to_many :deals
  
    def total
      deals.sum('amount')
    end
  end