class CreateFreebies < ActiveRecord::Migration[6.1]
  def change
    create_table :freebies do |t|
      t.string :item_name
      t.integer :value
      # VVV What makes this a JOIN table
      # t.integer :dev_id
      # t.integer :company_id
      # New way?
      t.belongs_to :dev
      t.belongs_to :company
    end
  end
end
