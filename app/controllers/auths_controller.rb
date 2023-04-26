class AuthsController < ApplicationController

    def create
        hmac_secret = 'my$ecretK3y' # my secret key

        payload = { name: params[:name] } # my content to be encoded

        token = JWT.encode payload, hmac_secret, 'HS256' # my signed token

        render json: { token: token }
    end
end
