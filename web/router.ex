defmodule UrlTonic.Router do
  use UrlTonic.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UrlTonic do
    pipe_through :api

    get "/", CanonV1Controller, :process_url
  end

  scope "/api/v1", UrlTonic do
    pipe_through :api

    get "/canonicalize", CanonV1Controller, :process_url
  end
end
