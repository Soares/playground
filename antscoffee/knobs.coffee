# How many turns we look into the future.
# Tweak to use the amount of time to your best advantage.
horizon = 27

# How much to adjust the value of food each turn
# Tracks the deprecation of getting food later rather than earlier. It's
# percentage based, so that food never becomes value-less.
uncertainty = -0.1

# How much to adjust the value of food that we steal from the enemy. If
# positive, we tend to try to beat enemies to food. If negative, we tend to
# avoid food races.
theft = 0.3

# How much we adjust the value of a move towards friendly ants.
# If positive, we tend to clump together. If negative, we tend to spread out.
clumping = -0.2

# How much we like confronting enemies when there is no food around.
# If positive, we will attack enemies when we can't get food.
# If negative, we will avoid enemies when we can't get food.
agression = -0.1
