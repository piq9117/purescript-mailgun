-- | This API allows you to programmatically download the list of users who have complained,
-- | add a complaint, or delete a complaint.
module Mailgun.Complaints
       ( Complaints
       , ComplaintsAttr
       , complaints
       , list
       , create
       , info
       , delete
       ) where

import Data.Date

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

-- | `Complaints` represents the complaints api.
foreign import data Complaints :: Type

foreign import complaintsImpl :: Fn2 Mailgun (Nullable String) Complaints
foreign import listImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Complaints ComplaintsAttr (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit

type ComplaintsAttr =
  { address :: String
  , created_at :: Effect Date
  }

-- | complaints api.
complaints :: Mailgun -> Maybe String -> Complaints
complaints m addr = runFn2 complaintsImpl m (toNullable addr)

-- | Fetches the list of complaints.
list :: ∀ a. Complaints -> Callback a -> Effect Unit
list com cb = runEffectFn2 listImpl com (handleCallback cb)

-- | Add an address to the complaints table.
create :: ∀ a. Complaints -> ComplaintsAttr -> Callback a -> Effect Unit
create com attr cb =
  runEffectFn3 createImpl com attr (handleCallback cb)

-- | Fetches a single spam complaint by a given email address.
info :: ∀ a. Complaints -> Callback a -> Effect Unit
info com cb = runEffectFn2 infoImpl com (handleCallback cb)

-- | Removes a given spam complaint.
delete :: ∀ a. Complaints -> Callback a -> Effect Unit
delete com cb = runEffectFn2 deleteImpl com (handleCallback cb)
