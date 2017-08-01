module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, gregorianMonthLength)
import Data.Time.Calendar.WeekDate (toWeekDate)
import Data.Time.Calendar.OrdinalDate (isLeapYear)

data Weekday = Monday
             | Tuesday
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday deriving (Eq, Show, Enum)

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = findTillMatch earliestDate where
  earliestDate = fromGregorian year month $ earliestDay schedule month year
  findTillMatch day
    | getWeekDate day == weekday = day
    | otherwise = findTillMatch (succ day)

earliestDay :: Schedule -> Int -> Integer -> Int
earliestDay First _ _ = 1
earliestDay Second _ _ = 8
earliestDay Third _ _ = 15
earliestDay Fourth _ _ = 22
earliestDay Teenth _ _ = 13
earliestDay Last month year = gregorianMonthLength year month - 6


getWeekDate :: Day -> Weekday
getWeekDate day = m Monday $ int tup where
  tup = toWeekDate day
  int (_, _, x) = x
  m weekDay 1 = weekDay
  m weekDay n = m (succ weekDay) $ n - 1
