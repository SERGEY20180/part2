class AddPictureToPages < ActiveRecord::Migration
  def change
    add_column :pages, :picture, :string
  end
end
