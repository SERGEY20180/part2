class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :page, index: true
      t.timestamps null: false
    end
  end
end
