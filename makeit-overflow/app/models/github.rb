module Github 

class Cliente


  include HTTParty
  base_uri 'https://api.github.com'

  def initialize
    @options = {query: {access_token:"47053f24f893cdf71a11f65b571f23adf668adc9" }, :headers =>  {"User-Agent" => "Nosotros"}}
  end

  def zen
    self.class.get( "/zen", @options)
  end

end

end

