class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # include CanCan::ControllerAdditions

  protect_from_forgery with: :exception

  def like_component(like_component, url, msg_sucess = 'Like Sucessfully', msg_fail = 'Like Fail')
    like_component.like = like_component.like + 1
    return redirect_to article_path(url), notice: msg_sucess if like_component.save
    redirect_to artilce_path(url)
    flash[:alert] = msg_fail
  end
end
