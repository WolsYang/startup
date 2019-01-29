class ApplicationController < ActionController::Base
	before_action :set_locale, :set_timezone, :current_user
	
	rescue_from CanCan::AccessDenied do |exception|  #沒權限的用戶會被導回首頁
    	redirect_to root_path, :alert => exception.message
    end

	def set_locale
	  # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
	  if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
		session[:locale] = params[:locale]
	  end

	  I18n.locale = session[:locale] || I18n.default_locale
	end
	
	def set_timezone
		Time.zone = "Taipei"
		#if current_user && current_user.time_zone
			#Time.zone = current_user.time_zone
		#end
	end
	
	private
	  def current_user
		@current_user ||= session[:user_id] && User.find(session[:user_id])
	  end

	  def check_login
		if !current_user
		  redirect_to login_path
		end
	  end

	helper_method :current_user, :check_login

end
