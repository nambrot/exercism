module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Node a (LinkedList a) | End deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Node x _) = x

fromList :: [a] -> LinkedList a
fromList = foldr Node End

isNil :: LinkedList a -> Bool
isNil End = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Node

next :: LinkedList a -> LinkedList a
next (Node _ x) = x

nil :: LinkedList a
nil = End

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList a = h a End where
    h (Node a b) acc = h b (Node a acc)
    h End acc = acc

toList :: LinkedList a -> [a]
toList End = []
toList (Node x xs) = x : toList xs
