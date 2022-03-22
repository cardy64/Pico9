class CreateConcepts < ActiveRecord::Migration[7.0]
  def change
    create_table :concepts do |t|
      t.integer :concept_id
      t.integer :stars
      t.string :url
      t.text :why
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
