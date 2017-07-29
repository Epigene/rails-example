class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    table = :publishers

    create_table table do |t|
      t.timestamps
    end

    add_column(table, :name, :text, null: false, default: nil)
    add_index(table, :name, unique: true)
  end
end
