class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.integer :post_id
      t.integer :user_id
      t.timestamps
    end
  end
end
