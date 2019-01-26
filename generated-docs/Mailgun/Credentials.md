## Module Mailgun.Credentials

Programatically get and modify domain credentials

#### `Credentials`

``` purescript
data Credentials :: Type
```

#### `credentialsImpl`

``` purescript
credentialsImpl :: Fn2 Domain (Nullable String) Credentials
```

#### `listImpl`

``` purescript
listImpl :: forall a. EffectFn2 Credentials (JSCallback a) Unit
```

#### `createImpl`

``` purescript
createImpl :: forall a. EffectFn3 Credentials Attr (JSCallback a) Unit
```

#### `updateImpl`

``` purescript
updateImpl :: forall a. EffectFn3 Credentials Attr (JSCallback a) Unit
```

#### `deleteImpl`

``` purescript
deleteImpl :: forall a. EffectFn2 Credentials (JSCallback a) Unit
```

#### `Attr`

``` purescript
type Attr = { login :: String, password :: String }
```

#### `credentials`

``` purescript
credentials :: Domain -> Maybe String -> Credentials
```

#### `credentialList`

``` purescript
credentialList :: forall a. Credentials -> Callback a -> Effect Unit
```

Returns a list of SMTP credentials for the defined domain.

#### `createCredentials`

``` purescript
createCredentials :: forall a. Credentials -> Attr -> Callback a -> Effect Unit
```

Creates a new set of SMTP credentials for the defined domain

#### `updateCredentials`

``` purescript
updateCredentials :: forall a. Credentials -> Attr -> Callback a -> Effect Unit
```

Updates the specified SMTP credentials. Currently only the password can be changed.

#### `deleteCredentials`

``` purescript
deleteCredentials :: forall a. Credentials -> Callback a -> Effect Unit
```

Deletes the defined SMTP credentials.


