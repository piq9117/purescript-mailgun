module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Mailgun

mlgun :: Mailgun
mlgun = mailgun "API_KEY" "DOMAIN"

msgs = messages mlgun

main :: Effect Unit
main = do
  log "You should add some tests."
