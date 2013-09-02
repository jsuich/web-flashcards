def current_user
  @current_user ||= User.find(session[:user_id])
end

# def current_round
#   @current_round ||= Round.where(user_id: current_user.id).last#find_by(user_id: current_user)#.last
# end

def cards_left?
  @current_card != @card_array.last
  # params[:card_id].to_i < @card_array.last.id
end