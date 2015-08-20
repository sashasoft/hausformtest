class CreateKarkasdoms < ActiveRecord::Migration
  def change
    create_table :karkasdoms do |t|

      t.string :name
      t.decimal :price
      t.string :label

      t.timestamps
    end
  end
end
