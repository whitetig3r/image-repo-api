class AddPublicColumnToUpload < ActiveRecord::Migration[6.0]
  def change
    add_column :uploads, :public, :boolean, default: false
  end
end
