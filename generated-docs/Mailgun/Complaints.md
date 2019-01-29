## Module Mailgun.Complaints

This API allows you to programmatically download the list of users who have complained,
add a complaint, or delete a complaint.

#### `Complaints`

``` purescript
data Complaints :: Type
```

`Complaints` represents the complaints api.

#### `ComplaintsAttr`

``` purescript
type ComplaintsAttr = { address :: String, created_at :: Effect Date }
```

#### `complaints`

``` purescript
complaints :: Mailgun -> Maybe String -> Complaints
```

complaints api.

#### `list`

``` purescript
list :: forall a. Complaints -> Callback a -> Effect Unit
```

Fetches the list of complaints.

#### `create`

``` purescript
create :: forall a. Complaints -> ComplaintsAttr -> Callback a -> Effect Unit
```

Add an address to the complaints table.

#### `info`

``` purescript
info :: forall a. Complaints -> Callback a -> Effect Unit
```

Fetches a single spam complaint by a given email address.

#### `delete`

``` purescript
delete :: forall a. Complaints -> Callback a -> Effect Unit
```

Removes a given spam complaint.


