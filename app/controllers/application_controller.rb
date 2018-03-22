class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def like_component(recode, url, msg_sucess, msg_fail)
    recode.like = recode.like + 1
    return redirect_to article_path(url), notice: msg_sucess if recode.save
    redirect_to artilce_path(url)
    flash[:alert] = msg_fail
  end

  # def like_compoment(recode,url,msgs, msgf)
  #   recode.like = recode.like.to_i + 1
  #   return redirect_to article_path(url), notice: msgs if recode.save
  #   redirect_to articles_path,
  #   flash[:alert] = msgf
  # end
end
