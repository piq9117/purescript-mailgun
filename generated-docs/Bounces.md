## Module Bounces

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

#### `list`

``` purescript
list :: forall a. Bounces -> Callback a -> Effect Unit
```

#### `info`

``` purescript
info :: forall a. Bounces -> Callback a -> Effect Unit
```

#### `delete`

``` purescript
delete :: forall a. Bounces -> Callback a -> Effect Unit
```

#### `create`

``` purescript
create :: forall a. Bounces -> BouncesAttr -> Callback a -> Effect Unit
```


