## Module Mailgun.Tracking

Programmatically get and modify domain tracking settings.

#### `Tracking`

``` purescript
data Tracking :: Type
```

#### `OpenTracking`

``` purescript
data OpenTracking :: Type
```

#### `ClickTracking`

``` purescript
data ClickTracking :: Type
```

#### `UnsubscribeTracking`

``` purescript
data UnsubscribeTracking :: Type
```

#### `IsActive`

``` purescript
data IsActive
  = Yes
  | No
  | HTML
```

#### `tracking`

``` purescript
tracking :: Domain -> Tracking
```

Tracking api

#### `info`

``` purescript
info :: forall a. Tracking -> (Callback a) -> Effect Unit
```

Returns tracking settings for a domain.

#### `openTracking`

``` purescript
openTracking :: Tracking -> OpenTracking
```

Open Tracking api.

#### `clickTracking`

``` purescript
clickTracking :: Tracking -> ClickTracking
```

Click Tracking api

#### `updateOpenTracking`

``` purescript
updateOpenTracking :: forall a. OpenTracking -> TrackingAttr -> Callback a -> Effect Unit
```

Updates the open tracking settings for a domain.

#### `updateClickTracking`

``` purescript
updateClickTracking :: forall a. ClickTracking -> TrackingAttr -> Callback a -> Effect Unit
```

Updates the click tracking settings for a domain.

#### `unsubscribeTracking`

``` purescript
unsubscribeTracking :: Tracking -> UnsubscribeTracking
```

Unsubscribe tracking api.

#### `updateUnsubTracking`

``` purescript
updateUnsubTracking :: forall a. UnsubscribeTracking -> UnsubscribeAttr -> (Callback a) -> Effect Unit
```

Updates the unsubscribe tracking settings for domain.


