PGDMP     ;    .                }            madrasah    13.20    13.20 v    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    17549    madrasah    DATABASE     h   CREATE DATABASE madrasah WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
    DROP DATABASE madrasah;
                postgres    false            �            1259    17703    beasiswa    TABLE     �   CREATE TABLE public.beasiswa (
    id_beasiswa integer NOT NULL,
    id_siswa integer,
    keterangan character varying(100),
    nominal integer NOT NULL,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.beasiswa;
       public         heap    postgres    false            �            1259    17701    beasiswa_id_beasiswa_seq    SEQUENCE     �   CREATE SEQUENCE public.beasiswa_id_beasiswa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.beasiswa_id_beasiswa_seq;
       public          postgres    false    221            \           0    0    beasiswa_id_beasiswa_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.beasiswa_id_beasiswa_seq OWNED BY public.beasiswa.id_beasiswa;
          public          postgres    false    220            �            1259    17617    emoney    TABLE     t   CREATE TABLE public.emoney (
    id_emoney integer NOT NULL,
    id_siswa integer,
    nominal integer DEFAULT 0
);
    DROP TABLE public.emoney;
       public         heap    postgres    false            �            1259    17615    emoney_id_emoney_seq    SEQUENCE     �   CREATE SEQUENCE public.emoney_id_emoney_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.emoney_id_emoney_seq;
       public          postgres    false    209            ]           0    0    emoney_id_emoney_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.emoney_id_emoney_seq OWNED BY public.emoney.id_emoney;
          public          postgres    false    208            �            1259    17597 
   ortu_siswa    TABLE     r   CREATE TABLE public.ortu_siswa (
    id_ortu_siswa integer NOT NULL,
    id_ortu integer,
    id_siswa integer
);
    DROP TABLE public.ortu_siswa;
       public         heap    postgres    false            �            1259    17595    ortu_siswa_id_ortu_siswa_seq    SEQUENCE     �   CREATE SEQUENCE public.ortu_siswa_id_ortu_siswa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.ortu_siswa_id_ortu_siswa_seq;
       public          postgres    false    207            ^           0    0    ortu_siswa_id_ortu_siswa_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.ortu_siswa_id_ortu_siswa_seq OWNED BY public.ortu_siswa.id_ortu_siswa;
          public          postgres    false    206            �            1259    17643    riwayat_emoney    TABLE     �   CREATE TABLE public.riwayat_emoney (
    id_riwayat_emoney integer NOT NULL,
    id_emoney integer,
    nominal integer NOT NULL,
    keterangan text,
    id_tipe_emoney integer,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.riwayat_emoney;
       public         heap    postgres    false            �            1259    17641 $   riwayat_emoney_id_riwayat_emoney_seq    SEQUENCE     �   CREATE SEQUENCE public.riwayat_emoney_id_riwayat_emoney_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.riwayat_emoney_id_riwayat_emoney_seq;
       public          postgres    false    213            _           0    0 $   riwayat_emoney_id_riwayat_emoney_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.riwayat_emoney_id_riwayat_emoney_seq OWNED BY public.riwayat_emoney.id_riwayat_emoney;
          public          postgres    false    212            �            1259    17552    role    TABLE     `   CREATE TABLE public.role (
    id_role integer NOT NULL,
    role_name character varying(50)
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    17550    role_id_role_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_id_role_seq;
       public          postgres    false    201            `           0    0    role_id_role_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_id_role_seq OWNED BY public.role.id_role;
          public          postgres    false    200            �            1259    17580    siswa    TABLE     �   CREATE TABLE public.siswa (
    id_siswa integer NOT NULL,
    nisn character varying(15),
    nama_lengkap character varying(100),
    kelas character varying(10),
    id_user integer
);
    DROP TABLE public.siswa;
       public         heap    postgres    false            �            1259    17578    siswa_id_siswa_seq    SEQUENCE     �   CREATE SEQUENCE public.siswa_id_siswa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.siswa_id_siswa_seq;
       public          postgres    false    205            a           0    0    siswa_id_siswa_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.siswa_id_siswa_seq OWNED BY public.siswa.id_siswa;
          public          postgres    false    204            �            1259    17665    spp    TABLE     n   CREATE TABLE public.spp (
    id_spp integer NOT NULL,
    id_siswa integer,
    semester integer NOT NULL
);
    DROP TABLE public.spp;
       public         heap    postgres    false            �            1259    17688    spp_details    TABLE     �   CREATE TABLE public.spp_details (
    id_spp_detail integer NOT NULL,
    id_spp integer,
    keterangan character varying(100),
    nominal integer
);
    DROP TABLE public.spp_details;
       public         heap    postgres    false            �            1259    17686    spp_details_id_spp_detail_seq    SEQUENCE     �   CREATE SEQUENCE public.spp_details_id_spp_detail_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.spp_details_id_spp_detail_seq;
       public          postgres    false    219            b           0    0    spp_details_id_spp_detail_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.spp_details_id_spp_detail_seq OWNED BY public.spp_details.id_spp_detail;
          public          postgres    false    218            �            1259    17663    spp_id_spp_seq    SEQUENCE     �   CREATE SEQUENCE public.spp_id_spp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.spp_id_spp_seq;
       public          postgres    false    215            c           0    0    spp_id_spp_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.spp_id_spp_seq OWNED BY public.spp.id_spp;
          public          postgres    false    214            �            1259    17717    spp_payments    TABLE     �   CREATE TABLE public.spp_payments (
    id_spp_payment integer NOT NULL,
    id_spp integer,
    nominal integer,
    keterangan text,
    id_beasiswa integer,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.spp_payments;
       public         heap    postgres    false            �            1259    17715    spp_payments_id_spp_payment_seq    SEQUENCE     �   CREATE SEQUENCE public.spp_payments_id_spp_payment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.spp_payments_id_spp_payment_seq;
       public          postgres    false    223            d           0    0    spp_payments_id_spp_payment_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.spp_payments_id_spp_payment_seq OWNED BY public.spp_payments.id_spp_payment;
          public          postgres    false    222            �            1259    17680    spp_template_components    TABLE     �   CREATE TABLE public.spp_template_components (
    id_template_component integer NOT NULL,
    semester integer,
    keterangan character varying(100),
    nominal integer
);
 +   DROP TABLE public.spp_template_components;
       public         heap    postgres    false            �            1259    17678 1   spp_template_components_id_template_component_seq    SEQUENCE     �   CREATE SEQUENCE public.spp_template_components_id_template_component_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.spp_template_components_id_template_component_seq;
       public          postgres    false    217            e           0    0 1   spp_template_components_id_template_component_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.spp_template_components_id_template_component_seq OWNED BY public.spp_template_components.id_template_component;
          public          postgres    false    216            �            1259    17739    tabungan_beasiswa    TABLE     #  CREATE TABLE public.tabungan_beasiswa (
    id_tabungan integer NOT NULL,
    id_beasiswa integer,
    id_siswa integer,
    nominal integer NOT NULL,
    tanggal timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT tabungan_beasiswa_nominal_check CHECK ((nominal >= 0))
);
 %   DROP TABLE public.tabungan_beasiswa;
       public         heap    postgres    false            �            1259    17737 !   tabungan_beasiswa_id_tabungan_seq    SEQUENCE     �   CREATE SEQUENCE public.tabungan_beasiswa_id_tabungan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.tabungan_beasiswa_id_tabungan_seq;
       public          postgres    false    225            f           0    0 !   tabungan_beasiswa_id_tabungan_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.tabungan_beasiswa_id_tabungan_seq OWNED BY public.tabungan_beasiswa.id_tabungan;
          public          postgres    false    224            �            1259    17633    tipe_emoney    TABLE     n   CREATE TABLE public.tipe_emoney (
    id_tipe_emoney integer NOT NULL,
    nama_tipe character varying(50)
);
    DROP TABLE public.tipe_emoney;
       public         heap    postgres    false            �            1259    17631    tipe_emoney_id_tipe_emoney_seq    SEQUENCE     �   CREATE SEQUENCE public.tipe_emoney_id_tipe_emoney_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipe_emoney_id_tipe_emoney_seq;
       public          postgres    false    211            g           0    0    tipe_emoney_id_tipe_emoney_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tipe_emoney_id_tipe_emoney_seq OWNED BY public.tipe_emoney.id_tipe_emoney;
          public          postgres    false    210            �            1259    17562    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    email character varying(255),
    password character varying(255),
    nama_lengkap character varying(255),
    id_role integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17560    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    203            h           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    202            y           2604    17706    beasiswa id_beasiswa    DEFAULT     |   ALTER TABLE ONLY public.beasiswa ALTER COLUMN id_beasiswa SET DEFAULT nextval('public.beasiswa_id_beasiswa_seq'::regclass);
 C   ALTER TABLE public.beasiswa ALTER COLUMN id_beasiswa DROP DEFAULT;
       public          postgres    false    220    221    221            q           2604    17620    emoney id_emoney    DEFAULT     t   ALTER TABLE ONLY public.emoney ALTER COLUMN id_emoney SET DEFAULT nextval('public.emoney_id_emoney_seq'::regclass);
 ?   ALTER TABLE public.emoney ALTER COLUMN id_emoney DROP DEFAULT;
       public          postgres    false    209    208    209            p           2604    17600    ortu_siswa id_ortu_siswa    DEFAULT     �   ALTER TABLE ONLY public.ortu_siswa ALTER COLUMN id_ortu_siswa SET DEFAULT nextval('public.ortu_siswa_id_ortu_siswa_seq'::regclass);
 G   ALTER TABLE public.ortu_siswa ALTER COLUMN id_ortu_siswa DROP DEFAULT;
       public          postgres    false    207    206    207            t           2604    17646     riwayat_emoney id_riwayat_emoney    DEFAULT     �   ALTER TABLE ONLY public.riwayat_emoney ALTER COLUMN id_riwayat_emoney SET DEFAULT nextval('public.riwayat_emoney_id_riwayat_emoney_seq'::regclass);
 O   ALTER TABLE public.riwayat_emoney ALTER COLUMN id_riwayat_emoney DROP DEFAULT;
       public          postgres    false    212    213    213            m           2604    17555    role id_role    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_role_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN id_role DROP DEFAULT;
       public          postgres    false    201    200    201            o           2604    17583    siswa id_siswa    DEFAULT     p   ALTER TABLE ONLY public.siswa ALTER COLUMN id_siswa SET DEFAULT nextval('public.siswa_id_siswa_seq'::regclass);
 =   ALTER TABLE public.siswa ALTER COLUMN id_siswa DROP DEFAULT;
       public          postgres    false    204    205    205            v           2604    17668 
   spp id_spp    DEFAULT     h   ALTER TABLE ONLY public.spp ALTER COLUMN id_spp SET DEFAULT nextval('public.spp_id_spp_seq'::regclass);
 9   ALTER TABLE public.spp ALTER COLUMN id_spp DROP DEFAULT;
       public          postgres    false    215    214    215            x           2604    17691    spp_details id_spp_detail    DEFAULT     �   ALTER TABLE ONLY public.spp_details ALTER COLUMN id_spp_detail SET DEFAULT nextval('public.spp_details_id_spp_detail_seq'::regclass);
 H   ALTER TABLE public.spp_details ALTER COLUMN id_spp_detail DROP DEFAULT;
       public          postgres    false    219    218    219            {           2604    17720    spp_payments id_spp_payment    DEFAULT     �   ALTER TABLE ONLY public.spp_payments ALTER COLUMN id_spp_payment SET DEFAULT nextval('public.spp_payments_id_spp_payment_seq'::regclass);
 J   ALTER TABLE public.spp_payments ALTER COLUMN id_spp_payment DROP DEFAULT;
       public          postgres    false    223    222    223            w           2604    17683 -   spp_template_components id_template_component    DEFAULT     �   ALTER TABLE ONLY public.spp_template_components ALTER COLUMN id_template_component SET DEFAULT nextval('public.spp_template_components_id_template_component_seq'::regclass);
 \   ALTER TABLE public.spp_template_components ALTER COLUMN id_template_component DROP DEFAULT;
       public          postgres    false    217    216    217            }           2604    17742    tabungan_beasiswa id_tabungan    DEFAULT     �   ALTER TABLE ONLY public.tabungan_beasiswa ALTER COLUMN id_tabungan SET DEFAULT nextval('public.tabungan_beasiswa_id_tabungan_seq'::regclass);
 L   ALTER TABLE public.tabungan_beasiswa ALTER COLUMN id_tabungan DROP DEFAULT;
       public          postgres    false    225    224    225            s           2604    17636    tipe_emoney id_tipe_emoney    DEFAULT     �   ALTER TABLE ONLY public.tipe_emoney ALTER COLUMN id_tipe_emoney SET DEFAULT nextval('public.tipe_emoney_id_tipe_emoney_seq'::regclass);
 I   ALTER TABLE public.tipe_emoney ALTER COLUMN id_tipe_emoney DROP DEFAULT;
       public          postgres    false    211    210    211            n           2604    17565    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    202    203    203            Q          0    17703    beasiswa 
   TABLE DATA           W   COPY public.beasiswa (id_beasiswa, id_siswa, keterangan, nominal, tanggal) FROM stdin;
    public          postgres    false    221   ��       E          0    17617    emoney 
   TABLE DATA           >   COPY public.emoney (id_emoney, id_siswa, nominal) FROM stdin;
    public          postgres    false    209   �       C          0    17597 
   ortu_siswa 
   TABLE DATA           F   COPY public.ortu_siswa (id_ortu_siswa, id_ortu, id_siswa) FROM stdin;
    public          postgres    false    207   w�       I          0    17643    riwayat_emoney 
   TABLE DATA           t   COPY public.riwayat_emoney (id_riwayat_emoney, id_emoney, nominal, keterangan, id_tipe_emoney, tanggal) FROM stdin;
    public          postgres    false    213   �       =          0    17552    role 
   TABLE DATA           2   COPY public.role (id_role, role_name) FROM stdin;
    public          postgres    false    201   �       A          0    17580    siswa 
   TABLE DATA           M   COPY public.siswa (id_siswa, nisn, nama_lengkap, kelas, id_user) FROM stdin;
    public          postgres    false    205   \�       K          0    17665    spp 
   TABLE DATA           9   COPY public.spp (id_spp, id_siswa, semester) FROM stdin;
    public          postgres    false    215   Г       O          0    17688    spp_details 
   TABLE DATA           Q   COPY public.spp_details (id_spp_detail, id_spp, keterangan, nominal) FROM stdin;
    public          postgres    false    219   �       S          0    17717    spp_payments 
   TABLE DATA           i   COPY public.spp_payments (id_spp_payment, id_spp, nominal, keterangan, id_beasiswa, tanggal) FROM stdin;
    public          postgres    false    223   �       M          0    17680    spp_template_components 
   TABLE DATA           g   COPY public.spp_template_components (id_template_component, semester, keterangan, nominal) FROM stdin;
    public          postgres    false    217   ��       U          0    17739    tabungan_beasiswa 
   TABLE DATA           a   COPY public.tabungan_beasiswa (id_tabungan, id_beasiswa, id_siswa, nominal, tanggal) FROM stdin;
    public          postgres    false    225   "�       G          0    17633    tipe_emoney 
   TABLE DATA           @   COPY public.tipe_emoney (id_tipe_emoney, nama_tipe) FROM stdin;
    public          postgres    false    211   ?�       ?          0    17562    users 
   TABLE DATA           P   COPY public.users (id_user, email, password, nama_lengkap, id_role) FROM stdin;
    public          postgres    false    203   s�       i           0    0    beasiswa_id_beasiswa_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.beasiswa_id_beasiswa_seq', 24, true);
          public          postgres    false    220            j           0    0    emoney_id_emoney_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.emoney_id_emoney_seq', 20, true);
          public          postgres    false    208            k           0    0    ortu_siswa_id_ortu_siswa_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.ortu_siswa_id_ortu_siswa_seq', 20, true);
          public          postgres    false    206            l           0    0 $   riwayat_emoney_id_riwayat_emoney_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.riwayat_emoney_id_riwayat_emoney_seq', 22, true);
          public          postgres    false    212            m           0    0    role_id_role_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_id_role_seq', 4, true);
          public          postgres    false    200            n           0    0    siswa_id_siswa_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.siswa_id_siswa_seq', 20, true);
          public          postgres    false    204            o           0    0    spp_details_id_spp_detail_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.spp_details_id_spp_detail_seq', 720, true);
          public          postgres    false    218            p           0    0    spp_id_spp_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.spp_id_spp_seq', 120, true);
          public          postgres    false    214            q           0    0    spp_payments_id_spp_payment_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.spp_payments_id_spp_payment_seq', 60, true);
          public          postgres    false    222            r           0    0 1   spp_template_components_id_template_component_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.spp_template_components_id_template_component_seq', 36, true);
          public          postgres    false    216            s           0    0 !   tabungan_beasiswa_id_tabungan_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tabungan_beasiswa_id_tabungan_seq', 1, false);
          public          postgres    false    224            t           0    0    tipe_emoney_id_tipe_emoney_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipe_emoney_id_tipe_emoney_seq', 2, true);
          public          postgres    false    210            u           0    0    users_id_user_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_id_user_seq', 32, true);
          public          postgres    false    202            �           2606    17709    beasiswa beasiswa_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.beasiswa
    ADD CONSTRAINT beasiswa_pkey PRIMARY KEY (id_beasiswa);
 @   ALTER TABLE ONLY public.beasiswa DROP CONSTRAINT beasiswa_pkey;
       public            postgres    false    221            �           2606    17625    emoney emoney_id_siswa_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.emoney
    ADD CONSTRAINT emoney_id_siswa_key UNIQUE (id_siswa);
 D   ALTER TABLE ONLY public.emoney DROP CONSTRAINT emoney_id_siswa_key;
       public            postgres    false    209            �           2606    17623    emoney emoney_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.emoney
    ADD CONSTRAINT emoney_pkey PRIMARY KEY (id_emoney);
 <   ALTER TABLE ONLY public.emoney DROP CONSTRAINT emoney_pkey;
       public            postgres    false    209            �           2606    17602    ortu_siswa ortu_siswa_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.ortu_siswa
    ADD CONSTRAINT ortu_siswa_pkey PRIMARY KEY (id_ortu_siswa);
 D   ALTER TABLE ONLY public.ortu_siswa DROP CONSTRAINT ortu_siswa_pkey;
       public            postgres    false    207            �           2606    17652 "   riwayat_emoney riwayat_emoney_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.riwayat_emoney
    ADD CONSTRAINT riwayat_emoney_pkey PRIMARY KEY (id_riwayat_emoney);
 L   ALTER TABLE ONLY public.riwayat_emoney DROP CONSTRAINT riwayat_emoney_pkey;
       public            postgres    false    213            �           2606    17557    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id_role);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    201            �           2606    17559    role role_role_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_role_name_key UNIQUE (role_name);
 A   ALTER TABLE ONLY public.role DROP CONSTRAINT role_role_name_key;
       public            postgres    false    201            �           2606    17589    siswa siswa_id_user_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_id_user_key UNIQUE (id_user);
 A   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_id_user_key;
       public            postgres    false    205            �           2606    17587    siswa siswa_nisn_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_nisn_key UNIQUE (nisn);
 >   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_nisn_key;
       public            postgres    false    205            �           2606    17585    siswa siswa_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id_siswa);
 :   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_pkey;
       public            postgres    false    205            �           2606    17693    spp_details spp_details_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.spp_details
    ADD CONSTRAINT spp_details_pkey PRIMARY KEY (id_spp_detail);
 F   ALTER TABLE ONLY public.spp_details DROP CONSTRAINT spp_details_pkey;
       public            postgres    false    219            �           2606    17726    spp_payments spp_payments_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.spp_payments
    ADD CONSTRAINT spp_payments_pkey PRIMARY KEY (id_spp_payment);
 H   ALTER TABLE ONLY public.spp_payments DROP CONSTRAINT spp_payments_pkey;
       public            postgres    false    223            �           2606    17670    spp spp_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.spp
    ADD CONSTRAINT spp_pkey PRIMARY KEY (id_spp);
 6   ALTER TABLE ONLY public.spp DROP CONSTRAINT spp_pkey;
       public            postgres    false    215            �           2606    17685 4   spp_template_components spp_template_components_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.spp_template_components
    ADD CONSTRAINT spp_template_components_pkey PRIMARY KEY (id_template_component);
 ^   ALTER TABLE ONLY public.spp_template_components DROP CONSTRAINT spp_template_components_pkey;
       public            postgres    false    217            �           2606    17746 (   tabungan_beasiswa tabungan_beasiswa_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tabungan_beasiswa
    ADD CONSTRAINT tabungan_beasiswa_pkey PRIMARY KEY (id_tabungan);
 R   ALTER TABLE ONLY public.tabungan_beasiswa DROP CONSTRAINT tabungan_beasiswa_pkey;
       public            postgres    false    225            �           2606    17640 %   tipe_emoney tipe_emoney_nama_tipe_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipe_emoney
    ADD CONSTRAINT tipe_emoney_nama_tipe_key UNIQUE (nama_tipe);
 O   ALTER TABLE ONLY public.tipe_emoney DROP CONSTRAINT tipe_emoney_nama_tipe_key;
       public            postgres    false    211            �           2606    17638    tipe_emoney tipe_emoney_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tipe_emoney
    ADD CONSTRAINT tipe_emoney_pkey PRIMARY KEY (id_tipe_emoney);
 F   ALTER TABLE ONLY public.tipe_emoney DROP CONSTRAINT tipe_emoney_pkey;
       public            postgres    false    211            �           2606    17695 $   spp_details unique_component_per_spp 
   CONSTRAINT     m   ALTER TABLE ONLY public.spp_details
    ADD CONSTRAINT unique_component_per_spp UNIQUE (id_spp, keterangan);
 N   ALTER TABLE ONLY public.spp_details DROP CONSTRAINT unique_component_per_spp;
       public            postgres    false    219    219            �           2606    17604    ortu_siswa unique_ortu_siswa 
   CONSTRAINT     d   ALTER TABLE ONLY public.ortu_siswa
    ADD CONSTRAINT unique_ortu_siswa UNIQUE (id_ortu, id_siswa);
 F   ALTER TABLE ONLY public.ortu_siswa DROP CONSTRAINT unique_ortu_siswa;
       public            postgres    false    207    207            �           2606    17672    spp unique_siswa_semester 
   CONSTRAINT     b   ALTER TABLE ONLY public.spp
    ADD CONSTRAINT unique_siswa_semester UNIQUE (id_siswa, semester);
 C   ALTER TABLE ONLY public.spp DROP CONSTRAINT unique_siswa_semester;
       public            postgres    false    215    215            �           2606    17572    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    203            �           2606    17570    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            �           2606    17710    beasiswa beasiswa_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.beasiswa
    ADD CONSTRAINT beasiswa_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id_siswa);
 I   ALTER TABLE ONLY public.beasiswa DROP CONSTRAINT beasiswa_id_siswa_fkey;
       public          postgres    false    2957    221    205            �           2606    17626    emoney emoney_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emoney
    ADD CONSTRAINT emoney_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id_siswa);
 E   ALTER TABLE ONLY public.emoney DROP CONSTRAINT emoney_id_siswa_fkey;
       public          postgres    false    209    205    2957            �           2606    17605 "   ortu_siswa ortu_siswa_id_ortu_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ortu_siswa
    ADD CONSTRAINT ortu_siswa_id_ortu_fkey FOREIGN KEY (id_ortu) REFERENCES public.users(id_user) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.ortu_siswa DROP CONSTRAINT ortu_siswa_id_ortu_fkey;
       public          postgres    false    2951    207    203            �           2606    17610 #   ortu_siswa ortu_siswa_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ortu_siswa
    ADD CONSTRAINT ortu_siswa_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id_siswa) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.ortu_siswa DROP CONSTRAINT ortu_siswa_id_siswa_fkey;
       public          postgres    false    2957    207    205            �           2606    17653 ,   riwayat_emoney riwayat_emoney_id_emoney_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.riwayat_emoney
    ADD CONSTRAINT riwayat_emoney_id_emoney_fkey FOREIGN KEY (id_emoney) REFERENCES public.emoney(id_emoney);
 V   ALTER TABLE ONLY public.riwayat_emoney DROP CONSTRAINT riwayat_emoney_id_emoney_fkey;
       public          postgres    false    209    2965    213            �           2606    17658 1   riwayat_emoney riwayat_emoney_id_tipe_emoney_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.riwayat_emoney
    ADD CONSTRAINT riwayat_emoney_id_tipe_emoney_fkey FOREIGN KEY (id_tipe_emoney) REFERENCES public.tipe_emoney(id_tipe_emoney);
 [   ALTER TABLE ONLY public.riwayat_emoney DROP CONSTRAINT riwayat_emoney_id_tipe_emoney_fkey;
       public          postgres    false    211    2969    213            �           2606    17590    siswa siswa_id_user_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 B   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_id_user_fkey;
       public          postgres    false    203    2951    205            �           2606    17696 #   spp_details spp_details_id_spp_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.spp_details
    ADD CONSTRAINT spp_details_id_spp_fkey FOREIGN KEY (id_spp) REFERENCES public.spp(id_spp);
 M   ALTER TABLE ONLY public.spp_details DROP CONSTRAINT spp_details_id_spp_fkey;
       public          postgres    false    2973    219    215            �           2606    17673    spp spp_id_siswa_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.spp
    ADD CONSTRAINT spp_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id_siswa);
 ?   ALTER TABLE ONLY public.spp DROP CONSTRAINT spp_id_siswa_fkey;
       public          postgres    false    2957    215    205            �           2606    17732 *   spp_payments spp_payments_id_beasiswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.spp_payments
    ADD CONSTRAINT spp_payments_id_beasiswa_fkey FOREIGN KEY (id_beasiswa) REFERENCES public.beasiswa(id_beasiswa) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.spp_payments DROP CONSTRAINT spp_payments_id_beasiswa_fkey;
       public          postgres    false    223    221    2983            �           2606    17727 %   spp_payments spp_payments_id_spp_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.spp_payments
    ADD CONSTRAINT spp_payments_id_spp_fkey FOREIGN KEY (id_spp) REFERENCES public.spp(id_spp);
 O   ALTER TABLE ONLY public.spp_payments DROP CONSTRAINT spp_payments_id_spp_fkey;
       public          postgres    false    2973    223    215            �           2606    17747 4   tabungan_beasiswa tabungan_beasiswa_id_beasiswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tabungan_beasiswa
    ADD CONSTRAINT tabungan_beasiswa_id_beasiswa_fkey FOREIGN KEY (id_beasiswa) REFERENCES public.beasiswa(id_beasiswa) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.tabungan_beasiswa DROP CONSTRAINT tabungan_beasiswa_id_beasiswa_fkey;
       public          postgres    false    225    221    2983            �           2606    17752 1   tabungan_beasiswa tabungan_beasiswa_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tabungan_beasiswa
    ADD CONSTRAINT tabungan_beasiswa_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id_siswa) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.tabungan_beasiswa DROP CONSTRAINT tabungan_beasiswa_id_siswa_fkey;
       public          postgres    false    2957    205    225            �           2606    17573    users users_id_role_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_role_fkey FOREIGN KEY (id_role) REFERENCES public.role(id_role);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_role_fkey;
       public          postgres    false    2945    201    203            Q   `   x�3�4�tJM,�,.OT(J-.�9������T��\��X��������T�����ؘˈ��ͻ�(1/]�71����fK=KKSSKC�=... N��      E   Z   x���	DQ��b�y�r��c��	(NQd��X�f��c^��x��-w���@����^�=ڨM:�]��mz�}�T�&����'�_D��      C   `   x�̹0ј-�#�݋����
��V�L���Pg��LMV�������l]�J7l���y�?�r����S���ou��_�ȗ��4���dM      I     x���AN1����@-ǎ㜂�TT��,��?A%���:z�N�]���,/��z}[?��pZ?/��t�lcQE�(q;�uG���k+�2o����d�q�T�y�,���36���bںp5K���-�X��)筲��y�(����-�[#�<6�1nx$�V�t�es�l��U�E���-ȯ>}������� ׄ	��K���.���X���U�c�6N)%	��ܻ���
�qW��=�c��Q�Ie2zh�ѱ��u�d�!��
R�
���'0��蕉��)5�      =   :   x�3�LL����2�,�,.O�2��/J�K�/)M�2��N-H�I�/N���I������� ��c      A   d  x�E��N�@���S�fK�M��6��b�e�b;*�ٲi��=8r�O~�o	|��B/�.��9L�u���zk=e��U%.�\@{�䶜~�5,����M��_'�u+\Z��g����!��C�A�+�W�Oѵ��5�XYS��?8�{9��4-4X[]�C�8�C�MT`c}�9]u�/�YR��j:�)�s���J����#�3�-h�dT����8~�=sP�dZ�^�3�o��H��E>�=���x�lB+$C����>��x�UH��i����[]�F28Mm�sފ묧�m$�Ӵ]���8�@2:M�}8i��b�Ő�<�7@M{�?�s$y�ow��v���      K   6  x�%��mA�3�!���rQ�q��S�l�䩩�U����w��=������}��}��O����~?|��0��0��0��0��0��0��0����ro1V��"�("��&"��"�VaѰhX4,��EâaѰVﰨ���,"��"��,"��"��>âaѰhX4,��Eâa}�Ee��dYD�EdYD�����EâaѰhX4,����	��:��EdYD�EdYD��oX4,��EâaѰhX4���j\�.��J�ڬ8��ʳ��@���{���G�Qz���G��z����?������C2~p      O      x��\��ݶ]�O�'(Ŀ!�L��(څ���n> n�:1
�~���DJ$u���$j�����Pf������������Mv���nY�����?~�����o[e�oF�?|�_�������ۄ�칿�#����~�������"}F���?�}y���_>}�����o�n��4o)Γ6�&�����lQ��ݒ�~����O����?���N�m>v3����h�sD����⍂�7�����׷��>}�����}�a3��%�k����Oo�0����9�����
k`V{�洶���������ens��S���n��~�Oކ��+��ds�$ϡ�I��C�̓^��`ǫ�	��<����J3 1�#/��9������lr�M8�=��^�e� !fN���/?�����W�s�IAՙ�0�˛p��]AM.�fs�_b��'�a�y�o�q`������wXc®���q�<�E>+(I�a��ΞA���I���?�����Q��'���LC�'F��]�8��hv��CR���l�.��\��P;Ə�M�,}� ;�����N�c�tp �1�@,��>����~�^�|ë0\/r�]]F����t�
�<̢��1]Ed�2cPt,�B�R<M>j�Ґ�i�������(����}��Z��1٫��!��nEe�j�� �I+M�I�쒨`#�Ki�E�sjr�X�K��q��9��߇E��Nc�DU�����9l���)��ZeX"����Z"�-�U�<���92�t��Pj�H�h�[�=���h4�rG7�N�覺\��fs˛]�Cd�.����H*S���!Q�s�qz�Ȏf�)�/���zS�<���h��	!V�R�A�F� �f�B�-�E`���-@z��[��ط����|�����+n��d�����ub���`��=M�����֖ha� �L�sN�g�!�e�ɀC"^�����������Dè�A�O�` |�Ym��`�¸|TD���qak�3�P
ɳ��ȉe2�W�He�FE*�ĩ^#��BX$H�Kt�1���>��Z:��Ѝ�̝�L�4���YA�Q�­��\�?�*릲]������?�+#O��A��*����W��J2�2��4_�>�`�1Pc��.�gD�-@�<dpX���i�~���ZT)�`(�ֿ�S,xaSĮYTG���s^j��[�p��t��ë�{�
U�@ ��[*Ň�(��ai"]u������l]�)Y:�TK�঩{�	(�F�K�%�u���dA�(q�y���/P��N�"�W��z��9���KE*��Ä�x��4�i�30�M9(KC��q�T� pSO���L
R�c��µ�k�ӗ����t��&"���ڲa$Lvϗ��Iu�>QHY�?z�����P�\���eATU�x|9�S˦�Nu�^U��!�/E>U���X�,0�9C�*ʜ,h�MZ�r�b����86T�C
����3F�U֚_R�y���b=�,^)n#�X?f��4�JV�;$ ��:��i������2kˁ��n�x�7���`�����S�{]�<�?�V(��6erx&��YZSa�R�x��X0������%X���󹉅Cz�^�].�t�{�^�hI�6T����/��
�BO�7�^�-���ʄ�2ٱ$Uk����Jxl$�+��8g�*�R�i�a]`<�JS�Ǆ�7LH���B�u�����Jy�-�ld;N�^�Z�2-�'<n�$ݪ�����m�Xh�î��}���p��x�Í�F�N�`oV�8�KLB.;N,�Uj�4�@g�5��L(O��6��_��*�ۛ��|W�-���ZN6����k"Eh/�
��%ʆ�ÞE�p�|>X ����A�D"�mv�'fUEH���&�v[�Ex�4'1pඎ�LNu״�B��������M��-�d'_�{�{<J&Iv��Ё���F��.A��%-�ht`��O98t�*�r[O�hBӜ��6�� t��9��N��}�NW��W/aϚ�x����9����Xp�Җ����/����up�N�q�6-�}$6���j�ǫ�t����ga�(	�o�T�b�Ǎ4=9��?y�a{���aP�U�QX �p0)�����./�֦D����p[�qo͜�j�U��ʨ�6����^����U�	�`�i�Ҫ��e�q=�@��$��1 * ;	5 ����]PE�e����bWt�g؅+w�R�����
O�`�M5�k��ı!�h��&%0]�X��!��b�J�$]5p�ɺ&^5���c��pÂ�8P\�@����sgD�Ժ������`o$3!�J��ڮދ�����x[%�6�q�õ?�ꭚ��\��41���;�]Yd$&��R+鳢jF�� p�����y�u�!�$�`��U��n3�Tj���<�0���\��ѳ`�#ϫ��u+b��woܹ�Xt�\������{��=x�L���[�zji�(za�r��t�/v�<,�*Q�ҥ�Q��|����hg�����^�����e����\[?��B|_�8����n2Z�u*�uf��b��K�>�u� �f��1�A|g4`X_�&ku,�6Fx{un��z�h��Z�U@{��ymA�K[�l7����=}�����<��ي�A������]����4�+C������!���L���ϼF��ƃ��b�̃Ц.���{h����*mӠ'�^�X�n�U�%�Ѓ�fO��.!a$��������e|�Pk�#�`��p�-m[��f�*��5��,6N"�i5mr]7F{�XK�J�J��NP�\a�Tc�r5�t8 ��T���(i�z���*����v�1������\��3�>��輵�*Gz�XO�=�!��ʤ��۶���QNo � ���u�կ�0���-��i[��i4Ց�?7���I�����@�,u5i/�����WX�X������9MD��Րi��!^�Q�����t �E�L��-�D󅜲+b렝����	HB����ه@@=���mp�<h����_�걋� jj�.NPb��e /͎9,���-Ca����i��?hW,m7	�`$˓ R4=(1�v��u��Xw�B�xGV0W�����f�!�0���J$x�2��:dE%�)(e7���ɐ&C��υ9أ��\쭭o����}G�O�_ ����Se����iWNؼ���XBPU_�Fi����Y$��m��6��?�瀼�'���$����H�^24�߭cv��*���΃G�]�w��,������5hsm�6�%�vI*,�1���(�d-e��DM�5�6��&X�r�`���4������$���t�6��@�Re�Rp^/W7�d@�X��=rt4=�F����־����Ih]-��j��;r�Cl�����`��t�b�;��Dv�TU��r99(��rB@rA��D�m�����N ��ō�k!޴�.�s�,B\{��B2�qe4������+��R��:��PȂ�%�T���a�t���*� A���vo����1W�?Z�^�t���G�N��F��xB �M#����`8�U琚�6��mA$a�&��=��`�zX_Ovj"�\��n��vz�,�:�/(��GG�Sv�4XE���Jw�ӑ��!(f��FTm�f�߯}��+���]�b|Stƃ���Z��U#Wa���s��\'��6Փp)��+����7�E�w�� ��D��g��%`���ўX�"C�]=�.�@@���6�T�UP_�mLjw���M$@�ʢ��Jv�4���#�����i�����aq�CNc\��*�7��49P�DÉ/�	C?&�6����_c�<�d��Lw�E���/G���z;mR�����J�c9���i���Z�`(����s�b��# [��GS��.y�Oe�6 ��U�a&���~9�,u����
,����.ҳ+riG��K��M^U �p*Ҕ�!���_�9C;���h����G8��(ॵ�1@�MetbrM�lo-}c�ǣw�1���b�
��DKN������WN3���7�i��&��M�D���H�rB� �   %������]�t5#`���	*�}��E�E��s�n��<��Η��ͯg�HG�-���e���R\H\*s]���K��A\�a������UD-�W�}� #ҢrW�7�r�}�c��f�گ��q�wo|�P��:TLA�o����+�#��^�\�X}���@� #�
-��\[X�L�0�6��Z�5��O�޽�?+:Q      S   �   x���;�0D��S�X��cwp ���"ER�q{�@ �������8��^�\��T����<�/��7�6��h!*�!jTɘ �C�m؞�a�n��!/��<$׬؂����ũ���1qB����@�в!��f����W���7
L1��g����C��n�`m���D�8_*      M   R  x�e��n�0���)x����[i������K�f�Q������vY6���6_+P�RW>�Ӓ:P��Z�K��0��#�1N�#�kPX�eX�S�Cxl[d��p�!쥶��>�0a�iN:j����P�N�aOUI@B��B�)��V�ՇT��ԅ3��u�(��2`2���c������IrW�Q^�U�5Dk��+7��)s?,c���Aq�l�D�u%|S�YZI�綴����i�4S2�-r�]>���	�.xa����γ���qRK"v��	Ȏ-vH3;KZ������5|c׶xF�ϝ�k����Hrw��J@�HG0i���ߪ����~�֋o��(��W�@      U      x������ � �      G   $   x�3�H�M,.�N��2���SsJ���=... ��	I      ?   C  x�m�ɖ��E��Wd㴩+{O���q;!��H�|��L��A�ޚ;�{I  .��p��Ѩ*�?��A�!g�CEG�{ޑ�'��8�װ��<#��]��@�z��8Y���6A�_$��g���zې�S�I�)Q����GOx�	=�t�\{�,�(�y���ӎD����o�oJP ����6kG�k>�Xq:ƞ����H�;�N`��r�)+����Lـ�.�t�dk���8��A�Um��_�@�(���/�䱑=n���w���Ǉ�D��?̌7�M^��_5bg]��]���| � N[�a�Z�b�������O�B���@]e��2����q�X;!۴ ��9[ �@�@5Gl~KNs�ct�!`	$ī=b���y���	�}�aہ�M�>f�`�b����cG��(G��y�fz��L�Q0I�U�V!�>bes��6н���?v!�ӓ1���F�]ڧѻZ	�smڑ�"����,�q���ܭ��7�۬|_`�I���+�����'xq ��@4�q}�Yg����I����a_e� mDw�|��@� ����O޷Ep!c�30��!@-�y%��U����k$�".IJF4�(e�o�-\�A|�5�_���G��_��9i�%��xيa����0�x*ϝ��fE�zd�����#+� �@�k�,�%�x��F�<��嶈PI����\��E�r��Q�i��`���E�W����L��<���ۨ
��.O:"��{ܪ�i���:�(�9��#b�����3���Ī�vz��lOĆ���fz��dr��O���D�u�Y/�i<�>C΋��*h���Q�XU��o���������ැ��'�N6>1ֻO�ҵ�Ç��e��^��G�#5�*���gt��"�������T�E�mҽ�_�k����L:{RRx '��������V��U���3��z���V:.&!�ߞ����U��֊Sj�vlU[�>},��o�O�*}oW��5��5^L�PO/�H���>��ގ��.���EN"�t:����Mȏ-��p�������Ī�5�@=�r^�1�l�{79Qgg�2tR۶=��Nz�!<�_ȶ\
B�������ɏ�Ī�mZ�`���do4.'�t��H�������-�rs��B�F5��z�ߋ���M����]l�ջ*X!�����z�~�PH����hh�bUz5WK`/��ҥ�O_/������6��qj���G��S*�6��qs���W��h����r�ބ��h��1n�m~.B!U���}}(�ِ��a�Q8?� ����%T�{�5)���+���O�����kꋤ�v�a��.\�N[�+�n_j&�߱�J�c.���CgS:J�"S��
�2_>��oY/��o���c�rt1�������,��pBmO�^�-{�T�^J*���&�;VL�?����%���_��2{�b�/��)W��&�%(�O�ز��0LZ���t��Neߧ�[�K>���*���k�pI��Ӻ�K�0%�vbfwT�O�����:�C�<&"��w/- ���3ki��v�Yu�М���K�}q�=��_��7p�B��l�=�ȟ�[z	�����<\q��DU�Im��
O0���t�A��i������pm��6����;����_���Y��8:���m�T2��'A4�z��9���a��@�K�zTpz��o?/��o����}o.�ń��،#Ƹh��b1�
ͅ��X(z� �I���w;/��O�z9��S.;�L��%B^����	�����*��tsl�3��if������_�<ܮ     