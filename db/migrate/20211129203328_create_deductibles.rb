class CreateDeductibles < ActiveRecord::Migration[6.1]
  def change
    create_table :deductibles do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
