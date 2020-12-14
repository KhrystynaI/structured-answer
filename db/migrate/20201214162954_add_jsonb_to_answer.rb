class AddJsonbToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :config, :jsonb, null: false, default: '{}'
    add_index  :answers, :config, using: :gin
  end
end
