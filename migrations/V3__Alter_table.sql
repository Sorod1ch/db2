DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_attribute 
        WHERE attrelid = 'users'::regclass AND attname = 'new_column'
    ) THEN
        ALTER TABLE users ADD COLUMN new_column VARCHAR(255);
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'email_format'
    ) THEN
        ALTER TABLE users ADD CONSTRAINT email_format CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    END IF;
END
$$;
