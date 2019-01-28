## Module Mailgun.Tags

Deletes all counters for particular tag and the tag itself.

#### `Tags`

``` purescript
data Tags :: Type
```

#### `Aggregates`

``` purescript
data Aggregates :: Type
```

#### `Countries`

``` purescript
data Countries :: Type
```

#### `Providers`

``` purescript
data Providers :: Type
```

#### `Devices`

``` purescript
data Devices :: Type
```

#### `TagStats`

``` purescript
data TagStats :: Type
```

#### `tags`

``` purescript
tags :: Mailgun -> Maybe String -> Tags
```

tags api.

#### `info`

``` purescript
info :: forall a. Tags -> Callback a -> Effect Unit
```

Gets a specific tag.

#### `list`

``` purescript
list :: forall a. Tags -> Callback a -> Effect Unit
```

List all tags.

#### `aggregates`

``` purescript
aggregates :: Stats -> Aggregates
```

aggregates api.

#### `countries`

``` purescript
countries :: Aggregates -> Countries
```

countries api.

#### `countriesList`

``` purescript
countriesList :: forall a. Countries -> (Callback a) -> Effect Unit
```

Returns a list of countries of origin for a given doain for
different event types.

#### `providers`

``` purescript
providers :: Aggregates -> Providers
```

providers api.

#### `providersList`

``` purescript
providersList :: forall a. Providers -> Callback a -> Effect Unit
```

Returns a list of email providers for a given domain for different
event types.

#### `devices`

``` purescript
devices :: Aggregates -> Devices
```

devices api

#### `devicesList`

``` purescript
devicesList :: forall a. Devices -> Callback a -> Effect Unit
```

Returns a list of devices for a given domain that have triggered event types.

#### `delete`

``` purescript
delete :: forall a. Tags -> Callback a -> Effect Unit
```

Deletes all counters for particular tag and the tag itself.

#### `tagStats`

``` purescript
tagStats :: Stats -> TagStats
```

tag stats api.

#### `tagStatsInfo`

``` purescript
tagStatsInfo :: forall a. TagStats -> Callback a -> Effect Unit
```

Returns statistics for a given tag.


