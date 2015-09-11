defmodule Braa.CommentView do
  use Braa.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Braa.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, Braa.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      body: comment.body,
      user_id: comment.user_id}
  end
end
