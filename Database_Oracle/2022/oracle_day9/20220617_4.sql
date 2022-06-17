CREATE OR REPLACE FUNCTION FNC_INTEREST 
(
  PRICE IN NUMBER 
) RETURN INT 
AS 
  myInterest number;
BEGIN
  if price >= 30000 then
    myInterest := price * 0.1;
  else
    myInterest := price * 0.05;
  end if;
  RETURN myInterest;
END FNC_INTEREST;