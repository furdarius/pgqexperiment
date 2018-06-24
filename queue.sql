-- List all queues
-- select * from pgq.queue;


-- Create queue
select from pgq.create_queue('price_q');


-- Delete queue
-- select from pgq.drop_queue('price_q');


-- Setup producer of queue.
-- For that we need to create trigger which calls one of queue insert pgq helpers:
-- pgq.sqltriga() - Trigger that generates queue events containing partial SQL.
-- pgq.logutriga() - Trigger function that puts row data in urlencoded form into queue.
-- 
-- @see https://github.com/markokr/skytools/blob/master/sql/pgq/triggers/pgq_triggers.sql
create trigger triga_prices after insert or update or delete on prices for each row execute procedure pgq.logutriga('prices_q');


-- Check that queue exists and ready.
-- Col 'queue_data_pfx' contains name of queue where events stored.
-- select * from pgq.queue;


-- We can check events in queue using 'queue_data_pfx' col from pgq.queue;
-- select * from pgq.event_4;


-- Register consumer.
select from pgq.register_consumer('prices_q', 'prices_consumer');


-- Receive next batch ID for consumer
-- select pgq.next_batch('prices_q', 'prices_consumer') as batch_id;


-- Receive batch events
-- select * from pgq.get_batch_events(11);


-- Ack batch.
-- If not to do this pgq.next_batch() will return same value.
-- select * from pgq.finish_batch(10);

