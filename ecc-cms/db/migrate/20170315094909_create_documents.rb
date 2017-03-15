class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :year
      t.string :institution
      t.string :contributor
      t.string :code_versions
      t.date :date_publish
      t.date :ecc_date
      t.string :author_site
      t.string :orig_url
      t.text :description
      t.text :notes
      t.string :doi
      t.text :copyright
      t.text :topics
      t.text :fields
      t.string :backup_url

      t.timestamps
    end
  end
end
