require 'twilio-ruby'
require 'yaml'

settings = YAML.load_file('settings.yml')
twilio_config =  settings['twilio']

@client = Twilio::REST::Client.new twilio_config['account_sid'], twilio_config['auth_token']

ret = @client.messages.create(
  from: twilio_config['from_number'],
  to: '+14155551212',
  body: 'This is GrumpyCat!'
)
