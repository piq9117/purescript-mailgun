-- | Mailgun Routes are powerful way to handle the incoming traffic. This API
-- | allows you to work with routes programmatically.
module Mailgun.Routes
       ( Routes
       , RoutesAttr
       , ActionTypes
       , ExpressionFilters
       , routes
       , list
       , info
       , create
       , update
       , delete
       ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Monoid ((<>))
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Mailgun (Mailgun)
import Mailgun.Common (Callback, JSCallback, handleCallback)
import Prelude (Unit)

foreign import data Routes :: Type

foreign import routesImpl :: Fn2 Mailgun (Nullable String) Routes
foreign import listImpl :: ∀ a. EffectFn2 Routes (JSCallback a) Unit
foreign import infoImpl :: ∀ a. EffectFn2 Routes (JSCallback a) Unit
foreign import createImpl :: ∀ a. EffectFn3 Routes RoutesAttrExt (JSCallback a) Unit
foreign import updateImpl :: ∀ a. EffectFn3 Routes RoutesAttrExt (JSCallback a) Unit
foreign import deleteImpl :: ∀ a. EffectFn2 Routes (JSCallback a) Unit

type RoutesAttrExt =
  { priority :: Int
  , description :: String
  , expression :: String
  , action :: String
  }

type RoutesAttr =
  { priority :: Int
  , description :: String
  , expression :: ExpressionFilters
  , action :: ActionTypes
  }

data ActionTypes
  = Forward String
  | Stop String
  | Store String

data ExpressionFilters
  = Recipient String
  | Header String
  | CatchAll String

expressionFiltersToStr :: ExpressionFilters -> String
expressionFiltersToStr exp =
  case exp of
    Recipient s -> s
    Header s -> s
    CatchAll s -> s

actionTypesToStr :: ActionTypes -> String
actionTypesToStr act =
  case act of
    Forward s -> s
    Stop s -> s
    Store s -> s

catchAll :: ExpressionFilters
catchAll = CatchAll "catch_all()"

matchRecipient :: String -> ExpressionFilters
matchRecipient patt = Recipient ("match_recipient('" <> patt <> "')")

stopAction :: ActionTypes
stopAction = Stop "stop()"

forwardAction :: String -> ActionTypes
forwardAction url = Forward ("forward('" <> url <> "')")

attrToExt :: RoutesAttr -> RoutesAttrExt
attrToExt attr =
  { priority: attr.priority
  , description: attr.description
  , expression:(expressionFiltersToStr attr.expression)
  , action: (actionTypesToStr attr.action)
  }

-- | routes api
routes :: Mailgun -> Maybe String -> Routes
routes mlg str = runFn2 routesImpl mlg (toNullable str)

-- | Fetches the list of routes
list :: ∀ a. Routes -> Callback a -> Effect Unit
list rout cb = runEffectFn2 listImpl rout (handleCallback cb)

-- | Returns a single route object based on its ID.
info :: ∀ a. Routes -> Callback a -> Effect Unit
info rout cb = runEffectFn2 infoImpl rout (handleCallback cb)

-- | Create a new route.
create :: ∀ a. Routes -> RoutesAttr -> Callback a -> Effect Unit
create rout attr cb = runEffectFn3 createImpl rout (attrToExt attr) (handleCallback cb)

-- | Updates a given route by ID.
update :: ∀ a. Routes -> RoutesAttr -> Callback a -> Effect Unit
update rout attr cb = runEffectFn3 updateImpl rout (attrToExt attr) (handleCallback cb)

-- | Deletes a route baed on the ID.
delete :: ∀ a. Routes -> Callback a -> Effect Unit
delete rout cb = runEffectFn2 deleteImpl rout (handleCallback cb)
