-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.customers (
  customer_id character varying NOT NULL,
  customer_unique_id character varying,
  customer_zip_code_prefix integer,
  customer_city character varying,
  customer_state character varying,
  CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);
CREATE TABLE public.metadata_business_rules (
  rule_id character varying NOT NULL,
  rule_name character varying NOT NULL,
  category character varying,
  description text,
  condition_sql_logic text,
  applies_to_kpi text,
  is_mandatory boolean DEFAULT true,
  priority character varying,
  CONSTRAINT metadata_business_rules_pkey PRIMARY KEY (rule_id)
);
CREATE TABLE public.metadata_enhanced_schema (
  id integer NOT NULL DEFAULT nextval('data_schema_id_seq'::regclass),
  table_name character varying,
  table_description_vi text,
  column_name character varying,
  data_type character varying,
  column_description_vi text,
  column_description_en text,
  PK_key_type character varying,
  references_to character varying,
  allowed_values text,
  constraints text,
  example text,
  FK_key_type character varying,
  CONSTRAINT metadata_enhanced_schema_pkey PRIMARY KEY (id)
);
CREATE TABLE public.metadata_kpi_definitions (
  kpi_name character varying NOT NULL,
  synonyms text,
  business_description_en text,
  business_description_vi text,
  metric_logic_en text,
  metric_logic_vi text,
  sql_definition text,
  CONSTRAINT metadata_kpi_definitions_pkey PRIMARY KEY (kpi_name)
);
CREATE TABLE public.metadata_question (
  question_vie text NOT NULL,
  question_level text NOT NULL,
  ground_truth_sql text,
  CONSTRAINT metadata_question_pkey PRIMARY KEY (question_vie)
);
CREATE TABLE public.metadata_question_few_shot (
  question_vie text NOT NULL,
  question_level text NOT NULL,
  ground_truth_sql text,
  CONSTRAINT metadata_question_few_shot_pkey PRIMARY KEY (question_vie)
);
CREATE TABLE public.order_items (
  order_id character varying NOT NULL,
  order_item_id integer NOT NULL,
  product_id character varying,
  seller_id character varying,
  shipping_limit_date timestamp without time zone,
  price numeric,
  freight_value numeric,
  CONSTRAINT order_items_pkey PRIMARY KEY (order_id, order_item_id),
  CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id),
  CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES public.products(product_id),
  CONSTRAINT fk_items_seller FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id)
);
CREATE TABLE public.order_payments (
  order_id character varying NOT NULL,
  payment_sequential integer NOT NULL,
  payment_type character varying,
  payment_installments integer,
  payment_value numeric,
  CONSTRAINT order_payments_pkey PRIMARY KEY (order_id, payment_sequential),
  CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id)
);
CREATE TABLE public.order_reviews (
  review_id character varying,
  order_id character varying,
  review_score integer,
  review_comment_title character varying,
  review_comment_message text,
  review_creation_date timestamp without time zone,
  review_answer_timestamp timestamp without time zone,
  CONSTRAINT fk_reviews_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id)
);
CREATE TABLE public.orders (
  order_id character varying NOT NULL,
  customer_id character varying,
  order_status character varying,
  order_purchase_timestamp timestamp without time zone,
  order_approved_at timestamp without time zone,
  order_delivered_carrier_date timestamp without time zone,
  order_delivered_customer_date timestamp without time zone,
  order_estimated_delivery_date timestamp without time zone,
  CONSTRAINT orders_pkey PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id)
);
CREATE TABLE public.product_category_name_translation (
  product_category_name character varying NOT NULL UNIQUE,
  product_category_name_english text NOT NULL,
  CONSTRAINT product_category_name_translation_pkey PRIMARY KEY (product_category_name)
);
CREATE TABLE public.products (
  product_id character varying NOT NULL,
  product_category_name character varying,
  product_name_lenght bigint,
  product_description_lenght bigint,
  product_photos_qty bigint,
  product_weight_g bigint,
  product_length_cm bigint,
  product_height_cm bigint,
  product_width_cm bigint,
  CONSTRAINT products_pkey PRIMARY KEY (product_id)
);
CREATE TABLE public.sellers (
  seller_id character varying NOT NULL,
  seller_zip_code_prefix integer,
  seller_city character varying,
  seller_state character varying,
  CONSTRAINT sellers_pkey PRIMARY KEY (seller_id)
);