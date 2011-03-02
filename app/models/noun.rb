class Noun < ActiveRecord::Base
  validates_presence_of :article
  validates_presence_of :word
  validates_presence_of :translation
  validates_presence_of :plural


  # random fuctionality snippet
  def self.find(*args)
    if args.first.to_s == "random"
      ids = connection.select_all("SELECT id FROM nouns")
      super(ids[rand(ids.length)]["id"].to_i)
    else
      super
    end
  end
  # end of random snippet

end
