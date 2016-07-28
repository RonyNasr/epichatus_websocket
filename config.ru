require './app'
require './middlewares/chat_backend'

use Epichat::ChatBackend

run Sinatra::Application
