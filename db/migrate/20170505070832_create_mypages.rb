class CreateMypages < ActiveRecord::Migration
  def change
    create_table :mypages do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
