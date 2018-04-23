# frozen_string_literal: true

module ApplicationHelper
  # 判断给定字符串是否为单数
  def singular?(str)
    str.pluralize != str && str.singularize == str
  end

  def local_time(time)
    time.strftime('%Y-%m-%d %H:%M:%S') if time.is_a?(Time)
  end
end
