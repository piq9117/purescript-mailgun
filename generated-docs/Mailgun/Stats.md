## Module Mailgun.Stats

Various data and events for your mailgun account.
See http://documentation.mailgun.com/api-stats.html

#### `Stats`

``` purescript
data Stats :: Type
```

#### `stats`

``` purescript
stats :: Mailgun -> Stats
```

stats api.

#### `list`

``` purescript
list :: forall a. Stats -> Callback a -> Effect Unit
```

Returns a list of event stat items. Each record represents counts for
one event per day.


