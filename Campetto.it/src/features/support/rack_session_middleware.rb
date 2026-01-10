class RackSessionMiddleware
    def initialize(app)
      @app = app
    end
  
    def call(env)
      Rack::Session::Cookie.new(@app, key: '_myapp_session', secret: 'key').call(env)
    end
end
  