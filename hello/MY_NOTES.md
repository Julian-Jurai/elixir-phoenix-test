Ecto  allows Pheonix to talk with data stores such as pg

`mix deps.get` - Gets all out of date dependencies, i.e. dependencies that are not available or have an invalid lock.

`mix ecto.create` - This task will create the database specified in our repo.

`mix ecto.reset` - Reset DB

`mix phx.server` -  start server

`iex -S mix phx.server` -  start server with iex opened

`mix phx.routes` -  list routes

`mix phx.gen.schema User users name:string email:string` - generate schema

`mix phx.gen.context` similar to  mix phx.gen.html without web files

There's a dependency issue with webpack 5/4 solved with:
`cd assets/ && npm install`



# Directory Structure

`/lib/my_app` - model (Business Logic)
`/lib/my_app_web` - view and controller
`/priv` - assets necessary for production but not directly related to source code e.g translation files, db scripts etc.
`/test` - all application tests, mirrors directory structure in `lib`

`endpoints.ex` - entry point for http request
`telemetry.ex` - manages telemetry processes
`getttext.ex` - internationalization through Gettext module


# Request life cycle

Controller, View and Template must have the same naming convention: `HelloController`, `HelloView` and `/hello` respectively.

`.eex` - embeded elixir

`plug` - middleware for request processing

Keys to `params` will always be strings

`@my_var` stand for `assigns.my_var` in views

# Plug

Core components like Endpoints, Routers and Controllers are Plugs internally

Plugs are an abstraction for a connection adapters of different web servers
Plug is a specification for composable modules in between web applications.

By abiding by the plug contract, we turn an application request into a series of explicit transformations. 

[Plug vs Rack](http://avni510.github.io/2017/06/16/plug-v-rack.html)
Essentially the Plug architechture is like a chain 

See https://medium.com/whynotio/what-is-rack-in-ruby-7e0615f1d9b6

and https://medium.com/the-plug/whats-in-the-plug-a-look-into-elixir-s-plug-library-7fd8fb856c0a

2 types of plugs Function plugs and module plugs

A function that is a plug takes in a connection and outputs a connection

A module plug lets us define a connection transformation in a module. It needs to implement a `init/1`, `call/2`. 

A module plug is better for reusability purpose. It's best practice to always consider the scope of use of a plug before writing any plug.

Plugs can be added to the endpoint, router and controllers.

Endpoints organize all the plugs common to every request, and apply them before dispatching into the router with its custom pipelines


In the Router, we can declare plugs inside pipelines. Routes are defined in `scope`s and `scope`s may `pipe_through` mutltiple `pipleline`s. `plug`s are defined in `pipeline`s

Controller Plugs  provide a feature that allows us to execute plugs only within certain actions. Controller plugs can be thought of as a similar constuct to before_action hooks in rails 

# Routing

Routers mathc HTTP requests to controller actions, wire up real-time channel handlers and define pipeline transforms scoped to sets of routes

Tips on path helpers

`*_path` - gives the relative path e.g users_path
`*_url` - gives the absolute url e.g users_url

Whenever possible prefer to pass a conn (or @conn in your views) in place of an Endpoint.

`Routes.user_url(conn, :index)` instead of `Routes.user_url(Endpoint, :index)`

Helper module is only automatically aliased for views, templates and controllers. 

When we have scoped routes that share a name, there maybe overlapping path helper names, in that case use the `as:` keyword to adjust the path helper name of the scoped routes
e.g.
`scope "/admin", HelloWeb.Admin, as: :admin do`

The use of nested scopes is discouraged


Pipelines themselves are plugs so we can plug pipelines in pipelines via the `plug` macro

`forward` is a macro that can be used to forward request to a `plug` 

# Controllers
If we find our selves looking for things the controllers don't provide we might be looking for a plug

Actions conventions:
index - renders a list of all items of the given resource type
show - renders an individual item by id
new - renders a form for creating a new item
create - receives params for one new item and saves it in a datastore
edit - retrieves an individual item by id and displays it in a form for editing
update - receives params for one edited item and saves it to a datastore
delete - receives an id for an item to be deleted and deletes it from a datastore


`_format` is a special query param used to determine the response format via `Phoenix.Controller.get_format/1`. This is analgous to the content type header

we can use `with` and `action_fallback` in controllers

# Views
if you define a function in your view, you will be able to invoke it directly from the template. Let's see this in practice.\

A template is essentially compiled to a render function that accepts a template name and an assigns.At compile-time, Phoenix precompiles all *.html.eex templates and turns them into render/2 function clauses on their respective view modules. At runtime, all templates are already loaded in memory. 


# Ecto

Phoenix uses Ecto to provide builtin support for data persistance

Changesets define a pipeline of transformations our data needs to undergo before it will be ready for our application to use. These transformations might include type-casting, user input validation, and filtering out any extraneous parameters