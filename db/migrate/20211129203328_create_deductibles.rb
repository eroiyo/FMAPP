class CreateDeductibles < ActiveRecord::Migration[6.1]
  def change
    create_table :deductibles do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end

    create_table :categories_deductibles, id: false do |t|
      t.belongs_to :category
      t.belongs_to :deductible
    end
  end
end
