{-# LANGUAGE GeneralisedNewtypeDeriving #-}

data Degree = Degree
            deriving (Show, Eq)

data Radian = Radian
            deriving (Show, Eq)

-- See, the `unit` type is not used anywhere on the right side
-- It is used as a tag so you can't then compare Angles in radians
-- to Angles in degrees.
newtype Angle unit = Angle { getVal :: Double }
                deriving (Show, Eq, Num)


rads :: Double -> Angle Radian
rads = Angle

degs :: Double -> Angle Degree
degs = Angle


radsToDeg :: Angle Radian -> Angle Degree
radsToDeg (Angle r) = Angle (r * 180/pi)

degsToRad :: Angle Degree -> Angle Radian
degsToRad (Angle d) = Angle (pi/180 * d)

-- We now can use degrees and radians and thank to derived Num instance,
-- the basic arithmetic works as well.
--
-- degs 30 + degs 60 ~> Angle { getVal = 90 }
-- rads (pi/2) + rads (pi/2) ~> Angle { getVal = pi }
--
-- BUT
--
-- degs 30 + rads pi
--
-- Will throw an error!
--
-- But it can be even better...

