class CreateBookgenres < ActiveRecord::Migration[5.0]
  def change
    create_table :bookgenres do |t|
      t.references :books
      t.references :genres

      t.timestamps
    end
  end
end
