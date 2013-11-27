{- git-annex v4 -> v5 uppgrade support
 -
 - Copyright 2013 Joey Hess <joey@kitenet.net>
 -
 - Licensed under the GNU GPL version 3 or higher.
 -}

module Upgrade.V4 where

import Common.Annex
import Config
import Annex.Direct

{- Direct mode only upgrade. -}
upgrade :: Bool -> Annex Bool
upgrade automatic = ifM isDirect
	( do
		unless automatic $
			showAction "v4 to v5"
		setDirect True
		return True
	, return False
	)
