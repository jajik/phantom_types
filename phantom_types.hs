data Degree = Degree
            deriving (Show, Eq)

data Radian = Radian
            deriving (Show, Eq)

-- See, the `unit` type is not used anywhere on the right side
-- It is used as a tag so you can't then compare Angles in radians
-- to Angles in degrees.
data Angle unit = Angle { getVal :: Double }
                deriving (Show, Eq)


rads :: Double -> Angle Radian
rads = Angle

degs :: Double -> Angle Degree
degs = Angle


radsToDeg :: Angle Radian -> Angle Degree
radsToDeg (Angle r) = Angle (r * 180/pi)

degsToRad :: Angle Degree -> Angle Radian
degsToRad (Angle d) = Angle (pi/180 * d)



