-- | Query events that happen to your emails.
-- | See. http://documentation.mailgun.com/api-events.html
module Mailgun.Events
       ( Events
       , events
       , get
       ) where

import Mailgun.Common

import Data.Function.Uncurried (Fn1, runFn1)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Mailgun (Mailgun)
import Prelude (Unit)

foreign import data Events :: Type

foreign import eventsImpl :: Fn1 Mailgun Events
foreign import getImpl :: ∀ a. EffectFn2 Events (JSCallback a) Unit

-- | events api.
events :: Mailgun -> Events
events = runFn1 eventsImpl

-- | Queries event records.
get :: ∀ a. Events -> (Callback a) -> Effect Unit
get e cb = runEffectFn2 getImpl e (handleCallback cb)
