## Module Mailgun.MailingList

Programmatically work with mailing lists and mailing list memebers
using Mailgun Mailing List API.

#### `MailingList`

``` purescript
data MailingList :: Type
```

#### `AccessLevel`

``` purescript
data AccessLevel
  = Readonly
  | Members
  | Everyone
```

#### `mailingList`

``` purescript
mailingList :: Mailgun -> Maybe String -> MailingList
```

mailing list api.

#### `list`

``` purescript
list :: forall a. MailingList -> Callback a -> Effect Unit
```

Returns a list of mailing lists under your account.

#### `info`

``` purescript
info :: forall a. MailingList -> Callback a -> Effect Unit
```

Returns a single mailing list by a given address.

#### `create`

``` purescript
create :: forall a. MailingList -> MailingListAttr -> Callback a -> Effect Unit
```

Create a new mailing list.

#### `update`

``` purescript
update :: forall a. MailingList -> MailingListAttr -> Callback a -> Effect Unit
```

Update mailing list properties, such as address, description or name.

#### `delete`

``` purescript
delete :: forall a. MailingList -> Callback a -> Effect Unit
```

Deletes a mailing list.


