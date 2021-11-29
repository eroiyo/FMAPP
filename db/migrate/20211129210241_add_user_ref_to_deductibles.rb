class AddUserRefToDeductibles < ActiveRecord::Migration[6.1]
  def change
    add_reference :deductibles, :user, null: false, foreign_key: true
  end
end
