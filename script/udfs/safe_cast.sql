DROP FUNCTION IF EXISTS safe_cast(TEXT,anyelement);

CREATE FUNCTION safe_cast(TEXT,anyelement) 
returns anyelement 
language plpgsql AS $$ 
BEGIN 
    $0 := $1; 
    return $0; 
    exception WHEN others THEN 
        return $2; 
END; $$;