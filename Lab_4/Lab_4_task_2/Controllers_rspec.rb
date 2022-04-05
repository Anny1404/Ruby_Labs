require 'rspec'
require_relative 'CommentsController'
require_relative 'PostsController'

RSpec.describe CommentsController do
  it '#CommentsController create' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('Test comment1', 1)
    subject.create
    expect{ subject.show }.to output("Type index of the comments: id: 1  Test comment1\n").to_stdout
  end

  it '#CommentsController update' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('Test comment1', 1, 'updated')
    subject.create
    subject.update
    expect{ subject.index }.to output("id: 1 updated\n").to_stdout
  end

  it '#CommentsController destroy' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('Test comment1', 'Test comment2', 1)
    subject.create
    subject.create
    subject.destroy
    expect{ subject.index }.to output("id: 1 Test comment2\n").to_stdout
  end

  it '#CommentsController index' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('Test comment1', 'Test comment2')
    subject.create
    subject.create
    expect{ subject.index }.to output("id: 1 Test comment1\nid: 2 Test comment2\n").to_stdout
  end

  it '#CommentsController show' do
    allow_any_instance_of(CommentsController).to receive(:gets).and_return('Test comment1', 'Test comment2', 2)
    subject.create
    subject.create
    expect{ subject.show }.to output("Type index of the comments: id: 2  Test comment2\n").to_stdout
  end
end

RSpec.describe PostsController do
  it '#PostsController create' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Test post1', 1)
    subject.create
    expect{ subject.show }.to output("Type index of the post: id: 1  Test post1\n").to_stdout
  end

  it '#PostsController update' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Test post1', 1, 'updated')
    subject.create
    subject.update
    expect{ subject.index }.to output("id: 1 updated\n").to_stdout
  end

  it '#PostsController destroy' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Test post1', 'Test post2', 1)
    subject.create
    subject.create
    subject.destroy
    expect{ subject.index }.to output("id: 1 Test post2\n").to_stdout
  end

  it '#PostsController index' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Test post1', 'Test post2')
    subject.create
    subject.create
    expect{ subject.index }.to output("id: 1 Test post1\nid: 2 Test post2\n").to_stdout
  end

  it '# show' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return('Test post1', 'Test post2', 2)
    subject.create
    subject.create
    expect{ subject.show }.to output("Type index of the post: id: 2  Test post2\n").to_stdout
  end
end