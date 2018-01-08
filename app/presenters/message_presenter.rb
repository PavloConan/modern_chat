class MessagePresenter < SimpleDelegator

  def time_formatted
    if created_at > Time.now - 24.hours
      I18n.l(created_at, format: :short)
    else
      I18n.l(created_at, format: :long)
    end
  end

end
