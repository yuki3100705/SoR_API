class LoginController < ApplicationController

  # def index
  # end

  def auth
    # p "shige"
    # p params[:name]

    name = params[:name]
    address = params[:address]
    # @request_auth = {}
    # @request_auth[:name] = name
    # @request_auth[:address] = ''

    unless validation(name, address)
      # return render :login
      render json: { "comment": "成功じゃん。" }
      render json: '失敗じゃん。'
    end

    user = User.find_by(name: name)
    if user
      # if user.fails_count >= 3
      #   render json: 'アカウントロックされています。解除するためには、管理者に問い合わせてください。'
      # elsif user.authenticate(address)
      if user.address == address
      #   session[:user] = user
      #   user.update(fails_count: 0, last_login_at: DateTime.now, record_timestamps: false)
      #   redirect_to '/calendar'
      render json: { "comment": "成功じゃん。" }
      # else
      else
        # user.increment!(:fails_count)
        # if user.fails_count < 3
          # flash.now[:alert] = 'name違います。'
          # render :login
          render json: { "comment": "name または address!!! が違います。" }
        # else
        #   flash.now[:alert] = 'アカウントがロックされました。解除するためには、管理者に問い合わせてください。'
        #   render :login
        # end
      # end
      end
    else
      # flash.now[:alert] = 'name または address!!! が違います。'
      # render :login
      render json: { "comment": "name違います。" }
    end
  end

  def desdes
    @users = User.find_by(id: params[:id])
    @users.delete
  end

  def validation(name, address)
    flag = true
    if name == ''
      flag = false
      if address == ''
        # flash.now[:alert] = 'name/address を入力してください。'
        render json: { "comment": "name/address を入力してください。" }
      else
        # flash.now[:alert] = 'name を入力してください。'
        render json: { "comment": "name を入力してください。" }
      end
    elsif address == ''
      flag = false
      # flash.now[:alert] = 'address を入力してください。'
      render json: { "comment": "address を入力してください。" }
    end
    flag
  end

end
