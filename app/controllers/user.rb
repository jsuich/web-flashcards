enable :sessions
# GET #############################

get '/user_home/:id' do

  erb :user_home
end

get '/round' do
  erb :round
end

get '/user_home' do
  @user = User.find_by(email: params[:email])
end

# POST #############################
post '/login_error' do
  erb :login_error
end

post '/user_home' do
  # @user = User.find_by_email(params[:email])
  
  @user = User.find_by(email: params[:email]) # => Got new error:NoMethodError at /user_home
    # undefined method `authenticate' for #<ActiveRecord::Relation::ActiveRecord_Relation_User:0x007fa22cb132f0>
  # => Moved Authenticate Method here from user.rb

  if @user.password == (params[:password])
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
