class CreateNouns < ActiveRecord::Migration
  def self.up
    create_table :nouns do |t|
      t.string :word
      t.string :article
      t.string :plural
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :nouns
  end
end
