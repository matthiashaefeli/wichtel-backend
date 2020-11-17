class CreateFotos < ActiveRecord::Migration[6.0]
  def change
    create_table :fotos do |t|

      t.timestamps
    end
  end
end
