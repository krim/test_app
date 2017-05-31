module Web::PaymentsHelper
  def boolean_badge(value)
    if value
      content_tag(:span, I18n.t('boolean.yes_value'), class: "badge badge-success")
    else
      content_tag(:span, I18n.t('boolean.no_value'), class: "badge badge-danger")
    end
  end
end
