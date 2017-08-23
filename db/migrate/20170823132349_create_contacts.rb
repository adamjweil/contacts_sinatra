class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, NULL: false
      t.string :last_name, NULL: false
      t.string :email, NULL: false

      t.timestamps
    end
  end
end
