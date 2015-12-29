#Script for sending people DailyGrumps
require 'twilio-ruby'
require 's3'
require 'yaml'

settings = YAML.load_file('settings.yml')
twilio_config =  settings['twilio']
s3_config = settings['s3']

service = S3::Service.new(:access_key_id => s3_config['access_key_id'],
                          :secret_access_key => s3_config['secret_access_key'],
                          :use_ssl => true)

images = service.bucket("misc-applications").objects.find_all( :prefix => s3_config['search_prefix'])

image = images.sample.url
# puts image

@client = Twilio::REST::Client.new twilio_config['account_sid'], twilio_config['auth_token']

victims = ['+14155551212']

victims.each do |number|
  ret = @client.messages.create(
    from: twilio_config['from_number'],
    to: number,
    media_url: image
  )
end
