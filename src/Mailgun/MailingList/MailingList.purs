-- | Programmatically work with mailing lists and mailing list memebers
-- | using Mailgun Mailing List API.
module Mailgun.MailingList
       ( MailingList
       , AccessLevel
       , list
       , info
       , create
       , update
       , delete
       ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data MailingList :: Type
foreign import mailingListImpl :: Fn2 Mailgun (Nullable String) MailingList
foreign import listImpl :: ∀ a. EffectFn2 MailingList (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 MailingList (JSCallback a) Unit
foreign import createImpl
  :: ∀ a. EffectFn3 MailingList MailingListAttrExt (JSCallback a) Unit
foreign import updateImpl
  :: ∀ a. EffectFn3 MailingList MailingListAttrExt (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 MailingList (JSCallback a) Unit

type MailingListAttrExt =
  { address :: Nullable String
  , name :: Nullable String
  , description :: Nullable String
  , access_level :: String
  }

type MailingListAttr =
  { address :: Maybe String
  , name :: Maybe String
  , description :: Maybe String
  , access_level :: AccessLevel
  }

data AccessLevel
  = Readonly String
  | Members String
  | Everyone String

accessLvlToStr :: AccessLevel -> String
accessLvlToStr acc =
  case acc of
    Readonly s -> s
    Members s -> s
    Everyone s -> s

attrToExt :: MailingListAttr -> MailingListAttrExt
attrToExt attr =
  { address: (toNullable attr.address)
  , name: (toNullable attr.name)
  , description: (toNullable attr.description)
  , access_level: (accessLvlToStr attr.access_level)
  }

-- | mailing list api.
mailingList :: Mailgun -> Maybe String -> MailingList
mailingList mlg str = runFn2 mailingListImpl mlg (toNullable str)

-- | Returns a list of mailing lists under your account.
list :: ∀ a. MailingList -> Callback a -> Effect Unit
list ml cb = runEffectFn2 listImpl ml (handleCallback cb)

-- | Returns a single mailing list by a given address.
info :: ∀ a. MailingList -> Callback a -> Effect Unit
info ml cb = runEffectFn2 infoImpl ml (handleCallback cb)

-- | Create a new mailing list.
create :: ∀ a. MailingList -> MailingListAttr -> Callback a -> Effect Unit
create ml attr cb =
  runEffectFn3 createImpl ml (attrToExt attr) (handleCallback cb)

-- | Update mailing list properties, such as address, description or name.
update :: ∀ a. MailingList -> MailingListAttr -> Callback a -> Effect Unit
update ml attr cb =
  runEffectFn3 updateImpl ml (attrToExt attr) (handleCallback cb)

-- | Deletes a mailing list.
delete :: ∀ a. MailingList -> Callback a -> Effect Unit
delete ml cb = runEffectFn2 deleteImpl ml (handleCallback cb)
