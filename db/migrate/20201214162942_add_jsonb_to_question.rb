class AddJsonbToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :config, :jsonb, null: false, default: '{}'
    add_index  :questions, :config, using: :gin
  end
end
