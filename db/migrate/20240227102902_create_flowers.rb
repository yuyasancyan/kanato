class CreateFlowers < ActiveRecord::Migration[6.1]
  def change
    create_table :flowers do |t|
      t.text :hana
      t.string :photo
      t.string :name
      t.integer :overall

      t.timestamps
    end
  end
end
