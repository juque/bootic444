class SessionsController < ApplicationController
  def create
    # We'll need the Bootic access token later
    # so let's store it in the session
    # (you could store it in your database, too)
    session[:access_token] = request.env['omniauth.auth']['credentials']['token']

    # Omniauth-Bootic returns some aditional user information.
    # Lets store it too
    session[:user_name] = request.env['omniauth.auth']['info']['name']

    # That's it! The user is now logged in our Rails app.
    # Redirect to some protected page
    flash[:notice] = "Welcome!"
    redirect_to dashboard_url
  end

  # Destroy the session and logout.
  def destroy
    session.delete :access_token
    session.delete :user_name
    redirect_to dashboard_url
  end
end
