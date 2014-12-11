
class CustomersController < ApplicationController
    require 'rubygems'
require 'dropbox_sdk'
require 'google/api_client'
require 'launchy'
require 'rubygems'
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
APP_KEY = 'b0qbdorzo700qi1'
APP_SECRET = 'cm20q9te2dw6eqh'
CLIENT_ID = '24122391330-bujfgp8h8htnc08r75lrlvv3fj1hj7pm.apps.googleusercontent.com'
CLIENT_SECRET = 'H2okgTl2nMchQnyigRTUqXKy'
OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'
REDIRECT_URI = 'http://localhost:3000/customers/oauth2callback'

#CODE = 'rZ8KyWVtmSMAAAAAAAAAC5LkPBuP1UaVPfvSuKRdsbJevKPmb7VpvNOe9vxpunPu'
  # GET /customers
  # GET /customers.json
  def hmpg
  end
  def googlstore
    

# Get your credentials from the console
# Create a new API client & load the Google Drive API
@@client = Google::APIClient.new
@@drive = @@client.discovered_api('drive', 'v2')

# Request authorization
@@client.authorization.client_id = CLIENT_ID
@@client.authorization.client_secret = CLIENT_SECRET
@@client.authorization.scope = OAUTH_SCOPE
@@client.authorization.redirect_uri = REDIRECT_URI
uri = @@client.authorization.authorization_uri
#redirect_to uri
#code= gets.chomp
Launchy.open(uri)

# Exchange authorization code for access token
$stdout.write  "After calling google for autorisation "
=begin google code
client.authorization.code = gets.chomp
client.authorization.fetch_access_token!

# Insert a file
file = drive.files.insert.request_schema.new({
  'title' => 'My document',
  'description' => 'A test document',
  'mimeType' => 'text/plain'
})

media = Google::APIClient::UploadIO.new(Rails.root.join('laddu', 'abc.txt'), 'text/plain')
result = client.execute(
  :api_method => drive.files.insert,
  :body_object => file,
  :media => media,
  :parameters => {
    'uploadType' => 'multipart',
    'alt' => 'json'})

# Pretty print the API result
jj result.data.to_hash
=end
puts "no redirect_to"
#redirect_to customers_hmpg_path
  end


  def index


# Install this the SDK with "gem install dropbox-sdk"


# Get your app key and secret from the Dropbox developer website

@flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
authorize_url = flow.start()
redirect_to authorize_url
 # Have the user sign in and authorize this app
#puts '1. Go to: ' + authorize_url
#puts '2. Click "Allow" (you might have to log in first)'
#puts '3. Copy the authorization code'
#print 'Enter the authorization code here: '
=begin 
code = gets.strip
access_token, user_id = flow.finish(code)
client = DropboxClient.new(access_token)
puts "linked account:", client.account_info().inspect
file = File.open(Rails.root.join('laddu', 'abc.txt'), 'r')#open('working-draft.txt')
response = client.put_file('/abc.txt', file)
  puts "****************************************************************************************************"
  file.close
puts "uploaded:", response.inspect
=end
#GET authorize_url
end 


def oauth2callback
#client = Google::APIClient.new
#drive = client.discovered_api('drive', 'v2')

# Request authorization
#client.authorization.client_id = CLIENT_ID
#client.authorization.client_secret = CLIENT_SECRET
#client.authorization.scope = OAUTH_SCOPE
#client.authorization.redirect_uri = REDIRECT_URI

kode=params[:code]
puts kode
@@client.authorization.code = kode
@@client.authorization.fetch_access_token!

# Insert a file
file = @@drive.files.insert.request_schema.new({
  'title' => 'My document',
  'description' => 'A test document',
  'mimeType' => 'text/plain'
})
@path=Rails.root.join('public','abc.txt')
 if (! File.exists? @path)
   print "File does not exist!" 

 else
  print "Esitst"
  puts @path
  puts "Rb file size variable #{@rb_file_s_size }"
end 
media = Google::APIClient::UploadIO.new(Rails.root.join('public','abc.txt'), 'text/plain')
result = @@client.execute(
  :api_method => @@drive.files.insert,
  :body_object => file,
  :media => media,
  :parameters => { 'uploadType' => 'multipart',
    'alt' => 'json'})

# Pretty print the API result
jj result.data.to_hash
redirect_to customers_hmpg_path

  end
def dropoauth
  code = params[:code]
  puts "**************************************************************************"
  puts code
  puts "**************************************************************************"
access_token, user_id = @flow.finish(code)
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