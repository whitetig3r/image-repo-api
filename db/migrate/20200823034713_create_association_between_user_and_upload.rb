class CreateAssociationBetweenUserAndUpload < ActiveRecord::Migration[6.0]
  def change
    add_reference :uploads, :user, index: true
  end
end
