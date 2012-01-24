module Logic where

import Data.List
import Data.Maybe (mapMaybe)
import System.IO
import Debug.Trace (trace)

import Knobs
import Graph
import Ants

point2order :: Ant -> Point -> Order
point2order a p | (row $ point a) > (row p) = Order a North
                | (row $ point a) < (row p) = Order a South
                | (col $ point a) > (col p) = Order a West
                | otherwise                 = Order a East

sender :: GameParams -> GameState ->
          [Point] -> Ant ->
          Maybe Order
sender gp gs foodList ant = do
    path <- shortestPath gp (world gs) (point ant) foodList
    return $ point2order ant (head $ trace (show path) path)
