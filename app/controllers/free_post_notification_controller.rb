class FreePostNotificationController < ApplicationController
  require 'rss'
  require 'net/https'
  require 'json'

  def index
    name = params[:name]
    title = params[:title]
    create_message(name,title)
    post_cw(@message)
    redirect_to free_posts_url
  end

  def create_message(name,title)
    @message = '[info][title]【IT-Helper】ペッパーくんからのお知らせ【不具合通知】[/title]'+ name +'さんから報告もらったよ！「' + title + '」だって！[/info]'
  end

  def post_cw(data)
    uri = URI('https://api.chatwork.com/v1/rooms/' + Settings.room_id + '/messages')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    header = { "X-ChatWorkToken" => Settings.cw_api_token }
    body = "body=" + URI.encode(data)

    res = http.post(uri, body, header)
    puts JSON.parse(res.body)
  end
end
