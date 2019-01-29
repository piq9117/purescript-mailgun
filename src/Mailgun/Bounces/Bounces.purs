-- | Mailgun automatically handles bounced emails. The list of bounced
-- | address can be accessed programmatically.
module Bounces
       ( Bounces
       , BouncesAttr
       , bounces
       , list
       , info
       , delete
       , create
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

foreign import data Bounces :: Type

foreign import bouncesImpl :: Fn2 Mailgun (Nullable String) Bounces
foreign import listImpl :: ∀ a. EffectFn2 Bounces (JSCallback a) Unit
foreign import infoImpl :: ∀ a.  EffectFn2 Bounces (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Bounces (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Bounces BouncesAttr (JSCallback a) Unit

type BouncesAttr =
  { address :: String
  , code :: Int
  , error :: String
  , created_at :: Effect Date
  }

bounces :: Mailgun -> Maybe String -> Bounces
bounces mg str = runFn2 bouncesImpl mg (toNullable str)

list :: ∀ a. Bounces -> Callback a -> Effect Unit
list b cb = runEffectFn2 listImpl b (handleCallback cb)

info :: ∀ a. Bounces -> Callback a -> Effect Unit
info b cb = runEffectFn2 infoImpl b (handleCallback cb)

delete :: ∀ a. Bounces -> Callback a -> Effect Unit
delete b cb = runEffectFn2 deleteImpl b (handleCallback cb)

create :: ∀ a. Bounces -> BouncesAttr -> Callback a -> Effect Unit
create b attr cb = runEffectFn3 createImpl b attr (handleCallback cb)
