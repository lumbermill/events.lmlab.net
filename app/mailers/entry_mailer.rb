class EntryMailer < ActionMailer::Base
  default from: "no-reply@lmlab.net"

  def confirm(entry)
    # 申込者に確認
    @name = entry.name
    @event = entry.event
    from = @event.user.email
    mail to: entry.email,from: from, subject: "[360 board]お申込み受付"
  end

  def notify(entry)
    # 主催者に確認
    @event = entry.event
    to = @event.user.email
    mail to: to, subject: "[360 board] #{@event.title} への申込み"
  end

end
