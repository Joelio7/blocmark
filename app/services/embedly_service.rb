class EmbedlyService
  attr_reader :data

  def embed(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'],
      :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.extract :url => url
    @data = obj[0].marshal_dump

    {
      url: data[:provider_url],
      title: get_title,
      description: get_description,
      image: get_image
    }
  end

  private

  def get_title
    if data[:title]
      (data[:title].slice(0,50)  || "#{data[:provider_url]}")
    else
      "No Title"
    end
  end
  def get_description
    if data[:description]
      (data[:description].slice(0,150) || "Hmm... #{data[:provider_url]} didn't provide a description when asked.")
    else
      "No Description"
    end
  end
  def get_image
    if data[:image]
      (data[:images][0]["url"] if data[:images][0])
    else
      "No Image"
    end
  end
end
