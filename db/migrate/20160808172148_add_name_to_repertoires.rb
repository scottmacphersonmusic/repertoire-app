class AddNameToRepertoires < ActiveRecord::Migration
  def change
    add_column :repertoires, :name, :string
  end
end
