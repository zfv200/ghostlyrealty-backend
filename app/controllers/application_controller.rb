class ApplicationController < ActionController::API
  before_action :authorized, only: [:encode_token, :auth_header, :decoded_token]

  def encode_token(payload)
    #put this in figaro
    JWT.encode(payload, 'my_s3cr3t')
  end

  def auth_header
    #{ 'Authorization': 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')

      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_ghost
    if decoded_token
      ghost_id = decoded_token[0]['ghost_id']
      @ghost = Ghost.find_by(id: ghost_id)
    end
  end

  def logged_in?
    !!current_ghost
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
