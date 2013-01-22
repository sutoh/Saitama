class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name
      t.string :validity_term
      t.text :publisher
      t.text :note

      t.timestamps
    end
  end
end
