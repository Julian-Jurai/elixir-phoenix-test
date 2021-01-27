defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    # conn
    # |> put_layout("admin.html")
    # |> render("index.html")
    # render(conn, :index)

    # conn  
    # |> put_resp_content_type("text/plain")
    # |> send_resp(201, "")

    # conn  
    # |> put_status(202)
    # |> render("index.html")

    # redirect(conn, to: "/redirect_test")

    # conn
    # |> put_flash(:info, "Welcome the page")
    # |> put_flash(:error, "Error logging in.")
    # |> render("index.html")

    render(conn, "index.html")
  end

  def redirect_test(conn, _params) do 
    conn
    |> put_flash(:info, "Welcome the page. you've been redirected")
    |> render("index.html")
  end 
end
