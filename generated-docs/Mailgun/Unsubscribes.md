## Module Mailgun.Unsubscribes

This API allows you to programmatically download the list of recipeints
who have unsubscribed from your emails. You can also programmatically
"clear" the unsubscribe event.

#### `Unsubscribes`

``` purescript
data Unsubscribes :: Type
```

#### `UnsubscribesAttr`

``` purescript
type UnsubscribesAttr = { address :: String, tag :: Maybe String, created_at :: Effect Date }
```

#### `unsubscribes`

``` purescript
unsubscribes :: Mailgun -> Maybe String -> Unsubscribes
```

unsubscribes api

#### `list`

``` purescript
list :: forall a. Unsubscribes -> Callback a -> Effect Unit
```

Fetches the list of unsubscribes.

#### `info`

``` purescript
info :: forall a. Unsubscribes -> Callback a -> Effect Unit
```

Retrieve a single unsubscribe record.

#### `delete`

``` purescript
delete :: forall a. Unsubscribes -> Callback a -> Effect Unit
```

Removes an addresss from the unsubscribes table.

#### `create`

``` purescript
create :: forall a. Unsubscribes -> UnsubscribesAttr -> Callback a -> Effect Unit
```

Adds address to unsubscribed table.


