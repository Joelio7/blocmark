require 'rails_helper'

RSpec.describe IncomingController, type: :controller do

  describe "POST create" do
    it "creates bookmark" do
      post :create, { "sender" => "fakeit@example.com", "subject" => "test topic", "body-plain" => "http://www.fakeaddress.com"}
      expect(response).to have_http_status(:success)
    end

    it "increases the number of bookmark by 1" do
    expect{post :create, { "sender" => "fakeit@example.com", "subject" => "test topic", "body-plain" => "http://www.fakeaddress.com"}}.to change(Bookmark, :count).by(1)
    end

    it "assigns the new bookmark to @bookmark" do
      post :create, bookmark:  { "sender" => "fakeit@example.com", "subject" => "test topic", "body-plain" => "http://www.fakeaddress.com"}
      expect(assigns(:bookmark)).to eq Bookmark.last
    end
  end
end
