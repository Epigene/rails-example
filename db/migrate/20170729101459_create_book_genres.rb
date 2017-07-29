class CreateBookGenres < ActiveRecord::Migration[5.1]
  def change
    table = :book_genres

    create_table table do |t|
      t.timestamps
    end

    add_column(table, :book_id, :integer, null: false)
    add_index(table, :book_id)

    add_column(table, :genre_id, :integer, null: false)
    add_index(table, :genre_id)

    # compound index to disallow one book to have several of the same genre
    add_index(table, [:book_id, :genre_id], unique: true)
  end
end
