class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :recommended

      t.timestamps
    end
    add_index :recommends, :user_id
    add_index :recommends, :post_id
  end
end
