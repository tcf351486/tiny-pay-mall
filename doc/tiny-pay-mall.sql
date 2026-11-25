-- 数据库创建
create
database tiny_pay_mall;

-- 订单表
create table `t_order`
(
    `id`           int(11) not null auto_increment comment '主键',
    `user_id`      int(11) not null comment '用户ID',
    `product_id`   int(11) not null comment '商品ID',
    `product_name` varchar(255)   not null comment '商品名称',
    `order_id`     varchar(255)   not null comment '订单ID',
    `order_time`   datetime       not null comment '订单下单时间',
    `order_amount` decimal(10, 2) not null comment '订单金额',
    `order_status` int(11) not null comment '订单状态: create(创建完成), pay_await(等待支付), pay_success(支付成功), deal_done(交易完成), close(订单关闭)',
    `pay_url`      varchar(2048)  not null comment '支付信息',
    `pay_time`     datetime       not null comment '支付时间',
    `create_time`  datetime       not null comment '创建时间',
    `update_time`  datetime       not null comment '更新时间',
    `del_flag`     int(11) not null comment '删除标志',
    primary key (`id`),
    unique key `uq_order_id` (`order_id`),
    key `idx_user_id_product_id` (`user_id`, `product_id`)
)engine=innodb default charset=utf8mb4 comment='订单表';
