## Module Mailgun.Routes

Mailgun Routes are powerful way to handle the incoming traffic. This API
allows you to work with routes programmatically.

#### `Routes`

``` purescript
data Routes :: Type
```

#### `RoutesAttr`

``` purescript
type RoutesAttr = { priority :: Int, description :: String, expression :: ExpressionFilters, action :: ActionTypes }
```

#### `ActionTypes`

``` purescript
data ActionTypes
```

#### `ExpressionFilters`

``` purescript
data ExpressionFilters
```

#### `routes`

``` purescript
routes :: Mailgun -> Maybe String -> Routes
```

routes api

#### `list`

``` purescript
list :: forall a. Routes -> Callback a -> Effect Unit
```

Fetches the list of routes

#### `info`

``` purescript
info :: forall a. Routes -> Callback a -> Effect Unit
```

Returns a single route object based on its ID.

#### `create`

``` purescript
create :: forall a. Routes -> RoutesAttr -> Callback a -> Effect Unit
```

Create a new route.

#### `update`

``` purescript
update :: forall a. Routes -> RoutesAttr -> Callback a -> Effect Unit
```

Updates a given route by ID.

#### `delete`

``` purescript
delete :: forall a. Routes -> Callback a -> Effect Unit
```

Deletes a route baed on the ID.


