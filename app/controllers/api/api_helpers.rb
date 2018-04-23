require 'digest/md5'
require 'cgi'
module ApiHelpers
  def current_visitor
    if @current_visitor.nil?
      token_str = headers['Authorization']
      return @current_visitor = false if token_str.blank?
      token_str = token_str.sub(/^Bearer /, '')
      data = begin
               JWT.decode(token_str, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')[0]
             rescue StandardError
               nil
             end
      if data
        @current_visitor = Visitor.find_by(uid: data['openid'])
        @current_visitor.session_key = data['session_key']
      end
    end
    @current_visitor
  end

  def encode_visitor_token(openid:, session_key:)
    JWT.encode({ openid: openid, session_key: session_key }, ENV['SECRET_KEY_BASE'], 'HS256')
  end

  def error!(msg, *args)
    if msg.is_a?(ActiveModel::Errors)
      super({ error: msg.as_json, error_message: msg.full_messages.join(', ') }, *args)
    elsif msg.is_a?(String)
      super({ error: msg, error_message: msg }, *args)
    else
      super
    end
  end

  def get_signature(options)
    str = options.sort.map { |item| item.join('=') }.join('&')
    # options = options.symbolize_keys
    # str = options.keys.sort.reduce("") do |s, k|
    #   s = "#{s}&" unless s.empty?
    #   "#{s}#{k}=#{CGI.escape(options[k].to_s)}"
    # end
    Digest::MD5.hexdigest("#{str}&key=#{ENV['WECHAT_MCH_SECRET']}").upcase
  end

  # 验证用户
  def authenticate!
    error!({ error: '身份验证失败' }, 401) unless current_visitor
  end

  # 分页数据
  def paginate_collection(collection, params)
    collection.page(params[:_page]).per(params[:_per_page])
  end

  # 生产分页数据的JSON
  def wrap_collection(collection, with_entity, options = {})
    present meta: {
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
    present :data, collection, options.merge(with: with_entity)
  end

  # 用_sortable中的参数对集合排序
  def sort_collection(collection)
    params[:_sort] ? collection.order(params[:_sort].value) : collection
  end
end
