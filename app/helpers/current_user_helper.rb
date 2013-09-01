def current_user
  @current_user ||= User.find(session[:user_id])
end

def current_round
  @current_round ||= Round.last#find_by(user_id: current_user)#.last
end

def cards_left?
  params[:card_id].to_i < @card_array.last.id
end