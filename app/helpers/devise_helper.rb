module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    flash[:errors] = []
    resource.errors.full_messages.map { |msg| flash[:errors] << msg }
    # messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    # sentence = I18n.t('errors.messages.not_saved',
    #                   count: resource.errors.count,
    #                   resource: resource.class.model_name.human.downcase)

    # html = <<-HTML
    # <div id="error_explanation">
    #   <h2>#{sentence}</h2>
    #   <ul>#{messages}</ul>
    # </div>
    # HTML
    # html.html_safe
  end

  def bootstrap_noty(key)
    case key
    when 'alert'
      'warning'
    when 'notice'
      'success'
    else
      key
    end
  end
end
