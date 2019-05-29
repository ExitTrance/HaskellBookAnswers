import Data.Char
import Data.List
import Data.Maybe

convo :: [String]
convo =
  ["Wanna play 20 questions",
   "Ya",
   "U 1st haha",
   "Lol ok. Have u ever tasted alcohol lol",
   "Lol ya",
   "Wow ur cool haha. Ur turn",
   "Ok. Do u think I am pretty Lol",
   "Lol ya",
   "Haha thanks just making sure rofl ur turn"]



data DaPhone = DaPhone [(Digit, Values)] deriving (Eq, Show)

-- validButtons = "1234567890*#"
type Digit = Char 

type Values = String 

-- Valid presses: 1 and up
type Presses = Int

phone = DaPhone [('1', "1"),
                 ('2', "abc2"),
                 ('3', "def3"),
                 ('4', "ghi4"),
                 ('5', "jkl5"),
                 ('6', "mno6"),
                 ('7', "pqrs7"),
                 ('8', "tuv8"),
                 ('9', "wxyz9"),
                 ('*', "^*"),
                 ('0', " +0"),
                 ('#', ".,#")
                ]


reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps (DaPhone p) character
  | isUpper character = [('*', 1), (digit, presses)]
  | otherwise         = [(digit, presses)]
  where
    char = toLower character
    (digit, values) = head (filter ((elem $ char).snd) p)
    presses = 1 + (length $ takeWhile (/= char) values)




cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead p text =
  concat $ map (\x -> reverseTaps p x) text

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps [] = 0
fingerTaps x  = sum $ map snd x

reversePresses :: DaPhone -> [(Digit, Presses)] -> Char
reversePresses (DaPhone p) (x:xs)
  | fst x == '*' =  toUpper $ reversed (head xs)
  | otherwise    = reversed x
  where
     -- This gives me a list of values e.g. "abc2"
    values char = snd $ head $ filter ((== (fst char)) . fst) p
    reversed char = values char !! (snd char - 1)

mostPopularLetter :: String -> Char
mostPopularLetter = undefined --map f 
  where
    f = undefined
