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
             condition = args.second.to_s.gsub("[","(")
             condition = condition.gsub("]",")")
             sql << " where id NOT IN " + condition
        end
      ids = connection.select_all(sql)
      super(ids[rand(ids.length)]["id"].to_i)
    else
      super
    end
  end
  # end of random snippet

end
