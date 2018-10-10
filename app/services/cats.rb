class GetUrl

  def self.by_environment
    if Rails.env.test? || Rails.env.development?
      "http://localhost:3000/api/v1"
    elsif Rails.env.production?
      "https://limitless-taiga-55796.herokuapp.com/"
    end
  end
end
# create key to root url
#
# production 
