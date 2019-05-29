-- languageExercises.hs
import Data.Char

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs)
  | isSpace x = x : capitalizeWord xs
  | otherwise = toUpper x : xs


capitalizeParagraph :: String -> String
capitalizeParagraph = concat . map capitalizeWord . splitSentenceBy '.'


-- based on https://stackoverflow.com/a/32216979
-- I seriously cannot believe that this whole exercise is made so difficult only because 
-- of the simple fact that the library function splitOn is not included in prelude.
splitSentenceBy :: Char -> String -> [String]
splitSentenceBy delimit = foldr (\z (x:xs) -> if z == delimit then [delimit]:x:xs else (z:x):xs ) [[]]
