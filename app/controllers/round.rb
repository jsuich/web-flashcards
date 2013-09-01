get '/round/:id' do
  @current_user = current_user
  @deck = Deck.find(params[:id])
  @card_array = @deck.cards
  @current_card = 0
  erb :round
end

get '/round/:id/:card_id' do
  @current_user = current_user
  @deck = Deck.find(params[:id])
  @card_array = @deck.cards

  if params[:card_id].nil?
    @current_card_id = @card_array.first.id
    @current_round = Round.create(current_user.id, @deck.id)

    erb :round
  elsif cards_left?#params[:card_id].to_i < @card_array.last.id
    @current_card_id = params[:card_id].to_i + 1

    erb :round
  else

    erb :results 
  end

  
end

get '/results' do

  erb :results
end


## POSTS ##

# post '/results' do

#   erb :results
# end