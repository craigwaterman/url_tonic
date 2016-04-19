defmodule UrlTonic.CanonV1Controller do
  use UrlTonic.Web, :controller

  def process_url(conn, %{"url" => url}) do
    result = UrlTincture.canonicalize_url(url)
    response = case result do
      {:error, _} -> %{error: "Unable to canonicalize input url."}
      %UrlTincture.Info{} -> result
    end
    json conn, response
  end
end
