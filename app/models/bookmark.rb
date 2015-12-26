class Bookmark < ActiveRecord::Base
  attr_reader :embed_service
  require 'uri'
  require 'json'
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  validates :description, length: {minimum: 10}, presence: true
  validates :url, length: { minimum: 10 }, presence: true, format: { with: URI.regexp}
  before_create :url_format




  def url_format
    url.scan(URI.regexp)
      URI.regexp =~ url
  end

  def embedly
    @embed_service ||= EmbedlyService.new
    embed_service.embed(url)
  end
end
