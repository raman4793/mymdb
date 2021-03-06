class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, foreign_key: true
      t.references :sendable, polymorphic: true

      t.timestamps
    end
  end
end
