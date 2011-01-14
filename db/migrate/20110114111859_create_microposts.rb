class CreateMicroposts < ActiveRecord::Migration
  def self.up
    create_table :microposts do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
    add_index :microposts, :user_id
    add_index :microposts, :location_id
  end

  def self.down
    drop_table :microposts
  end
end
