json.extract! blog, :id, :title, :body, :image_path, :created_at, :updated_at
json.url blog_url(blog, format: :json)
