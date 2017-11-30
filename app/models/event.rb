class Event < ActiveRecord::Base
  belongs_to :user
  has_many :entries
  validates :title, presence: true
  validates :opendate, presence: true
  validates :address_title, presence: true
  #validates :picture_main, presence: true

  def opendate_short
    if opendate.year == Date.today.year
      d = opendate.strftime("%m/%d")
    else
      d = opendate.strftime("%Y/%m/%d")
    end
    w = %w(日 月 火 水 木 金 土)[opendate.wday]
    d+" ("+w+") "+(opendate_memo == nil ? "" : opendate_memo)
  end

  def limit_short
    return "なし" if limit == nil || limit == 0
    return "#{limit} 名"
  end

  def fee_short
    return "無料" if fee.nil? || fee <= 0
    return "#{fee} 円"
  end

  def ended?
    opendate < Date.today
  end

  def full?
    return false if limit.nil? || limit <= 0
    return entries.active.count >= limit
  end

  def address_title_with_url
    return address_title unless address_url
    if address_url.start_with? "http"
      u = address_url
    else
      u = "https://places.lmlab.net/#{address_url}/access"
    end
    return "<a href='#{u}' target='_blank'>#{address_title}</a>".html_safe
  end
end
