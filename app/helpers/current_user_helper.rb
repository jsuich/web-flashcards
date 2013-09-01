def current_user
  @current_user ||= User.find(session[:user_id])
end

def current_round
  @current_deck ||= 
