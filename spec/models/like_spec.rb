require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'a', email: 'a@a.com', password: '123456') }
  let(:post) { Post.create(user_id: user.id, content: 'abc') }
  it 'Create a new data container' do
    like = Like.new(user_id: user.id, post_id: post.id)
    expect(like).to be_a_new(Like)
  end

  it 'Like is valid if user_id and post_id attributes are not nil' do
    like = Like.new(user_id: user.id, post_id: post.id)
    expect(like).to be_valid
  end

  it 'Like is not valid if user does not exist' do
    like = Like.new(post_id: post.id)
    expect(like).to_not be_valid
  end

  it 'Like is not valid if post does not exist' do
    like = Like.new(user_id: user.id)
    expect(like).to_not be_valid
  end

  it 'Like belongs to a user' do
    expect(Like.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'Like belongs to a post' do
    expect(Like.reflect_on_association(:post).macro).to eq(:belongs_to)
  end
end
