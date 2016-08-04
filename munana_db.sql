--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-08-04 06:26:45 ECT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE munana;
--
-- TOC entry 2258 (class 1262 OID 16436)
-- Name: munana; Type: DATABASE; Schema: -; Owner: munanadata
--

CREATE DATABASE munana WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_ES.UTF-8' LC_CTYPE = 'es_ES.UTF-8';


ALTER DATABASE munana OWNER TO munanadata;

\connect munana

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 11935)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16537)
-- Name: t_agencia; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_agencia (
    nombre text,
    tipo text,
    id_pais smallint,
    ciudad text,
    direccion text,
    telefono text,
    fax text,
    email text,
    cpostal text,
    id_agencia integer NOT NULL
);


ALTER TABLE t_agencia OWNER TO munanadata;

--
-- TOC entry 184 (class 1259 OID 16543)
-- Name: Agencia_id_agencia_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Agencia_id_agencia_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Agencia_id_agencia_seq" OWNER TO munanadata;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 184
-- Name: Agencia_id_agencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Agencia_id_agencia_seq" OWNED BY t_agencia.id_agencia;


--
-- TOC entry 178 (class 1259 OID 16468)
-- Name: t_cliente; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_cliente (
    id_cliente integer NOT NULL,
    nombre text,
    id_pais smallint NOT NULL,
    ciudad text,
    direccion text,
    telefono text,
    fax text,
    email text,
    cpostal text,
    descriptivo text
);


ALTER TABLE t_cliente OWNER TO munanadata;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN t_cliente.id_cliente; Type: COMMENT; Schema: public; Owner: munanadata
--

COMMENT ON COLUMN t_cliente.id_cliente IS '‌';


--
-- TOC entry 177 (class 1259 OID 16464)
-- Name: Cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Cliente_id_cliente_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Cliente_id_cliente_seq" OWNER TO munanadata;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 177
-- Name: Cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Cliente_id_cliente_seq" OWNED BY t_cliente.id_cliente;


--
-- TOC entry 176 (class 1259 OID 16454)
-- Name: t_detalle; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_detalle (
    id_detalle integer NOT NULL,
    id_factura bigint NOT NULL,
    id_producto integer,
    piezas smallint,
    unidadxbunch smallint,
    unidadxcaja smallint,
    longpeso smallint,
    id_proveedor integer,
    empaque text,
    preciouxbunch boolean,
    preciounitario real,
    factproveedor bigint,
    id_pedido integer
);


ALTER TABLE t_detalle OWNER TO munanadata;

--
-- TOC entry 175 (class 1259 OID 16452)
-- Name: Detalle_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Detalle_id_detalle_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Detalle_id_detalle_seq" OWNER TO munanadata;

--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 175
-- Name: Detalle_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Detalle_id_detalle_seq" OWNED BY t_detalle.id_detalle;


--
-- TOC entry 174 (class 1259 OID 16441)
-- Name: t_factura; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_factura (
    id_factura integer NOT NULL,
    numero bigint NOT NULL,
    fecha date,
    fechapago date,
    id_transporte integer,
    id_agencia integer,
    guia bigint NOT NULL,
    id_cliente integer
);


ALTER TABLE t_factura OWNER TO munanadata;

--
-- TOC entry 173 (class 1259 OID 16437)
-- Name: Factura_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Factura_id_factura_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Factura_id_factura_seq" OWNER TO munanadata;

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 173
-- Name: Factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Factura_id_factura_seq" OWNED BY t_factura.id_factura;


--
-- TOC entry 188 (class 1259 OID 16580)
-- Name: t_pais; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_pais (
    id_pais smallint NOT NULL,
    nombre text,
    isocod2 text,
    isocod3 text,
    codtel text,
    continente text
);


ALTER TABLE t_pais OWNER TO munanadata;

--
-- TOC entry 187 (class 1259 OID 16578)
-- Name: Pais_id_pais_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Pais_id_pais_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Pais_id_pais_seq" OWNER TO munanadata;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 187
-- Name: Pais_id_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Pais_id_pais_seq" OWNED BY t_pais.id_pais;


--
-- TOC entry 181 (class 1259 OID 16506)
-- Name: t_producto; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_producto (
    id_producto integer NOT NULL,
    variedad text,
    color text,
    unidad text,
    tipo_flor text,
    dimension text,
    pcorte text
);


ALTER TABLE t_producto OWNER TO munanadata;

--
-- TOC entry 180 (class 1259 OID 16504)
-- Name: Producto_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Producto_id_producto_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Producto_id_producto_seq" OWNER TO munanadata;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 180
-- Name: Producto_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Producto_id_producto_seq" OWNED BY t_producto.id_producto;


--
-- TOC entry 179 (class 1259 OID 16497)
-- Name: t_proveedor; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_proveedor (
    nombre text,
    id_pais smallint,
    ciudad text,
    direccion text,
    telefono text,
    fax text,
    email text,
    cpostal text,
    tipo text,
    id_proveedor integer NOT NULL,
    descriptivo text
);


ALTER TABLE t_proveedor OWNER TO munanadata;

--
-- TOC entry 186 (class 1259 OID 16562)
-- Name: Proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Proveedor_id_proveedor_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Proveedor_id_proveedor_seq" OWNER TO munanadata;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 186
-- Name: Proveedor_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Proveedor_id_proveedor_seq" OWNED BY t_proveedor.id_proveedor;


--
-- TOC entry 182 (class 1259 OID 16518)
-- Name: t_transporte; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_transporte (
    tipo text,
    nombre text,
    direccion text,
    telefono text,
    fax text,
    email text,
    codigo smallint,
    id_transporte integer NOT NULL
);


ALTER TABLE t_transporte OWNER TO munanadata;

--
-- TOC entry 185 (class 1259 OID 16553)
-- Name: Transporte_id_transporte_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE "Transporte_id_transporte_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Transporte_id_transporte_seq" OWNER TO munanadata;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transporte_id_transporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE "Transporte_id_transporte_seq" OWNED BY t_transporte.id_transporte;


--
-- TOC entry 196 (class 1259 OID 24633)
-- Name: t_empaque; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_empaque (
    id_empaque integer NOT NULL,
    nombre text,
    bunchsref smallint
);


ALTER TABLE t_empaque OWNER TO munanadata;

--
-- TOC entry 195 (class 1259 OID 24631)
-- Name: t_empaque_id_empaque_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE t_empaque_id_empaque_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_empaque_id_empaque_seq OWNER TO munanadata;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 195
-- Name: t_empaque_id_empaque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE t_empaque_id_empaque_seq OWNED BY t_empaque.id_empaque;


--
-- TOC entry 198 (class 1259 OID 24644)
-- Name: t_longitud; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_longitud (
    id_longitud smallint NOT NULL,
    valor smallint
);


ALTER TABLE t_longitud OWNER TO munanadata;

--
-- TOC entry 197 (class 1259 OID 24642)
-- Name: t_longitud_id_longitud_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE t_longitud_id_longitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_longitud_id_longitud_seq OWNER TO munanadata;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 197
-- Name: t_longitud_id_longitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE t_longitud_id_longitud_seq OWNED BY t_longitud.id_longitud;


--
-- TOC entry 193 (class 1259 OID 16702)
-- Name: t_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE t_pedido (
    id_producto integer,
    piezas smallint,
    unidadxbunch smallint,
    unidadxcaja smallint,
    longpeso smallint,
    empaque text,
    preciouxbunch boolean,
    preciounitario real,
    id_pedido integer NOT NULL,
    fecha date
);


ALTER TABLE t_pedido OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16710)
-- Name: t_pedido_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_pedido_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 194
-- Name: t_pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_pedido_id_pedido_seq OWNED BY t_pedido.id_pedido;


--
-- TOC entry 200 (class 1259 OID 24652)
-- Name: t_peso; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_peso (
    id_peso smallint NOT NULL,
    valor smallint
);


ALTER TABLE t_peso OWNER TO munanadata;

--
-- TOC entry 199 (class 1259 OID 24650)
-- Name: t_peso_id_peso_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE t_peso_id_peso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_peso_id_peso_seq OWNER TO munanadata;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 199
-- Name: t_peso_id_peso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE t_peso_id_peso_seq OWNED BY t_peso.id_peso;


--
-- TOC entry 190 (class 1259 OID 16659)
-- Name: t_usercliente; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_usercliente (
    id_usercliente integer NOT NULL,
    nombre text,
    nusuario text,
    clave text,
    tipo text,
    id_cliente integer,
    email text,
    telefono text
);


ALTER TABLE t_usercliente OWNER TO munanadata;

--
-- TOC entry 191 (class 1259 OID 16676)
-- Name: t_userproveedor; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_userproveedor (
    nombre text,
    nusuario text,
    clave text,
    tipo text,
    id_proveedor integer,
    email text,
    telefono text,
    id_userproveedor integer NOT NULL
);


ALTER TABLE t_userproveedor OWNER TO munanadata;

--
-- TOC entry 192 (class 1259 OID 16691)
-- Name: t_userproveedor_id_userproveedor_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE t_userproveedor_id_userproveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_userproveedor_id_userproveedor_seq OWNER TO munanadata;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 192
-- Name: t_userproveedor_id_userproveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE t_userproveedor_id_userproveedor_seq OWNED BY t_userproveedor.id_userproveedor;


--
-- TOC entry 203 (class 1259 OID 32821)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE TABLE t_usuarios (
    id_usuario integer NOT NULL,
    nombre text,
    email text,
    password text,
    id_pais smallint,
    ciudad text,
    telefono text,
    empresa text,
    web text,
    facebook text,
    linkedin text,
    tipo text,
    notas text
);


ALTER TABLE t_usuarios OWNER TO munanadata;

--
-- TOC entry 202 (class 1259 OID 32819)
-- Name: t_usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE t_usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_usuarios_id_usuario_seq OWNER TO munanadata;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE t_usuarios_id_usuario_seq OWNED BY t_usuarios.id_usuario;


--
-- TOC entry 189 (class 1259 OID 16657)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: munanadata
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO munanadata;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: munanadata
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY t_usercliente.id_usercliente;


--
-- TOC entry 201 (class 1259 OID 24658)
-- Name: v_producto; Type: VIEW; Schema: public; Owner: munanadata
--

CREATE VIEW v_producto AS
 SELECT ((((t_producto.variedad || ' - '::text) || t_producto.tipo_flor) || ' - '::text) || t_producto.color) AS producto,
    t_producto.dimension
   FROM t_producto;


ALTER TABLE v_producto OWNER TO munanadata;

--
-- TOC entry 2065 (class 2604 OID 16545)
-- Name: id_agencia; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_agencia ALTER COLUMN id_agencia SET DEFAULT nextval('"Agencia_id_agencia_seq"'::regclass);


--
-- TOC entry 2061 (class 2604 OID 16471)
-- Name: id_cliente; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('"Cliente_id_cliente_seq"'::regclass);


--
-- TOC entry 2060 (class 2604 OID 16457)
-- Name: id_detalle; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_detalle ALTER COLUMN id_detalle SET DEFAULT nextval('"Detalle_id_detalle_seq"'::regclass);


--
-- TOC entry 2070 (class 2604 OID 24636)
-- Name: id_empaque; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_empaque ALTER COLUMN id_empaque SET DEFAULT nextval('t_empaque_id_empaque_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 16444)
-- Name: id_factura; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_factura ALTER COLUMN id_factura SET DEFAULT nextval('"Factura_id_factura_seq"'::regclass);


--
-- TOC entry 2071 (class 2604 OID 24647)
-- Name: id_longitud; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_longitud ALTER COLUMN id_longitud SET DEFAULT nextval('t_longitud_id_longitud_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 16583)
-- Name: id_pais; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_pais ALTER COLUMN id_pais SET DEFAULT nextval('"Pais_id_pais_seq"'::regclass);


--
-- TOC entry 2069 (class 2604 OID 16712)
-- Name: id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_pedido ALTER COLUMN id_pedido SET DEFAULT nextval('t_pedido_id_pedido_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 24655)
-- Name: id_peso; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_peso ALTER COLUMN id_peso SET DEFAULT nextval('t_peso_id_peso_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 16509)
-- Name: id_producto; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_producto ALTER COLUMN id_producto SET DEFAULT nextval('"Producto_id_producto_seq"'::regclass);


--
-- TOC entry 2062 (class 2604 OID 16564)
-- Name: id_proveedor; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_proveedor ALTER COLUMN id_proveedor SET DEFAULT nextval('"Proveedor_id_proveedor_seq"'::regclass);


--
-- TOC entry 2064 (class 2604 OID 16555)
-- Name: id_transporte; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_transporte ALTER COLUMN id_transporte SET DEFAULT nextval('"Transporte_id_transporte_seq"'::regclass);


--
-- TOC entry 2067 (class 2604 OID 16662)
-- Name: id_usercliente; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_usercliente ALTER COLUMN id_usercliente SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 16693)
-- Name: id_userproveedor; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_userproveedor ALTER COLUMN id_userproveedor SET DEFAULT nextval('t_userproveedor_id_userproveedor_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 32824)
-- Name: id_usuario; Type: DEFAULT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('t_usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 184
-- Name: Agencia_id_agencia_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Agencia_id_agencia_seq"', 1, false);


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 177
-- Name: Cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Cliente_id_cliente_seq"', 1, false);


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 175
-- Name: Detalle_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Detalle_id_detalle_seq"', 1, false);


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 173
-- Name: Factura_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Factura_id_factura_seq"', 1, false);


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 187
-- Name: Pais_id_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Pais_id_pais_seq"', 1, false);


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 180
-- Name: Producto_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Producto_id_producto_seq"', 6, true);


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 186
-- Name: Proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Proveedor_id_proveedor_seq"', 1, false);


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transporte_id_transporte_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('"Transporte_id_transporte_seq"', 1, false);


--
-- TOC entry 2234 (class 0 OID 16537)
-- Dependencies: 183
-- Data for Name: t_agencia; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_agencia (nombre, tipo, id_pais, ciudad, direccion, telefono, fax, email, cpostal, id_agencia) FROM stdin;
\.


--
-- TOC entry 2229 (class 0 OID 16468)
-- Dependencies: 178
-- Data for Name: t_cliente; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_cliente (id_cliente, nombre, id_pais, ciudad, direccion, telefono, fax, email, cpostal, descriptivo) FROM stdin;
\.


--
-- TOC entry 2227 (class 0 OID 16454)
-- Dependencies: 176
-- Data for Name: t_detalle; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_detalle (id_detalle, id_factura, id_producto, piezas, unidadxbunch, unidadxcaja, longpeso, id_proveedor, empaque, preciouxbunch, preciounitario, factproveedor, id_pedido) FROM stdin;
\.


--
-- TOC entry 2247 (class 0 OID 24633)
-- Dependencies: 196
-- Data for Name: t_empaque; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_empaque (id_empaque, nombre, bunchsref) FROM stdin;
1	Half	10
2	Quarter	5
3	Octave	3
4	Full	20
\.


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 195
-- Name: t_empaque_id_empaque_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('t_empaque_id_empaque_seq', 4, true);


--
-- TOC entry 2225 (class 0 OID 16441)
-- Dependencies: 174
-- Data for Name: t_factura; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_factura (id_factura, numero, fecha, fechapago, id_transporte, id_agencia, guia, id_cliente) FROM stdin;
\.


--
-- TOC entry 2249 (class 0 OID 24644)
-- Dependencies: 198
-- Data for Name: t_longitud; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_longitud (id_longitud, valor) FROM stdin;
2	40
3	50
4	60
5	70
6	80
7	90
8	100
1	30
9	110
10	120
\.


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 197
-- Name: t_longitud_id_longitud_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('t_longitud_id_longitud_seq', 9, true);


--
-- TOC entry 2239 (class 0 OID 16580)
-- Dependencies: 188
-- Data for Name: t_pais; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_pais (id_pais, nombre, isocod2, isocod3, codtel, continente) FROM stdin;
\.


--
-- TOC entry 2244 (class 0 OID 16702)
-- Dependencies: 193
-- Data for Name: t_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_pedido (id_producto, piezas, unidadxbunch, unidadxcaja, longpeso, empaque, preciouxbunch, preciounitario, id_pedido, fecha) FROM stdin;
\.


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 194
-- Name: t_pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_pedido_id_pedido_seq', 1, false);


--
-- TOC entry 2251 (class 0 OID 24652)
-- Dependencies: 200
-- Data for Name: t_peso; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_peso (id_peso, valor) FROM stdin;
1	200
2	250
3	300
4	400
5	500
6	600
7	700
8	800
9	900
10	1000
\.


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 199
-- Name: t_peso_id_peso_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('t_peso_id_peso_seq', 10, true);


--
-- TOC entry 2232 (class 0 OID 16506)
-- Dependencies: 181
-- Data for Name: t_producto; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_producto (id_producto, variedad, color, unidad, tipo_flor, dimension, pcorte) FROM stdin;
1	Freedom	Red	stems	Rose	l	\N
3	Mondial	White	stems	Rose	l	\N
4	Pink Floyd	Pink	stems	Rose	l	\N
5	Million Star	White	grams	Gypsophila	w	\N
6	Limonium	Lavender	grams	Summer Flowers	w	\N
2	Iguana	Orange	stems	Rose	l	\N
\.


--
-- TOC entry 2230 (class 0 OID 16497)
-- Dependencies: 179
-- Data for Name: t_proveedor; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_proveedor (nombre, id_pais, ciudad, direccion, telefono, fax, email, cpostal, tipo, id_proveedor, descriptivo) FROM stdin;
\.


--
-- TOC entry 2233 (class 0 OID 16518)
-- Dependencies: 182
-- Data for Name: t_transporte; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_transporte (tipo, nombre, direccion, telefono, fax, email, codigo, id_transporte) FROM stdin;
\.


--
-- TOC entry 2241 (class 0 OID 16659)
-- Dependencies: 190
-- Data for Name: t_usercliente; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_usercliente (id_usercliente, nombre, nusuario, clave, tipo, id_cliente, email, telefono) FROM stdin;
\.


--
-- TOC entry 2242 (class 0 OID 16676)
-- Dependencies: 191
-- Data for Name: t_userproveedor; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_userproveedor (nombre, nusuario, clave, tipo, id_proveedor, email, telefono, id_userproveedor) FROM stdin;
\.


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 192
-- Name: t_userproveedor_id_userproveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('t_userproveedor_id_userproveedor_seq', 1, false);


--
-- TOC entry 2253 (class 0 OID 32821)
-- Dependencies: 203
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: munanadata
--

COPY t_usuarios (id_usuario, nombre, email, password, id_pais, ciudad, telefono, empresa, web, facebook, linkedin, tipo, notas) FROM stdin;
\.


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('t_usuarios_id_usuario_seq', 1, false);


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: munanadata
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, false);


--
-- TOC entry 2088 (class 2606 OID 16594)
-- Name: primaria_agencia; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_agencia
    ADD CONSTRAINT primaria_agencia PRIMARY KEY (id_agencia);


--
-- TOC entry 2080 (class 2606 OID 16592)
-- Name: primaria_cliente; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_cliente
    ADD CONSTRAINT primaria_cliente PRIMARY KEY (id_cliente);


--
-- TOC entry 2078 (class 2606 OID 16590)
-- Name: primaria_detalle; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_detalle
    ADD CONSTRAINT primaria_detalle PRIMARY KEY (id_detalle);


--
-- TOC entry 2098 (class 2606 OID 24641)
-- Name: primaria_empaque; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_empaque
    ADD CONSTRAINT primaria_empaque PRIMARY KEY (id_empaque);


--
-- TOC entry 2076 (class 2606 OID 16450)
-- Name: primaria_factura; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_factura
    ADD CONSTRAINT primaria_factura PRIMARY KEY (id_factura);


--
-- TOC entry 2100 (class 2606 OID 24649)
-- Name: primaria_lonigutd; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_longitud
    ADD CONSTRAINT primaria_lonigutd PRIMARY KEY (id_longitud);


--
-- TOC entry 2090 (class 2606 OID 16640)
-- Name: primaria_pais; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_pais
    ADD CONSTRAINT primaria_pais PRIMARY KEY (id_pais);


--
-- TOC entry 2096 (class 2606 OID 16720)
-- Name: primaria_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY t_pedido
    ADD CONSTRAINT primaria_pedido PRIMARY KEY (id_pedido);


--
-- TOC entry 2102 (class 2606 OID 24657)
-- Name: primaria_peso; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_peso
    ADD CONSTRAINT primaria_peso PRIMARY KEY (id_peso);


--
-- TOC entry 2084 (class 2606 OID 16588)
-- Name: primaria_producto; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_producto
    ADD CONSTRAINT primaria_producto PRIMARY KEY (id_producto);


--
-- TOC entry 2082 (class 2606 OID 16633)
-- Name: primaria_proveedor; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_proveedor
    ADD CONSTRAINT primaria_proveedor PRIMARY KEY (id_proveedor);


--
-- TOC entry 2086 (class 2606 OID 16606)
-- Name: primaria_transporte; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_transporte
    ADD CONSTRAINT primaria_transporte PRIMARY KEY (id_transporte);


--
-- TOC entry 2092 (class 2606 OID 16667)
-- Name: primaria_usercliente; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_usercliente
    ADD CONSTRAINT primaria_usercliente PRIMARY KEY (id_usercliente);


--
-- TOC entry 2094 (class 2606 OID 16701)
-- Name: primaria_userproveedor; Type: CONSTRAINT; Schema: public; Owner: munanadata; Tablespace: 
--

ALTER TABLE ONLY t_userproveedor
    ADD CONSTRAINT primaria_userproveedor PRIMARY KEY (id_userproveedor);


--
-- TOC entry 2074 (class 1259 OID 16451)
-- Name: i_primaria_facturas; Type: INDEX; Schema: public; Owner: munanadata; Tablespace: 
--

CREATE INDEX i_primaria_facturas ON t_factura USING btree (id_factura);


--
-- TOC entry 2104 (class 2606 OID 16600)
-- Name: foreign_agencia; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_factura
    ADD CONSTRAINT foreign_agencia FOREIGN KEY (id_agencia) REFERENCES t_agencia(id_agencia);


--
-- TOC entry 2103 (class 2606 OID 16595)
-- Name: foreign_cliente; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_factura
    ADD CONSTRAINT foreign_cliente FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente);


--
-- TOC entry 2106 (class 2606 OID 16612)
-- Name: foreign_factura; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_detalle
    ADD CONSTRAINT foreign_factura FOREIGN KEY (id_factura) REFERENCES t_factura(id_factura);


--
-- TOC entry 2111 (class 2606 OID 16641)
-- Name: foreign_pais; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_agencia
    ADD CONSTRAINT foreign_pais FOREIGN KEY (id_pais) REFERENCES t_pais(id_pais);


--
-- TOC entry 2110 (class 2606 OID 16646)
-- Name: foreign_pais; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_proveedor
    ADD CONSTRAINT foreign_pais FOREIGN KEY (id_pais) REFERENCES t_pais(id_pais);


--
-- TOC entry 2109 (class 2606 OID 16651)
-- Name: foreign_pais; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_cliente
    ADD CONSTRAINT foreign_pais FOREIGN KEY (id_pais) REFERENCES t_pais(id_pais);


--
-- TOC entry 2107 (class 2606 OID 16627)
-- Name: foreign_producto; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_detalle
    ADD CONSTRAINT foreign_producto FOREIGN KEY (id_producto) REFERENCES t_producto(id_producto);


--
-- TOC entry 2108 (class 2606 OID 16634)
-- Name: foreign_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_detalle
    ADD CONSTRAINT foreign_proveedor FOREIGN KEY (id_proveedor) REFERENCES t_proveedor(id_proveedor);


--
-- TOC entry 2105 (class 2606 OID 16607)
-- Name: foreign_transporte; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_factura
    ADD CONSTRAINT foreign_transporte FOREIGN KEY (id_transporte) REFERENCES t_transporte(id_transporte);


--
-- TOC entry 2112 (class 2606 OID 16668)
-- Name: secundaria_cliente; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_usercliente
    ADD CONSTRAINT secundaria_cliente FOREIGN KEY (id_cliente) REFERENCES t_cliente(id_cliente);


--
-- TOC entry 2113 (class 2606 OID 16684)
-- Name: secundaria_cliente; Type: FK CONSTRAINT; Schema: public; Owner: munanadata
--

ALTER TABLE ONLY t_userproveedor
    ADD CONSTRAINT secundaria_cliente FOREIGN KEY (id_proveedor) REFERENCES t_proveedor(id_proveedor);


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-08-04 06:26:46 ECT

--
-- PostgreSQL database dump complete
--

