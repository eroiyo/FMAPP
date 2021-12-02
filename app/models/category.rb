class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true
  validate :acceptable_image

  has_one_attached :icon
  belongs_to :user
  has_and_belongs_to_many :deductibles

  def acceptable_image
    return unless icon.attached?

    errors.add(:icon, 'is too big') unless icon.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:icon, 'must be a JPEG or PNG') unless acceptable_types.include?(icon.content_type)
  end

  def total
    deductibles.sum('amount')
  end
end
