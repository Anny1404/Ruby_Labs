load 'Resource.rb'
class CommentsController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    @comments.each.with_index do |post, index |
      puts "id: #{index+1} #{post}"
    end
  end

  def show
    print "Type index of the comments: "
    id = gets.to_i

    if id > @comments.size or id < 1
      puts "Wrong id."
      return
    end
    
    puts "id: #{id}  #{@comments[id-1]}"
    
  end

  def create
    print "Enter comments text: "
    text = gets.to_s.chomp
    @comments << text
    puts "#{@comments.index(text) +1 }: #{text}"
  end

  def update
    print "Enter the id of the comments you would like to edit: "
    id = gets.to_i

    if id > @comments.size or id < 1
      puts "Wrong id."
      return
    end

    print "Enter comments text: "
    text = gets.to_s.chomp
    @comments[id-1] = text
  end

  def destroy
    print "Enter the id of the comments you would like to delete: "
    id = gets.to_i

    if id > @comments.size or id < 1
      puts "Wrong id."
      return
    end

    @comments.delete_at(id-1)
  end
end