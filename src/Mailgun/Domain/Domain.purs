module Mailgun.Domain
       ( Domain
       , domain
       , list
       )where

import Data.Function.Uncurried

import Data.Maybe (Maybe)
import Effect (Effect)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Domain :: Type

foreign import domainImpl :: Fn2 Mailgun (Maybe String) Domain
foreign import listImpl :: ∀ a. Fn2 Domain (JSCallback a) (Effect Unit)

domain :: Mailgun -> Maybe String -> Domain
domain = runFn2 domainImpl

list :: ∀ a. Domain -> Callback a -> Effect Unit
list dom cb = runFn2 listImpl dom (handleCallback cb)
