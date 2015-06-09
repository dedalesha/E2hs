type Side = Char
data LTRB = LTRB {left::Side, top::Side, right::Side, bottom::Side}
	deriving (Show)

test_data = [LTRB 'a' 'b' '4' '1', LTRB '4' 'b' '3' 'd', 
			 LTRB 'e' '1' '2' 'g', LTRB '2' '3' 'j' 'k']

rotate (LTRB a b c d) = LTRB b c d a

main = do print $ LTRB 'a' 'b' 'c' 'd'