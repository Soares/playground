module Knobs where

-- How many turns we look into the future.
-- Tweak to use the amount of time to your best advantage.
horizon = 27

-- How much to adjust the value of food each turn
-- Tracks the deprecation of getting food later rather than earlier. It's
-- percentage based, so that food never becomes value-less.
uncertainty = -(1/10)

-- How much to adjust the value of food that we steal from the enemy. If
-- positive, we tend to try to beat enemies to food. If negative, we tend to
-- avoid enemies.
theft = (1/3)

-- How much we adjust the value of a move towards friendly ants.
-- If positive, we tend to clump together. If negative, we tend to spread out.
clumping = -(1/5)
