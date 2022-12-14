PGDMP     6                
    z            ms_test_base    15.0    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    ms_test_base    DATABASE     ?   CREATE DATABASE ms_test_base WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE ms_test_base;
                postgres    false            ?            1259    16401    cities    TABLE     L   CREATE TABLE public.cities (
    id integer NOT NULL,
    city_name text
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16400    cities_id_seq    SEQUENCE     ?   ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            ?            1259    16428    shops    TABLE     	  CREATE TABLE public.shops (
    id integer NOT NULL,
    shop_name text NOT NULL,
    city_id integer NOT NULL,
    street_id integer NOT NULL,
    home text NOT NULL,
    time_open time without time zone NOT NULL,
    time_close time without time zone NOT NULL
);
    DROP TABLE public.shops;
       public         heap    postgres    false            ?            1259    16427    shops_id_seq    SEQUENCE     ?   ALTER TABLE public.shops ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            ?            1259    16415    streets    TABLE     v   CREATE TABLE public.streets (
    id integer NOT NULL,
    street_name text NOT NULL,
    city_id integer NOT NULL
);
    DROP TABLE public.streets;
       public         heap    postgres    false            ?            1259    16414    streets_id_seq    SEQUENCE     ?   ALTER TABLE public.streets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.streets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217                      0    16401    cities 
   TABLE DATA           /   COPY public.cities (id, city_name) FROM stdin;
    public          postgres    false    215   g                 0    16428    shops 
   TABLE DATA           _   COPY public.shops (id, shop_name, city_id, street_id, home, time_open, time_close) FROM stdin;
    public          postgres    false    219   ?       	          0    16415    streets 
   TABLE DATA           ;   COPY public.streets (id, street_name, city_id) FROM stdin;
    public          postgres    false    217   ?                  0    0    cities_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cities_id_seq', 6, true);
          public          postgres    false    214                       0    0    shops_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.shops_id_seq', 9, true);
          public          postgres    false    218                       0    0    streets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.streets_id_seq', 10, true);
          public          postgres    false    216            p           2606    16405    cities cities_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    215            t           2606    16432    shops shops_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.shops DROP CONSTRAINT shops_pkey;
       public            postgres    false    219            r           2606    16419    streets streets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.streets
    ADD CONSTRAINT streets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.streets DROP CONSTRAINT streets_pkey;
       public            postgres    false    217            v           2606    16438    shops city_shop    FK CONSTRAINT     y   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT city_shop FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;
 9   ALTER TABLE ONLY public.shops DROP CONSTRAINT city_shop;
       public          postgres    false    215    219    3184            u           2606    16422    streets fk_city_street    FK CONSTRAINT     ?   ALTER TABLE ONLY public.streets
    ADD CONSTRAINT fk_city_street FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;
 @   ALTER TABLE ONLY public.streets DROP CONSTRAINT fk_city_street;
       public          postgres    false    215    3184    217            w           2606    16433    shops street_shop    FK CONSTRAINT     ~   ALTER TABLE ONLY public.shops
    ADD CONSTRAINT street_shop FOREIGN KEY (street_id) REFERENCES public.streets(id) NOT VALID;
 ;   ALTER TABLE ONLY public.shops DROP CONSTRAINT street_shop;
       public          postgres    false    219    217    3186               X   x?%??@@??zဨF1??D<+.맆yYq?/?e
??i???<??R:&?O	?T?M=?Ϙ9?'Z6???R??B?Uiry??4?         ?   x?u?aj1?Ϟ?(?lvu{?f??*(????a?4j???F}?]?$?!|o??%|?'?v?ڈ?\
'?~1?[???|?J??B?9Z?䭘IO]?ȵ???[x?Dx

Z?q??;??p?-N?$??L?W??/?س?A?$?gd????e??D??GqR?ӌk?Ȟ?????K
????q??N??[
bJ?????D???1??????^??"]<*??^GY??AF??      	   ?   x?U??	?@E?g??1_?XLB@?O;X?+?m?NG?,!???????Hp?G?'??Xc?ɲ??Z??f9*8?&?Q	O???A???ے|,82???mzc???c?7՝?r??騨??????mt???!+չ`O??z?V@4?y???????.????Ӌ?     