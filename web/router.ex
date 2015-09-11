defmodule Braa.Router do
  use Braa.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
    # plug PlugCors, [origins: ["localhost:4200"]]
    plug PlugCors, origins: ["*"]
  end

  scope "/", Braa do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", Braa do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
  end
end
