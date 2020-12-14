class CreateAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.belongs_to :question
      t.timestamps
    end
  end
end
