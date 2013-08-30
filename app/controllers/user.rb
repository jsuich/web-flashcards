enable :sessions
# GET #############################

get '/user_home/:id' do

  erb :user_home
end

get '/round' do
  erb :round
end


# POST #############################

post '/user_home' do
  @user = User.find_by_email(params[:email])

  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    puts
    puts " The current user is #{current_user.email}" 
    puts
    erb :user_home
  else
    redirect ("/") # mustdisplay not valid login msg.
  end

end


post '/new_user' do 
  if @user = User.create(params[:user])
    redirect ("/user_home/#{@user.id}")
  else
    redirect ("/") # must display not valid registrtation msg.
  end

end

post '/logout' do
  session.clear
  redirect ("/")
end
