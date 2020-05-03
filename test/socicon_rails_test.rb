require 'test_helper'

class SociconTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test 'engine is loaded' do
    assert_equal ::Rails::Engine, Socicon::Rails::Engine.superclass
  end

  test 'fonts are served' do
    get '/assets/socicon.eot'
    assert_response :success
    get '/assets/socicon.woff'
    assert_response :success
    get '/assets/socicon.woff2'
    assert_response :success
    get '/assets/socicon.ttf'
    assert_response :success
    get '/assets/socicon.svg'
    assert_response :success
  end

  test 'stylesheets are served' do
    get '/assets/socicon.css'
    assert_socicon(response)
  end

  test 'stylesheets contain asset pipeline references to fonts' do
    get '/assets/socicon.css'
    v = Socicon::Rails::VERSION
    assert_match %r{/assets/socicon(-\w+)?\.eot\?v=#{v}},  response.body
    assert_match %r{/assets/socicon(-\w+)?\.eot\?#iefix&v=#{v}}, response.body
    assert_match %r{/assets/socicon(-\w+)?\.woff\?v=#{v}}, response.body
    assert_match %r{/assets/socicon(-\w+)?\.ttf\?v=#{v}},  response.body
    assert_match %r{/assets/socicon(-\w+)?\.svg\?v=#{v}#socicon}, response.body
  end

  test 'stylesheet is available in a css sprockets require' do
    get '/assets/sprockets-require.css'
    assert_socicon(response)
  end

  test 'stylesheet is available in a sass import' do
    get '/assets/sass-import.css'
    assert_socicon(response)
  end

  test 'stylesheet is available in a scss import' do
    get '/assets/scss-import.css'
    assert_socicon(response)
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path('../dummy/tmp',  __FILE__)
  end

  def assert_socicon(response)
    assert_response :success
    assert_match(/font-family:\s*'socicon';/, response.body)
  end
end
