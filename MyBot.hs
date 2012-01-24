module Main where

import Data.List
import Data.Maybe (mapMaybe)
import System.IO

import Ants
import qualified Logic

-- | Picks the first "passable" order in a list
-- returns Nothing if no such order exists
tryOrder :: World -> [Order] -> Maybe Order
tryOrder w = find (passable w)

-- | Generates orders for an Ant in all directions
generateOrders :: Ant -> [Order]
generateOrders a = map (Order a) [North .. West]

{- | 
 - Implement this function to create orders.
 - It uses the IO Monad so algorithms can call timeRemaining.
 -
 - GameParams data holds values that are constant throughout the game
 - GameState holds data that changes between each turn
 - for each see Ants module for more information
 -}
doTurn :: GameParams -> GameState -> IO [Order]
doTurn gp gs = do
    let men = myAnts $ ants gs
    let goals = food gs
    let goto = Logic.sender gp gs goals
    return $ mapMaybe goto men

-- | This runs the game
main :: IO ()
main = game doTurn

-- vim: set expandtab:
