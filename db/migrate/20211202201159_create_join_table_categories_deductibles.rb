class CreateJoinTableCategoriesDeductibles < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :deductibles do |t|
      # t.index [:category_id, :deductible_id]
      # t.index [:deductible_id, :category_id]
    end
  end
end
