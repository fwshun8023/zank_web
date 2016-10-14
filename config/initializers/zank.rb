module Zank
  def self.client
    unless @zank_client 
      @zank_client = Zank::Client.new(ENV['ZANK_USERNAME'], ENV['ZANK_PASSWORD'])
      @zank_client.login
    end
    @zank_client
  end

  def login
    @zank_client.login
  end
end