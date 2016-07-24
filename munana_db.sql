--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-07-23 22:53:40 ECT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

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


-- Completed on 2016-07-23 22:53:40 ECT

--
-- PostgreSQL database dump complete
--

