class TwilioWrapper
	attr_accessor :client, :from
	
<<<<<<< HEAD
	def initialize
		@client = Twilio::REST::Client.new(ENV["AUTH"], ENV["SID"])
		@from =  MY_APP_TEL
=======
	def initialize(alert_id)
		@client = Twilio::REST::Client.new( "ACbf9655e5dce076f5f08146511db291ec" , "3e53b709f9ebab86ea4db344dc70fe99")
		@from = "6466814097" 
		@alert_id=alert_id
>>>>>>> 16ec67ea16f79742b2b24180946cdc919ee1d1ad
	end


		
	def recipient_number
		Alert.find_by(@alert_id).recipient.phone_number
	end 

	def train_status
		name=Service.find_by(name: Alert.find_by(@alert_id).service_name).name
		traffic=Service.find_by(name: Alert.find_by(@alert_id).service_name).traffic
		"Status for #{name} is #{traffic}"
	end

	def sms
		client.account.messages.create(:from => from, :to => recipient_number, :body => train_status)
	end

	


end
