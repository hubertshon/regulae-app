class IconsController < ApplicationController
require "oauth"

# consumer = OAuth::Consumer.new("f6aa52b365844f19a7f6499cc4711c16", "5bec6b9c3df74c28ba45441e0fa9193a")
# @access_token = OAuth::AccessToken.new consumer
# @endpoint = "http://api.thenounproject.com/icon/1"



#   def show
#     response = @access_token.(HTTP.get("http://api.thenounproject.com/icon/1"))
#     render json: response
#   end


  def show
    consumer = OAuth::Consumer.new(Rails.application.credentials.noun_project_api[:key],Rails.application.credentials.noun_project_api[:secret])
    access_token = OAuth::AccessToken.new consumer
    endpoint = "http://api.thenounproject.com/icon/1"

    @icon = access_token.get(endpoint)
    render "show.json.jb"
  end

end
