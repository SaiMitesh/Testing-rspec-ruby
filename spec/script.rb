require 'airborne'
require 'json'
require 'active_support/core_ext/hash'

describe 'TEST1' do
    before(:each) do
      print "before each describe\n"
    end
    before(:all) do
      print "beofre all  describe\n"
    end
  it 'should test1' do
    print "test1\n"
    Airborne.configure do |config|
      config.base_url = 'https://jsonplaceholder.typicode.com'
      config.headers = {'x-auth-token' => 'my_token'}
    end
    v=3
    print "v=#{v}"
    get "/todos/#{v}"
    # print json_body
    # response.setBody json_body
    body = response.body
    print body
    expect_json(userId: 1)
    # expect_json('userId:1', {datasource: {userId: 'FACEBOOK'}})
    c= "{a:aa bb,b:989890}".gsub(/[{:,}]/,'{'=>'{"', '}'=>'"}', ':'=> "\":\"", ','=> '","')
    print c
    print JSON.parse(c)
    print"\n"
    print "hello hi".gsub(/\W/,'\"\0\"')
    print"\n"
    print "hello".gsub(/(?<foo>[aeiou])/, '{\k<foo> }')
    # c=JSON.parse("{\"a\":aa bb}")
    # print c
    # print Time.now
    # print Time.now.to_i
  end


end

describe 'TEST2' do
  it 'should test2' do
    print "test2\n"

    Airborne.configure do |config|
      config.base_url = 'https://reqres.in'
      config.headers = {'x-auth-token' => 'my_token'}
    end
    # get '/api/users',{},{'params'=>{'page'=>'2'}}
    get '/api/users',{ }, { 'params' => {'page' => 2 } }
    print json_body
  end
end

describe 'TEST3' do
  it 'should test3' do
    print "test3\n"

    Airborne.configure do |config|
      config.base_url = 'http://www.geoplugin.net'
      config.headers = {'x-auth-token' => 'my_token'}
    end
    get '/xml.gp?ip=xx.xx.xx.xx'

    # respoonse = response.body
    # response2 = Hash.from_xml(response).to_json

    json_body = Hash.from_xml(response)
    # response2 = Hash.from_xml(response)
    # json_body =response2
    # print json_body

    # expect_json(geoPlugin: 1,json_body:json_body)
    # expect(response2["geoPlugin"]["geoplugin_request"]).to eq("123")
  end


end
