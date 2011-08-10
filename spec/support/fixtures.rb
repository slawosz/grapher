def load_test_data
  post1 = Post.create(:title => "First post", :content => "Lorem ipsum")
  post2 = Post.create(:title => "Second post", :content => "Other post")
  @@posts = {:first_post => post1, :second_post => post2}
end
