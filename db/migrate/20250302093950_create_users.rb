class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :introduction
      t.string :icon_img

      t.timestamps
    end
  end
end
