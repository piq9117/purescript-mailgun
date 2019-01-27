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

#### `complaintsList`

``` purescript
complaintsList :: forall a. Complaints -> Callback a -> Effect Unit
```

Fetches the list of complaints.

#### `createComplaints`

``` purescript
createComplaints :: forall a. Complaints -> ComplaintsAttr -> Callback a -> Effect Unit
```

Add an address to the complaints table.

#### `complaintsInfo`

``` purescript
complaintsInfo :: forall a. Complaints -> Callback a -> Effect Unit
```

Fetches a single spam complaint by a given email address.

#### `deleteComplaint`

``` purescript
deleteComplaint :: forall a. Complaints -> Callback a -> Effect Unit
```

Removes a given spam complaint.


