class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :opendate, presence: true
  validates :address_title, presence: true
  validates :picture_main, presence: true

  def opendate_short
    if opendate.year == Date.today.year
      d = opendate.strftime("%m/%d")
    else
      d = opendate.strftime("%Y/%m/%d")
    end
    w = %w(日 月 火 水 木 金 土)[opendate.wday]
    d+" ("+w+") "+opendate_memo
  end

end
