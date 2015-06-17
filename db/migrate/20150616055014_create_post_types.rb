class CreatePostTypes < ActiveRecord::Migration
  def change
    create_table :post_types do |t|
    	t.string :category
      t.timestamps
    end
  end
end
