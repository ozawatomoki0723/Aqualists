class CreateQphotos < ActiveRecord::Migration[5.2]
  def change
    create_table :qphotos do |t|

    	t.string :image, null: false
    	t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
