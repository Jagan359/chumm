
class CustomersController < ApplicationController
require 'dropbox_sdk'
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
APP_KEY = 'b0qbdorzo700qi1'
APP_SECRET = 'cm20q9te2dw6eqh'
#CODE = 'rZ8KyWVtmSMAAAAAAAAAC5LkPBuP1UaVPfvSuKRdsbJevKPmb7VpvNOe9vxpunPu'
  # GET /customers
  # GET /customers.json
  def hmpg
  end
  def index


# Install this the SDK with "gem install dropbox-sdk"


# Get your app key and secret from the Dropbox developer website

flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
authorize_url = flow.start()
redirect_to authorize_url
 # Have the user sign in and authorize this app
#puts '1. Go to: ' + authorize_url
#puts '2. Click "Allow" (you might have to log in first)'
#puts '3. Copy the authorization code'
#print 'Enter the authorization code here: '
code = gets.strip
access_token, user_id = flow.finish(code)
client = DropboxClient.new(access_token)
puts "linked account:", client.account_info().inspect
file = File.open(Rails.root.join('laddu', 'abc.txt'), 'r')#open('working-draft.txt')
response = client.put_file('/abc.txt', file)
  puts "****************************************************************************************************"
  file.close
puts "uploaded:", response.inspect
end 
def oauth
  code = params[:id]
access_token, user_id = flow.finish(code)
client = DropboxClient.new(access_token)
puts "linked account:", client.account_info().inspect
file = File.open(Rails.root.join('laddu', 'abc.txt'), 'r')#open('working-draft.txt')
response = client.put_file('/abc.txt', file)
  puts "****************************************************************************************************"
  file.close
puts "uploaded:", response.inspect
redirect_to customers_hmpg_path
  end
end