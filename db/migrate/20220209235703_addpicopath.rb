class Addpicopath < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :pico_path, :string
  end
end
