class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    table = :authors

    create_table table do |t|
      t.timestamps
    end

    add_column(table, :identifier, :text, null: false, default: nil)
    add_index(table, :identifier, unique: true)

    add_column(table, :name, :text, null: false, default: nil)
    add_index(table, :name)

    add_column(table, :dob, :date, null: false, default: nil)
    add_index(table, :dob)
  end
end
