type Side = Char

class Square a where
	leftSide :: a -> Side
	topSide :: a -> Side
	rightSide :: a -> Side
	bottomSide :: a -> Side

data LTRB = LTRB {left::Side, top::Side, right::Side, bottom::Side}
	deriving (Show)

instance Eq LTRB where
	x == y = left x == left y && top x == top y && right x == right y && bottom x == bottom y

instance Square LTRB where
	leftSide a = left a
	topSide a = top a
	rightSide a = right a
	bottomSide a = bottom a


test_data = [LTRB 'a' 'b' '4' '1', LTRB '4' 'b' '3' 'd', 
			 LTRB 'e' '1' '2' 'g', LTRB '2' '3' 'j' 'k']

rotate (LTRB a b c d) = LTRB b c d a

pieceRotations p@(LTRB a b c d) = \n -> p : (LTRB b c d a) : (LTRB c d a b) : (LTRB d a b c) : n

allRotations::[LTRB] -> [LTRB]
allRotations (p:ps)
	| ps == [] = pieceRotations p []
	| otherwise = pieceRotations p $ allRotations ps 

showSquare square = '<':(leftSide square):(topSide square):(rightSide square):(bottomSide square):">"

main = do print $ map showSquare (allRotations test_data)