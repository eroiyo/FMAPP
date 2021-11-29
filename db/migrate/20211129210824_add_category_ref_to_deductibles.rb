class AddCategoryRefToDeductibles < ActiveRecord::Migration[6.1]
  def change
    add_reference :deductibles, :category, null: false, foreign_key: true
  end
end
