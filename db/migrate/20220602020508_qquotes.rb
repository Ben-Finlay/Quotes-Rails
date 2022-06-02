class Qquotes < ActiveRecord::Migration[6.1]
  def change
    create_table :qquotes do |t|
      t.string :author
      t.text :quote


      t.timestamps
    end
  end
end