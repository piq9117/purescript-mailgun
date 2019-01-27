-- | Various data and events for your mailgun account.
-- | See http://documentation.mailgun.com/api-stats.html
module Mailgun.Stats
       ( Stats
       , stats
       , list
       ) where

import Data.Function.Uncurried

import Effect.Uncurried (EffectFn2, runEffectFn2)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)
import Effect (Effect)
foreign import data Stats :: Type

foreign import statsImpl :: Fn1 Mailgun Stats
foreign import listImpl :: ∀ a. EffectFn2 Stats (JSCallback a) Unit

-- | stats api.
stats :: Mailgun -> Stats
stats = runFn1 statsImpl

-- | Returns a list of event stat items. Each record represents counts for
-- | one event per day.
list :: ∀ a. Stats -> Callback a -> Effect Unit
list s cb = runEffectFn2 listImpl s (handleCallback cb)
