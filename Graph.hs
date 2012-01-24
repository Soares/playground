module Graph where

import Data.Graph.AStar (aStar)
import Data.Set (Set, fromList)
import Ants

type Graph = Point -> Set Point
type Distance = Integer

world2graph :: World -> Graph
world2graph w p = fromList $ map (w %!%) points where
    n = (row p + 1, col p)
    s = (row p - 1, col p)
    e = (row p, col p + 1)
    t = (row p, col p - 1)
    valid point = tile (w %! point) /= Water
    points = filter valid [n, s, e, t]

shortestPath :: GameParams -> World -> -- The world to search through
                Point ->               -- Where we start
                [Point] ->             -- Places we'd like to go
                Maybe [Point]          -- A path to one of the places, if it exists
shortestPath gp w start goals =
    if length goals == 0 then Nothing
    else aStar graph (fakedist) (guesser) (isGoal) start where
        fakedist = const $ const 1
        graph = world2graph w
        bounds = (rows gp, cols gp)
        dist = (realDistance w)
        guesser p = minimum $ map (dist p) goals
        isGoal g = g `elem` goals
