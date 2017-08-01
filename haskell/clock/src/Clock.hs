module Clock (clockHour, clockMin, fromHourMin, toString) where

newtype Clock = Clock Int

instance Eq Clock where
  x == y = clockHour x == clockHour y && clockMin x == clockMin y

instance Num Clock where
    fromInteger = fromInt . fromInteger
    (Clock t1) + (Clock t2) = fromInt $ t1 + t2
    (Clock t1) - (Clock t2) = fromInt $ t1 - t2

instance Show Clock where
    show = toString

fromInt :: Int -> Clock
fromInt = Clock . flip mod (60 * 24)

clockHour :: Clock -> Int
clockHour (Clock clock) = (clock `div` 60) `mod` 24

clockMin :: Clock -> Int
clockMin (Clock clock) = clock `mod` 60

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock (hour * 60 + min)

toString :: Clock -> String
toString clock = s clockHour ++ ":" ++ s clockMin where
  s f = t $ show $ f clock
  t [x] = ['0', x]
  t x = x
