class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    table = :books

    create_table table do |t|
      t.timestamps
    end

    add_column(table, :identifier, :text, null: false, default: nil)
    add_index(table, :identifier, unique: true)

    add_column(table, :publisher_id, :integer, null: false)
    add_index(table, :publisher_id)

    add_column(table, :author_id, :integer, null: false)
    add_index(table, :author_id)

    add_column(table, :title, :text, null: false)
    add_index(table, :title)

    add_column(table, :published_on, :date, null: false)
    add_index(table, :published_on)
  end
end
