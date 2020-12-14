class CreateQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.belongs_to :category
      t.text :body
      t.string :title
      t.timestamps
    end
  end
end
