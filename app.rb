require 'sinatra'

def file
  '/var/vcap/store/shared/tango/test'
end

get '/write' do
  `echo "write on $VCAP_APP_HOST at $(date)" >> #{file}`
  `chmod 666 #{file}`
end

get '/read' do
  `cat #{file}`
end
