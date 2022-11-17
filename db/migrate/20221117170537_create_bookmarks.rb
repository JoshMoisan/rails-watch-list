class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references  :list, foreign_key: true
      t.references  :movie, foreign_key: true

      t.timestamps
    end
  end
end