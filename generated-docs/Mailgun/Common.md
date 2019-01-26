## Module Mailgun.Common

#### `JSCallback`

``` purescript
type JSCallback a = Fn2 (Nullable Error) a Unit
```

#### `Callback`

``` purescript
type Callback a = Either Error a -> Effect Unit
```

#### `handleCallback`

``` purescript
handleCallback :: forall a. (Callback a) -> JSCallback a
```


