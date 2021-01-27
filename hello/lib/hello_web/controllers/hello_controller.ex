defmodule HelloWeb.HelloController do 
    use HelloWeb, :controller

    def index(conn, _params) do 
        render(conn, "index.html")
    end 
    
    def show(conn, params) do 
        %{ "messenger" => messenger } = params
        # text(conn,  "From messeneger #{messenger}")
        # json(conn,  %{id: messenger})
        # html(conn, """
        # <html>
        #     <head>
        #         <title>Passing a Messenger</title>
        #     </head>
        #     <body>
        #     <p>From messenger #{Plug.HTML.html_escape(messenger)}</p>
        #     </body>
        # </html>
        # """)
        render(conn, "show.html", messenger: messenger)
    end 
end