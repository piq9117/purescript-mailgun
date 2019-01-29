## Module Mailgun.Events

Query events that happen to your emails.
See. http://documentation.mailgun.com/api-events.html

#### `Events`

``` purescript
data Events :: Type
```

#### `events`

``` purescript
events :: Mailgun -> Events
```

events api.

#### `get`

``` purescript
get :: forall a. Events -> (Callback a) -> Effect Unit
```

Queries event records.


