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
    @current_card = 0
    Round.create()
  elsif @card_array.last.id < params[:card_id].to_i
    @current_card = params[:card_id].to_i + 1
  else
    redirect '/results' 
  end

  erb :round
end

get '/results' do

  erb :results
end


## POSTS ##

# post '/results' do

#   erb :results
# end