# app/middleware/visitor_tracker_middleware.rb
class VisitorTrackerMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    Visitor.create(ip_address: request.ip, user_agent: request.user_agent)
    @app.call(env)
  end
end



# # app/middleware/visitor_tracker_middleware.rb
# class VisitorTrackerMiddleware
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     request = Rack::Request.new(env)
#     Visit.create(ip_address: request.ip, user_agent: request.user_agent)
#     @app.call(env)
#   end
# end
