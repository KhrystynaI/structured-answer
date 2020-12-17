class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :params_config, array: true, default: []
      t.timestamps
    end
  end
end
