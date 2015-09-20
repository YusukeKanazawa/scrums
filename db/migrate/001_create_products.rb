class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :content
      t.string :project
      t.integer :priority
      t.double :estimate
      t.int :sprint
    end
  end
end
