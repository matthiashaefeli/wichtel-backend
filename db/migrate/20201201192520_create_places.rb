class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
