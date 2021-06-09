class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.text :summary
      t.float :audience_rating
      t.string :release_date


      t.timestamps
    end
  end
end
