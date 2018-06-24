create table prices (
    item_id   bigint   not null,
    price     integer  not null,

    constraint payments_item_id_ukey primary key (item_id),
    constraint payments_price_positive_check check (price > 0)
);

