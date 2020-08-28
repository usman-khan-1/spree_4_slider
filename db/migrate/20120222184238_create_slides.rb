class CreateSlides < SpreeExtension::Migration[5.2]
  def change
    create_table :spree_slides do |t|
      t.string :name
      t.string :link_url
      t.boolean :published
      t.integer :position, null: false, default: 0
      t.timestamps
    end
  end
end
