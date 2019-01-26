## Module Mailgun.Domain

#### `Domain`

``` purescript
data Domain :: Type
```

#### `DomainAttr`

``` purescript
type DomainAttr = { name :: String, smtp_password :: String, spam_action :: SpamAction, wildcard :: Boolean, force_dkim_authority :: Boolean, dkim_key_size :: DkimSize, ips :: String }
```

#### `Attr`

``` purescript
type Attr = { name :: String, smtp_password :: String, spam_action :: String, wildcard :: Boolean, force_dkim_authority :: Boolean, dkim_key_size :: Int, ips :: String }
```

#### `SpamAction`

``` purescript
data SpamAction
  = Disabled
  | Block
  | Tag
```

#### `DkimSize`

``` purescript
data DkimSize
  = Big
  | Small
```

#### `domain`

``` purescript
domain :: Mailgun -> Maybe String -> Domain
```

This API allows you to create, access, and validate domains
programmcatically.

#### `domainList`

``` purescript
domainList :: forall a. Domain -> Callback a -> Effect Unit
```

Returns a list of domains under your accoung in JSON.

#### `domainInfo`

``` purescript
domainInfo :: forall a. Domain -> Callback a -> Effect Unit
```

Returns a single domain, includeing credentials and DNS records.

#### `createDomain`

``` purescript
createDomain :: forall a. Domain -> DomainAttr -> Callback a -> Effect Unit
```

Create a new domain.

#### `deleteDomain`

``` purescript
deleteDomain :: forall a. Domain -> Callback a -> Effect Unit
```

Delete a domain from your account

#### `verifyDomain`

``` purescript
verifyDomain :: forall a. Domain -> DomainAttr -> Callback a -> Effect Unit
```

Verifies and retursn a single domain, including credentials and DNS records.


