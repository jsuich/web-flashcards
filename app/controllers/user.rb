# GET #############################

get '/user_home/:id' do
 erb :user_home
end




# POST #############################

post '/user_home' do
   @user = User.find_by(email: params[:email])
  if @user.authenticate
    session[:user_id] = @user.id
    redirect_to("/user_home/#{@user.id}")
  else
    redirect_to("/") # mustdisplay not valid login msg.
  end

end

post '/new_user' do

  if @user = User.create(params[:user])
    redirect_to("/user_home/#{@user.id}")
  else
    redirect_to("/") # must display not valid registrtation msg.
  end

end
