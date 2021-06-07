with
    customer as (
        select *
        from {{ ref('dim_customer')}}
    )
    , creditcard as (
        select *
        from {{ ref('dim_creditcard')}}
    )
    , product as (
        select *
        from {{ ref('dim_product')}}
    )
    , address as (
        select *
        from {{ ref('dim_address')}}
    )

    , orders_with_sk as (
            select
            orders.salesorderid
            , customer.customer_sk as customer_fk
            , customer.firstname
            , customer.lastname
            , creditcard.creditcard_sk as creditcard_fk
            , address.address_sk as address_fk
            , address.city
            , orders.shipmethodid
            , orders.billtoaddressid
            , orders.salespersonid
            , orders.currencyrateid
            , orders.territoryid
            , orders.purchaseordernumber
            , orders.modifieddate
            , orders.rowguid
            , orders.taxamt
            , orders.onlineorderflag
            , orders.status
            , orders.orderdate
            , orders.creditcardapprovalcode
            , orders.subtotal
            , orders.revisionnumber
            , orders.freight
            , orders.duedate
            , orders.totaldue
            , orders.shipdate
            , orders.accountnumber
        from {{ ref('stg_orders')}} as orders

        left join customer on orders.customerid = customer.customerid
        left join creditcard on orders.creditcardid = creditcard.creditcardid
        left join address on orders.shiptoaddressid = address.addressid

    )

   , order_detail_with_sk as (
        select
            order_details.salesorderid
            , order_details.specialofferid
            , order_details.salesorderdetailid
            , order_details.unitpricediscount
            , order_details.unitprice
            , order_details.rowguid
            , order_details.orderqty
            , order_details.saleprice
            , order_details.modifieddate
            , order_details.carriertrackingnumber
            , product.product_sk as product_fk
            , product.name as productname
        from {{ ref('stg_orderdetail')}} as order_details
        left join product on order_details.productid = product.productid
    )

    , final as (
        select
            order_detail_with_sk.salesorderid
            , order_detail_with_sk.specialofferid
            , order_detail_with_sk.salesorderdetailid
            , order_detail_with_sk.unitpricediscount
            , order_detail_with_sk.unitprice
            , order_detail_with_sk.orderqty
            , order_detail_with_sk.saleprice
            , order_detail_with_sk.carriertrackingnumber
            , order_detail_with_sk.product_fk
            , order_detail_with_sk.productname
            , orders_with_sk.customer_fk
            , orders_with_sk.firstname
            , orders_with_sk.lastname
            , orders_with_sk.creditcard_fk
            , orders_with_sk.address_fk
            , orders_with_sk.city
            , orders_with_sk.shipmethodid
            , orders_with_sk.billtoaddressid
            , orders_with_sk.salespersonid
            , orders_with_sk.currencyrateid
            , orders_with_sk.territoryid
            , orders_with_sk.purchaseordernumber
            , orders_with_sk.modifieddate
            , orders_with_sk.rowguid
            , orders_with_sk.taxamt
            , orders_with_sk.onlineorderflag
            , orders_with_sk.status
            , orders_with_sk.orderdate
            , orders_with_sk.creditcardapprovalcode
            , orders_with_sk.subtotal
            , orders_with_sk.revisionnumber
            , orders_with_sk.freight
            , orders_with_sk.duedate
            , orders_with_sk.totaldue
            , orders_with_sk.shipdate
            , orders_with_sk.accountnumber
            from order_detail_with_sk

            left join orders_with_sk on order_detail_with_sk.salesorderid = orders_with_sk.salesorderid

    )


select * from final


