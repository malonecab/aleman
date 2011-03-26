class Noun < ActiveRecord::Base
  validates_presence_of :article
  validates_presence_of :word
  validates_presence_of :translation
  validates_presence_of :plural

  validates_uniqueness_of :word


  # random fuctionality snippet
  def self.find(*args)
    if args.first.to_s == "random"
        sql = "SELECT id FROM nouns"

        if args.second.is_a?(Array)
             sql << " where id NOT IN (" + args.second.join(",") + ")"
         end
      ids = connection.select_all(sql)
        puts sql
      super(ids[random(ids.length)]["id"].to_i)
    else
      super
    end
  end
  # end of random snippet

end
