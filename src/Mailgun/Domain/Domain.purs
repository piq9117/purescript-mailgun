module Mailgun.Domain
       ( Domain
       , domain
       , list
       )where

import Data.Function.Uncurried

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Domain :: Type

foreign import domainImpl :: Fn2 Mailgun (Nullable String) Domain
foreign import listImpl :: ∀ a. Fn2 Domain (JSCallback a) (Effect Unit)

domain :: Mailgun -> Maybe String -> Domain
domain mg str = runFn2 domainImpl mg (toNullable str)

list :: ∀ a. Domain -> Callback a -> Effect Unit
list dom cb = runFn2 listImpl dom (handleCallback cb)
