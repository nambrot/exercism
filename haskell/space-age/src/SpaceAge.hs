module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

factor :: Planet -> Float
factor planet =
  case planet of Earth -> 1
                 Mercury ->  0.2408467
                 Venus ->  0.61519726
                 Mars ->  1.8808158
                 Jupiter ->  11.862615
                 Saturn ->  29.447498
                 Uranus ->  84.016846
                 Neptune ->  164.79132
earthAge :: Float -> Float
earthAge seconds = seconds / 31557600

adjust :: Planet -> Float -> Float
adjust planet seconds = seconds / factor planet

ageOn :: Planet -> Float -> Float
ageOn planet = adjust planet . earthAge

