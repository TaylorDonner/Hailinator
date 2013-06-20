require "twitter"
require "csv"


Twitter.configure do |config|
  config.consumer_key = "lUjBX3ocP4aPY4yHsDOQ"
  config.consumer_secret = "HPbD4rUrX9JAaztYQivy7eDDTWxCjmWrJMfKpzWWI"
  config.oauth_token = "260868608-T1OAcwQMfS6PynVCBy6WFRSiu48ZQgFI4XBUBTSJ"
  config.oauth_token_secret = "QwP1cgQ1jpKsdfoDwo8MJvpE4GMlDvyiwO2TTriz4cU"
end


search = Twitter.search("makersquare")


CSV.open("hailinator.csv", "wb") do |csv|
	
	csv << ["handle", "text", "url"]
	search.results.map do |result|
		# result.from_user
		# result.full_text
		# result.id
		
		csv << ["#{result.from_user}", "#{result.full_text}", "https://twitter.com/#{result.from_user}/status/#{result.id}"]
	Twitter.favorite(result.id)	
	sleep 1
	
	end
end





