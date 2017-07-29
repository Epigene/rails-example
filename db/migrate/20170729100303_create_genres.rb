class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    table = :genres

    create_table table do |t|
      t.timestamps
    end

    add_column(table, :identifier, :text, null: false)
    add_index(table, :identifier, unique: true)
  end
end
