module Mailgun.Domain
       ( Domain
       , DomainAttr
       , Attr
       , SpamAction(..)
       , DkimSize(..)
       , domain
       , list
       , info
       , create
       , delete
       , verify
       ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Domain :: Type
foreign import domainImpl :: Fn2 Mailgun (Nullable String) Domain
foreign import listImpl :: ∀ a. EffectFn2 Domain (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Domain (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Domain Attr (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Domain (JSCallback a) Unit
foreign import verifyImpl :: ∀ a. EffectFn3 Domain Attr (JSCallback a) Unit

type Attr =
  { name :: String
  , smtp_password :: String
  , spam_action :: String
  , wildcard :: Boolean
  , force_dkim_authority :: Boolean
  , dkim_key_size :: Int
  , ips :: String
  }

data SpamAction
  = Disabled
  | Block
  | Tag

data DkimSize
  = Big
  | Small

type DomainAttr =
  { name :: String
  , smtp_password :: String
  , spam_action :: SpamAction
  , wildcard :: Boolean
  , force_dkim_authority :: Boolean
  , dkim_key_size :: DkimSize
  , ips :: String
  }

dkimToInt :: DkimSize -> Int
dkimToInt d =
  case d of
    Big -> 2048
    Small -> 1048

spamActionToStr :: SpamAction -> String
spamActionToStr s =
  case s of
    Disabled -> "disabled"
    Block -> "block"
    Tag -> "tag"

domToAttr :: DomainAttr -> Attr
domToAttr attr =
  { name: attr.name
  , smtp_password: attr.smtp_password
  , spam_action: (spamActionToStr attr.spam_action)
  , wildcard: attr.wildcard
  , force_dkim_authority: attr.force_dkim_authority
  , dkim_key_size: (dkimToInt attr.dkim_key_size)
  , ips: attr.ips
  }

-- | This API allows you to create, access, and validate domains
-- | programmcatically.
domain :: Mailgun -> Maybe String -> Domain
domain mg str = runFn2 domainImpl mg (toNullable str)

-- | Returns a list of domains under your accoung in JSON.
list :: ∀ a. Domain -> Callback a -> Effect Unit
list dom cb = runEffectFn2 listImpl dom (handleCallback cb)

-- | Returns a single domain, includeing credentials and DNS records.
info :: ∀ a. Domain -> Callback a -> Effect Unit
info dom cb = runEffectFn2 infoImpl dom (handleCallback cb)

-- | Create a new domain.
create :: ∀ a. Domain -> DomainAttr -> Callback a -> Effect Unit
create dom attr cb =
  runEffectFn3 createImpl dom (domToAttr attr) (handleCallback cb)

-- | Delete a domain from your account
delete :: ∀ a. Domain -> Callback a -> Effect Unit
delete dom cb = runEffectFn2 deleteImpl dom (handleCallback cb)

-- | Verifies and retursn a single domain, including credentials and DNS records.
verify :: ∀ a. Domain -> DomainAttr -> Callback a -> Effect Unit
verify dom attr cb =
  runEffectFn3 verifyImpl dom (domToAttr attr) (handleCallback cb)
