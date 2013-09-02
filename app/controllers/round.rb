# get '/round/:id' do
#   @current_user = current_user
#   @deck = Deck.find(params[:id])
#   @card_array = @deck.cards
#   @current_card = 0
#   erb :round
# end

get '/round/:id/:card_index' do
  @current_user = current_user
  @deck = Deck.find(params[:id])
  @card_array = @deck.cards

  if params[:card_index].nil?
    @current_card = @card_array.first
    @current_round = Round.create(current_user.id, @deck.id)

    erb :round
  elsif cards_left?#params[:card_id].to_i < @card_array.last.id
    @current_card = @card_array[params[:card_index].to_i + 1]

    erb :round
  else

    erb :results 
  end

  
end

get '/results' do

  erb :results
end


## POSTS ##

post '/round/:id/:card_index' do
  @current_user = current_user
  @deck = Deck.find(params[:id])
  @card_array = @deck.cards

  if params[:card_index].nil?
    @current_card = @card_array.first
    @current_round = Round.create(current_user.id, @deck.id)

    erb :round
  elsif cards_left?#params[:card_id].to_i < @card_array.last.id
    @current_card = @card_array[params[:card_index].to_i + 1]

    erb :round
  else

    erb :results 
  end

  
end

# post '/results' do

#   erb :results
# end