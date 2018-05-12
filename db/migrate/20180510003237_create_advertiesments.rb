class CreateAdvertiesments < ActiveRecord::Migration[5.2]
  def change
    create_table :advertiesments do |t|
      t.string :title
      t.text :copy
      t.integer :price

      t.timestamps
    end
  end
end
