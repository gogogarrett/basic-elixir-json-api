defmodule Braa.CommentSerializer do
  use JaSerializer

  attributes [:body]
end

defmodule Braa.UserView do
  use Braa.Web, :view
  use JaSerializer.PhoenixView

  location "/users/:id"
  attributes [:name, :age, :l_name, :bio]

  has_many :comments, include: Braa.CommentSerializer, field: :body

  def comments(model, _conn) do
    model.comments
  end

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Braa.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Braa.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      age: user.age}
  end
end
