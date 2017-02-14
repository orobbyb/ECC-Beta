class AddDetailsToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :description, :text
    add_column :documents, :disclaimer, :text
    add_column :documents, :date, :date
    add_column :documents, :organization_url, :string
    add_column :documents, :source_value, :string
    add_column :documents, :source_url, :string
    add_column :documents, :taxonomy, :text
    add_column :documents, :version, :string
  end
end
