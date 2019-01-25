module Mailgun.Domain
       ( Domain
       , domain
       , list
       )where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Domain :: Type

foreign import domainImpl :: Fn2 Mailgun (Nullable String) Domain
foreign import listImpl :: ∀ a. EffectFn2 Domain (JSCallback a) Unit

domain :: Mailgun -> Maybe String -> Domain
domain mg str = runFn2 domainImpl mg (toNullable str)

list :: ∀ a. Domain -> Callback a -> Effect Unit
list dom cb = runEffectFn2 listImpl dom (handleCallback cb)
