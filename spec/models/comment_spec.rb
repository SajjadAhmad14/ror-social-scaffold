require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name:'a', email:'a@a.com', password:'123456') }
  let(:post) { Post.create(user_id: user.id, content: 'abc') }
  it 'Create a new data container' do
    comment = Comment.new(user_id: user.id, post_id: post.id, content: 'abc')
    expect(comment).to be_a_new(Comment)
  end
  
  it 'Comment is valid if content, user_id and post_id attributes are not empty' do
    comment = Comment.new(user_id: user.id, post_id: post.id, content: 'abc')
    expect(comment).to be_valid
  end

  it 'Comment is not valid if user does not exist' do
    comment = Comment.new(post_id: post.id, content: 'abc')
    expect(comment).to_not be_valid
  end
  
  it 'Comment is not valid if post does not exist' do
    comment = Comment.new(user_id: user.id, content: 'abc')
    expect(comment).to_not be_valid
  end
  
  it 'Comment is not valid if content does not exist' do
    comment = Comment.new(user_id: user.id, post_id: post.id, content: nil)
    expect(comment).to_not be_valid
  end
  
  it 'Comment belongs to a user' do
    expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
  end
  
  it 'Comment belongs to a post' do
    expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
  end
  
end