class Api::BaseController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user!
  before_action :write_params, expect: [:debug]

  def debug
    skip_authorization
    data = [{ hello: 'world!' }]
    render wx: wx(data)
  end

  def login
    skip_authorization
    data = jscode2session(query_params)
    # data = {"session_key"=>"CP2CSDZIhgDPxT3xsGBzmQ==", "openid"=>"oNWgu5Wm1C1UxLDU1dpPr-H58qQQ"}
    result = {}
    if data['openid'] && data['session_key']
      visitor = Visitor.find_or_create_by!(uid: data['openid'])
      visitor.update!(token: data['session_key'], nick_name: params[:nick_name])
      result = { result: 'success', data: { openid: data['openid'], expires_in: '7200' } }
    end
    render json: result
  end

  def adverts
    skip_authorization
    puts action_name
  end

  def discovers
    skip_authorization
    puts action_name
  end

  def detail
    skip_authorization
    puts action_name
  end

  protected

    def query_params
      {
        js_code: params[:js_code],
        appid: ENV['WX_APP_ID'],
        secret: ENV['WX_APP_SECRET'],
        grant_type: ENV['WX_GRANT_TYPE']
      }
    end

    def jscode2session(params)
      conn = Faraday.new("https://api.weixin.qq.com/sns/jscode2session?#{params.to_query}")
      JSON.parse(conn.get.body)
    end

    def wx(data, code = '0', reason = '')
      # @TODO: data hash => array
      {
        code: code,
        reason: reason,
        time: Time.zone.now.to_formatted_s(:number),
        list: data
      }
    end

  private

    def write_params
      dir = Rails.root.join('tmp', 'data')
      filename = action_name + '.json'
      Dir.mkdir(dir) unless Dir.exist?(dir)
      file_path = File.join(dir, filename)
      return if File.exist?(file_path)
      File.atomic_write(file_path) do |file|
        file.write(params.to_json)
      end
    end
end
