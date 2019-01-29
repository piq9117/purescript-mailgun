## Module Mailgun.Credentials

Programatically get and modify domain credentials

#### `Credentials`

``` purescript
data Credentials :: Type
```

#### `credentials`

``` purescript
credentials :: Domain -> Maybe String -> Credentials
```

#### `list`

``` purescript
list :: forall a. Credentials -> Callback a -> Effect Unit
```

Returns a list of SMTP credentials for the defined domain.

#### `create`

``` purescript
create :: forall a. Credentials -> CredentialsAttr -> Callback a -> Effect Unit
```

Creates a new set of SMTP credentials for the defined domain

#### `update`

``` purescript
update :: forall a. Credentials -> CredentialsAttr -> Callback a -> Effect Unit
```

Updates the specified SMTP credentials. Currently only the password can be changed.

#### `delete`

``` purescript
delete :: forall a. Credentials -> Callback a -> Effect Unit
```

Deletes the defined SMTP credentials.


