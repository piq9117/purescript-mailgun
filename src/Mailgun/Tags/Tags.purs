-- Deletes all counters for particular tag and the tag itself.
-- See http://documentation.mailgun.com/api-stats.html
module Mailgun.Tags
       ( Tags
       , tags
       , list
       ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Mailgun (Mailgun)
import Mailgun.Common (JSCallback, handleCallback, Callback)
import Prelude (Unit)
import Effect (Effect)

foreign import data Tags :: Type

foreign import tagsImpl :: Fn2 Mailgun (Nullable String) Tags
foreign import listImpl :: ∀ a. EffectFn2 Tags (JSCallback a) Unit

tags :: Mailgun -> Maybe String -> Tags
tags mailgun str = runFn2 tagsImpl mailgun (toNullable str)

list :: ∀ a. Tags -> Callback a -> Effect Unit
list tgs cb = runEffectFn2 listImpl tgs (handleCallback cb)
