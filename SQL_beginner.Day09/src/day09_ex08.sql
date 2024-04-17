CREATE FUNCTION fnc_fibonacci(fib int)
RETURNS INT AS $$
DECLARE 
    count INT;
	fib INT;
	fib1 INT;
	fib2 INT;
BEGIN
	count := 1;
	fib := 1;
	fib1 := 0;
	fib2 := 1;
	
	LOOP
		IF $1 = 0 THEN
			fib := 0;
			EXIT;
		END IF;
		EXIT WHEN count >= $1;
		fib := fib1 + fib2;
		fib1 := fib2;
		fib2 := fib;
		count := count + 1;
	END LOOP;
	
	RETURN fib;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(12)