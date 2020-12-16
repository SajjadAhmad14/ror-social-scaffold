require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name:'a', email:'a@a.com', password:'123456') }
  it 'Create a new data container' do
    post = Post.new(content: 'abc')
    expect(post).to be_a_new(Post)
  end

  it 'Post is valid if content attribute is present' do
    post = Post.new(user_id: user.id, content: 'abc')
    expect(post).to be_valid
  end

  it 'Post is not valid if user does not exist' do
    post = Post.new(content: 'abc')
    expect(post).to_not be_valid
  end

  it 'Post is not valid without content attribute' do
    post = Post.new(content: nil)
    expect(post).to_not be_valid
  end

  it 'Post has many comments' do
    expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
  end

  it 'Post has many likes' do
    expect(Post.reflect_on_association(:likes).macro).to eq(:has_many)
  end

  it 'Post belongs to a user' do
    expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

end
