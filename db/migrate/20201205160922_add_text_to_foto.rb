class AddTextToFoto < ActiveRecord::Migration[6.0]
  def change
    add_column :fotos, :text, :string
  end
end
