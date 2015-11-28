class Bookmark < ActiveRecord::Base
  require 'uri'

  belongs_to :user
  belongs_to :topic
  validates :url, length: { minimum: 10 }, presence: true, format: { with: URI.regexp}
  before_create :url_format



  def url_format
    url.scan(URI.regexp)
      URI.regexp =~ url


  end





end
