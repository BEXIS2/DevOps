-- FUNCTION: public.test_data_parties(integer, integer)

-- DROP FUNCTION public.test_data_parties(integer, integer);

CREATE OR REPLACE FUNCTION public.test_data_parties(
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

INSERT INTO public.parties(id, versionno,
	name, partytyperef)
	VALUES (start+iter,iter,iter, 1);

INSERT INTO public.partycustomattributevalues(
	versionno, value, customattributeref, partyref)
	VALUES (start+iter, 1, 1, start+iter);

INSERT INTO public.partycustomattributevalues(
	versionno, value, customattributeref, partyref)
	VALUES (start+iter, 1, 2, start+iter);

END LOOP;   
RETURN;
END;
$BODY$;

ALTER FUNCTION public.test_data_parties(integer, integer)
    OWNER TO postgres;


