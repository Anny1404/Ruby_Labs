load 'Resource.rb'
class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    @posts.each.with_index do |post, index |
      puts "id: #{index+1} #{post}"
    end
  end

  def show
    print "Type index of the post: "
    id = gets.to_i

    if id > @posts.size or id < 1
      puts "Wrong id."
      return
    end
    
    puts "id: #{id}  #{@posts[id-1]}"
    
  end

  def create
    print "Enter post text: "
    text = gets.to_s.chomp
    @posts << text
    puts "#{@posts.index(text) +1 }: #{text}"
  end

  def update
    print "Enter the id of the post you would like to edit: "
    id = gets.to_i

    if id > @posts.size or id < 1
      puts "Wrong id."
      return
    end

    print "Enter post text: "
    text = gets.to_s.chomp
    @posts[id-1] = text
  end

  def destroy
    print "Enter the id of the post you would like to delete: "
    id = gets.to_i

    if id > @posts.size or id < 1
      puts "Wrong id."
      return
    end

    @posts.delete_at(id-1)
  end
end