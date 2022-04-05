require_relative "CommentsController"
require_relative "PostsController"
require_relative "Resource"
require_relative "UserInput"

USER_EXIT_ANSWER = 'Q'
class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentsController, 'comments')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choice = UserInput.get_normalized_input

      PostsController.connection(@routes['posts']) if choice == '1'
      CommentsController.connection(@routes['comments']) if choice == '2'
      break if choice == USER_EXIT_ANSWER
    
    end

    puts 'Good bye!'
  end

  def resources(class_type, keyword)
    controller = class_type.new
    @routes[keyword] = {
      'GET'  => {
        'INDEX'  => controller.method(:index),
        'SHOW' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end
router = Router.new

router.init
