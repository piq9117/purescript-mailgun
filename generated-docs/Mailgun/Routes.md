## Module Mailgun.Routes

Mailgun Routes are powerful way to handle the incoming traffic. This API
allows you to work with routes programmatically.

#### `Routes`

``` purescript
data Routes :: Type
```

#### `routesImpl`

``` purescript
routesImpl :: Fn2 Mailgun (Nullable String) Routes
```

#### `listImpl`

``` purescript
listImpl :: forall a. EffectFn2 Routes (JSCallback a) Unit
```

#### `infoImpl`

``` purescript
infoImpl :: forall a. EffectFn2 Routes (JSCallback a) Unit
```

#### `createImpl`

``` purescript
createImpl :: forall a. EffectFn3 Routes RoutesAttrExt (JSCallback a) Unit
```

#### `updateImpl`

``` purescript
updateImpl :: forall a. EffectFn3 Routes RoutesAttrExt (JSCallback a) Unit
```

#### `deleteImpl`

``` purescript
deleteImpl :: forall a. EffectFn2 Routes (JSCallback a) Unit
```

#### `RoutesAttrExt`

``` purescript
type RoutesAttrExt = { priority :: Int, description :: String, expression :: String, action :: String }
```

#### `RoutesAttr`

``` purescript
type RoutesAttr = { priority :: Int, description :: String, expression :: ExpressionFilters, action :: ActionTypes }
```

#### `ActionTypes`

``` purescript
data ActionTypes
  = Forward String
  | Stop String
  | Store String
```

#### `ExpressionFilters`

``` purescript
data ExpressionFilters
  = Recipient String
  | Header String
  | CatchAll String
```

#### `expressionFiltersToStr`

``` purescript
expressionFiltersToStr :: ExpressionFilters -> String
```

#### `actionTypesToStr`

``` purescript
actionTypesToStr :: ActionTypes -> String
```

#### `catchAll`

``` purescript
catchAll :: ExpressionFilters
```

#### `matchRecipient`

``` purescript
matchRecipient :: String -> ExpressionFilters
```

#### `stopAction`

``` purescript
stopAction :: ActionTypes
```

#### `forwardAction`

``` purescript
forwardAction :: String -> ActionTypes
```

#### `attrToExt`

``` purescript
attrToExt :: RoutesAttr -> RoutesAttrExt
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


