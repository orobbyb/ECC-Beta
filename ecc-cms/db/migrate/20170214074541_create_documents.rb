class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.text :description
      t.text :disclaimer
      t.date :date
      t.string :organization_url
      t.string :source_value
      t.string :source_url
      t.text :taxonomy
      t.string :version

      t.timestamps
    end
  end
end
