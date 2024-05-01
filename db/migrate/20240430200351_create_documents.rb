class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents, id: :uuid do |t|
      t.string :pdf_url
      t.string :description
       t.references :customer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
