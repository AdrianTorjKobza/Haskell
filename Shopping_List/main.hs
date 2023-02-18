shoppingList :: [String]
shoppingList =
   [ "Chocolate"
   , "More Chocolate"
   , "Candies"
   , "Ice Cream"
   , "Bubble Gum"
   , "Chips"
   , "Fizzy Drinks"
   , "Water"
   , "More Chocolate"
   , "Bread"
   , "Bananas"
   , "Chips"
   ]


-- Remove duplicate from the list. In our case "More Chocolate" and "Chips".
removeDuplicates :: Eq a => [a] -> [a]
removeDuplicates [] = [] -- Edge condition, when we reach the end of the list.
removeDuplicates (x:xs)
   | x `elem` xs = removeDuplicates xs -- If the head of the list is present in the tail, returns just the tail. Recursively go through the list.
   | otherwise   = x : removeDuplicates xs -- If the head of the list is not present in the tail, returns the entire list. Recursively go through the list.


-- Sort the list in alphabetical order.
sortList :: Ord a => [a] -> [a]
sortList [] = [] -- Edge condition, when we reach the end of the list.
sortList (x:xs) = less ++ [x] ++ greater
   where 
      less = sortList [a | a <- xs, a <= x] -- Take each element from the tail (xs) that is smaller or equal to the head (x) of the list. Recursively go through the list.
      greater  = sortList [a | a <- xs, a > x] -- Take each element from the tail (xs) that is larger than the head (x) of the list. Recursively go through the list.


-- The new list is sorted, containing unique items.
newShoppingList = sortList (removeDuplicates shoppingList)


-- Print the list of items, separated by comma.
printList :: [String] -> String
printList [] = "" -- Edge condition, when we reach the end of the list.
printList [x] = "and " ++ x ++ "." -- When we reach the last item on the list.
printList (x:xs) = x ++ ", " ++ printList xs -- Recursively go through the list.


main :: IO ()
main = do 
   putStr ("You want to buy " ++ (show (length newShoppingList)) ++ " items: ") -- We use show to convert Int to String.
   putStrLn (printList newShoppingList)
