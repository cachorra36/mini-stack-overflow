module Github 

class Cliente


  include HTTParty
  base_uri 'https://api.github.com'

  def initialize
    @options = {query: {access_token:"d6bd3f84a0e0a4e1ce0a53e8df1a4234a86c1932" }, :headers =>  {"User-Agent" => "Nosotros"}}
  end

  def zen
    self.class.get( "/zen", @options)
  end

end

end

