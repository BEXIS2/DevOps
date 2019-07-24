-- FUNCTION: public.test_data_users2(integer, integer)

-- DROP FUNCTION public.test_data_users2(integer, integer);

CREATE OR REPLACE FUNCTION public.test_data_users2(
	start integer,
	iter integer)
    RETURNS SETOF record 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$DECLARE

BEGIN

FOR iter  IN 0..iter LOOP

INSERT INTO public.users(id, versionno,
	name, password, token)
	VALUES (start+iter,iter,iter, iter,iter);
	
END LOOP;   
RETURN;
END;
$BODY$;

ALTER FUNCTION public.test_data_users2(integer, integer)
    OWNER TO postgres;
