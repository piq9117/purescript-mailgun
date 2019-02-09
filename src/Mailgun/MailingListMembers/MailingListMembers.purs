-- | Programmatically work with mailing list members.
module Mailgun.MailingListMembers
       ( Members
       , YesOrNo(..)
       , members
       , list
       , page
       , info
       , create
       , add
       , update
       , delete
       ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Mailgun.MailingList (MailingList)
import Prelude (Unit)

foreign import data Members :: Type
foreign import membersImpl :: Fn2 MailingList (Nullable String) Members
foreign import listImpl :: ∀ a. EffectFn2 Members (JSCallback a) Unit
foreign import pageImpl :: ∀ a. EffectFn2 Members (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Members (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Members MemberListAttrExt (JSCallback a) Unit
foreign import addImpl :: ∀ a. EffectFn3 Members (Array AddMembersAttr) (JSCallback a) Unit
foreign import updateImpl :: ∀ a. EffectFn3 Members MemberListAttrExt (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Members (JSCallback a) Unit

type AddMembersAttr =
  { name :: String
  , address :: String
  }

type MemberListAttrExt =
  { address :: String
  , name :: Nullable String
  , vars :: {}
  , subscribed :: String
  , upsert :: String
  }

data YesOrNo
  = Yes
  | No

type MemberListAttr =
  { address :: String
  , name :: Maybe String
  , vars :: {}
  , subscribed :: YesOrNo
  , upsert :: YesOrNo
  }

yesOrNoToStr :: YesOrNo -> String
yesOrNoToStr yn =
  case yn of
    Yes -> "yes"
    No -> "no"

attrToExt :: MemberListAttr -> MemberListAttrExt
attrToExt attr =
  { address: attr.address
  , name: (toNullable attr.name)
  , vars: attr.vars
  , subscribed: (yesOrNoToStr attr.subscribed)
  , upsert: (yesOrNoToStr attr.upsert)
  }

-- | members api.
members :: MailingList -> Maybe String -> Members
members ml str = runFn2 membersImpl ml (toNullable str)

-- | Fetches the list of maling list members.
list :: ∀ a. Members -> Callback a -> Effect Unit
list mem cb = runEffectFn2 listImpl mem (handleCallback cb)

-- | Paginate over list members in the given mailing list
page :: ∀ a. Members -> Callback a -> Effect Unit
page mem cb = runEffectFn2 pageImpl mem (handleCallback cb)

-- | Retrieve a mailing list member.
info :: ∀ a. Members -> Callback a -> Effect Unit
info mem cb = runEffectFn2 infoImpl mem (handleCallback cb)

-- | Adds a member to the maling list.
create :: ∀ a. Members -> MemberListAttr -> Callback a -> Effect Unit
create mem attr cb = runEffectFn3 createImpl mem (attrToExt attr) (handleCallback cb)

-- | Adds multiple members, up to 1,000 per call, to a Mailing List.
add :: ∀ a. Members -> Array AddMembersAttr -> Callback a -> Effect Unit
add mem attr cb = runEffectFn3 addImpl mem attr (handleCallback cb)

-- | Updates a mailing list member with give properties.
update :: ∀ a. Members -> MemberListAttr -> Callback a -> Effect Unit
update mem attr cb = runEffectFn3 updateImpl mem (attrToExt attr) (handleCallback cb)

-- | Delete a mailing list member.
delete :: ∀ a. Members ->  Callback a -> Effect Unit
delete mem cb = runEffectFn2 deleteImpl mem (handleCallback cb)
