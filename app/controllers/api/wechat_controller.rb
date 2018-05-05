class Api::WechatController < Api::BaseController
  def jscode2session
    skip_authorization
    session = code2session(params[:js_code])
    # session = {"session_key"=>"CP2CSDZIhgDPxT3xsGBzmQ==", "openid"=>"oNWgu5Wm1C1UxLDU1dpPr-H58qQQ"}
    result = {}
    if session['openid'] && session['session_key']
      Visitor.find_or_create_by(openid: session['openid']) do |visitor|
        visitor.uid = session['openid']
        visitor.token = session['session_key']
        visitor.nick_name = params[:nick_name]
      end
      result = { openid: session['openid'] }
    end
    render json: result
  end

  private

    def code2session(js_code)
      params = {
        js_code: js_code,
        appid: ENV['WX_APP_ID'],
        secret: ENV['WX_APP_SECRET'],
        grant_type: ENV['WX_GRANT_TYPE']
      }
      conn = Faraday.new("https://api.weixin.qq.com/sns/jscode2session?#{params.to_query}")
      JSON.parse(conn.get.body)
    end
end
