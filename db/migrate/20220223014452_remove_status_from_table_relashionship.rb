class RemoveStatusFromTableRelashionship < ActiveRecord::Migration[6.0]
  def change
    remove_column :relationships, :status, :boolean
  end
end
