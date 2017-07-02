class AddTitleToRegisteredApplication < ActiveRecord::Migration
  def change
    add_column :registered_applications, :title, :string
  end
end
