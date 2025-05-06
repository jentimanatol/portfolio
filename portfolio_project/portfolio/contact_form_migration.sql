-- Create portfolio_contactmessage table
CREATE TABLE IF NOT EXISTS "portfolio_contactmessage" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" varchar(100) NOT NULL,
    "email" varchar(254) NOT NULL,
    "subject" varchar(200) NOT NULL,
    "message" text NOT NULL,
    "created_at" datetime NOT NULL
);

-- Create index for more efficient date-based filtering
CREATE INDEX IF NOT EXISTS "portfolio_contactmessage_created_at_idx" ON "portfolio_contactmessage" ("created_at");