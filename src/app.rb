require 'sinatra/base'
require 'time'

class App < Sinatra::Base
  set :protection, false

  error do
    'Something went wrong. Please go back and try again.'
  end

  PRESETS = {
    strformat_A_b_d: "%A, %b %d",
    strformat_mdY: "%m/%d/%Y",
    strformat_m_e_y_HM: "%m-%e-%y %H:%M",
    strformat_b_e_lM_p: "%b %e, %l:%M %p",
    strformat_B_Y: "%B %Y",
    strformat_b_d_Y: "%b %d, %Y",
    strformat_a_e_b_Y_HMS_z: "%a, %e %b %Y %H:%M:%S %z",
    strformat_Y_m_dTlMSz: "%Y-%m-%dT%l:%M:%S%z",
    strformat_IMS_p: "%I:%M:%S %p",
    strformat_HMS: "%H:%M:%S",
    strformat_e_b_Y_HMSp: "%e %b %Y %H:%M:%S%p",
    strformat_dmy: "%d.%m.%y",
    strformat_A_d_b_Y_lM_p: "%A, %d %b %Y %l:%M %p"
  }

  def convert(time, format)
    Time.parse(time).strftime(format)
  end

  get '/' do
    @datetime = Time.now.utc.iso8601
    @strformat = '%A, %b %d'
    @strftime_result = convert(@datetime, @strformat)
    erb :index
  end

  get '/link' do
    'link clicked'
  end

  put '/' do
    @datetime = params[:datetime]
    @strformat = params[:strformat]
    @strftime_result = convert(@datetime, @strformat)
    erb :index
  end

  delete '/destroy' do
    '2nd form has submitted'
  end
end
