require 'rubygems'
require 'bundler'

Bundler.require

before do
  content_type 'application/javascript'
end

get '/app.js' do
  @document = TVML::Document.new
  @document.template = TVML::Template::Alert.new.tap do |alert|
    alert.title = "Hello, world! How are things?"
    alert.buttons << "Pretty Good!" << "Not So Great..."
  end
  erb :'default.js', layout: :'layouts/default.js'
end
