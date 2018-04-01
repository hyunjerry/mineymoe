class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :a, default: 0
      t.integer :b, default: 0
      t.string :user_name
      t.integer :total, default: 0
      t.string :a_url, default: ""
      t.string :b_url, default: ""

      t.timestamps
    end
  end
end
