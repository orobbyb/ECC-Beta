json.extract! document, :id, :title, :year, :institution, :contributor, :code_versions, :date_publish, :ecc_date, :author_site, :orig_url, :description, :notes, :doi, :copyright, :topics, :fields, :backup_url, :created_at, :updated_at
json.url document_url(document, format: :json)