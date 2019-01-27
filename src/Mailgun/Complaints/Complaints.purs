module Complaints where

import Data.Date

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)
foreign import data Complaints :: Type

foreign import complaintsImpl :: Fn2 Mailgun (Nullable String) Complaints
foreign import listImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Complaints Attr (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Complaints (JSCallback a) Unit

type Attr =
  { address :: String
  , created_at :: Effect Date
  }

complaints :: Mailgun -> Maybe String -> Complaints
complaints m addr = runFn2 complaintsImpl m (toNullable addr)

complaintsList :: ∀ a. Complaints -> Callback a -> Effect Unit
complaintsList com cb = runEffectFn2 listImpl com (handleCallback cb)

createComplaints :: ∀ a. Complaints -> Attr -> Callback a -> Effect Unit
createComplaints com attr cb =
  runEffectFn3 createImpl com attr (handleCallback cb)

complaintsInfo :: ∀ a. Complaints -> Callback a -> Effect Unit
complaintsInfo com cb = runEffectFn2 infoImpl com (handleCallback cb)

deleteComplaint :: ∀ a. Complaints -> Callback a -> Effect Unit
deleteComplaint com cb = runEffectFn2 deleteImpl com (handleCallback cb)
