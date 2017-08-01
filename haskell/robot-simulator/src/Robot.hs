module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Ord, Enum)

data Robot = Robot Bearing Integer Integer

bearing :: Robot -> Bearing
bearing (Robot a _ _) = a

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ x y) = (x, y)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction (x, y) = Robot direction x y

simulate :: Robot -> String -> Robot
simulate = foldl move where
        move (Robot a b c) 'R' = Robot (turnRight a) b c
        move (Robot a b c) 'L' = Robot (turnLeft a) b c
        move (Robot North b c) 'A' = Robot North b (c+1)
        move (Robot East b c) 'A' = Robot East (b+1) c
        move (Robot South b c) 'A' = Robot South b (c-1)
        move (Robot West b c) 'A' = Robot West (b-1) c

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft x = pred x

turnRight :: Bearing -> Bearing
turnRight West = North
turnRight x = succ x
