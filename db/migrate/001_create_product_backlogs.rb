class CreateProductBacklogs < ActiveRecord::Migration
  def change
    create_table :product_backlogs do |t|
      t.integer :project_id
      t.string :content
      t.integer :status
      t.integer :priority
      t.float :estimate
    end
  end
end
