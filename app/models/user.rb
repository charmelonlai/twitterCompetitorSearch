class User < ActiveRecord::Base
	has_many :competitors
	def twitter
		@client ||= Twitter::REST::Client.new do |config|
			config.consumer_key        = Rails.application.secrets.twitter_api_key
			config.consumer_secret     = Rails.application.secrets.twitter_api_secret
			config.access_token        = "3255900630-LCdKMHe0z222gDuKgkurHI6kdQxrhCz5y5P66Bq"
			config.access_token_secret = "gWoMrCy8glNLoNZ1bUf2fQhVT2NIkwqk3rAqFASKPwiEu"
		end
	end

	def competitor_count(params)
		params[:competitor].try(:split, " ").try(:count) 
	end	

	def self.to_csv
    attributes = %w{account competitors}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |account|
        csv << [account.username, account.competitor]
      end
    end
  end

end
