def create
 #Msg.new(params[:msg])
 #redirect_to :action => "index"
  msg = Msg.new(params[:msg])
#  message.save
  if message.save
    flash[:notice] = "The msg was saved successfully."
    redirect_to :action => "index"
  else
	  render :action => "new"
  end
#  redirect_to :action => "index"
end

