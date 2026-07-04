# Supabase migrations

Run these SQL files in the Supabase SQL Editor, or apply them with the Supabase CLI against the project database.

The cash-register close trigger migration must be applied before merging/deploying the pending-orders close validation, so direct database updates are blocked in the same way as the backend service.
