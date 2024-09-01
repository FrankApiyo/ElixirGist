# ElixirGist clone

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Contexts in this project were created by running the following commands:

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

```console
mix phx.gen.auth Accounts User users
mix phx.gen.context Gists Gist gists user_id:references:users name:string description:text markup_text:text
mix phx.gen.context  Gists SavedGist saved_gists user_id:references:users gist_id:references:gists
mix phx.gen.context Comments Comment comments user_id:references:users gist_id:references:gists markup_text:text
```

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
