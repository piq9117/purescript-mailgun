## Module Mailgun.Bounces

Mailgun automatically handles bounced emails. The list of bounced
address can be accessed programmatically.

#### `Bounces`

``` purescript
data Bounces :: Type
```

#### `BouncesAttr`

``` purescript
type BouncesAttr = { address :: String, code :: Int, error :: String, created_at :: Effect Date }
```

#### `bounces`

``` purescript
bounces :: Mailgun -> Maybe String -> Bounces
```

bounces api.

#### `list`

``` purescript
list :: forall a. Bounces -> Callback a -> Effect Unit
```

Fetches the list of bounces.

#### `info`

``` purescript
info :: forall a. Bounces -> Callback a -> Effect Unit
```

Fetches a single bounces event by a given email address.

#### `delete`

``` purescript
delete :: forall a. Bounces -> Callback a -> Effect Unit
```

Clears a given bounce event.

#### `create`

``` purescript
create :: forall a. Bounces -> BouncesAttr -> Callback a -> Effect Unit
```

Adds a permanent bounce to the bounces table. Updates the existing record
if alread here.


