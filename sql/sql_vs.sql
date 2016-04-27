--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addressbook; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE addressbook (
    id_address integer DEFAULT nextval('addressbook_id_address_seq'::regclass) NOT NULL,
    user_owner character varying(10) NOT NULL,
    to_user_fio character varying(40) NOT NULL,
    to_user_id character varying(10) NOT NULL
);


ALTER TABLE addressbook OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messages (
    id_message integer DEFAULT nextval('messages_id_message_seq'::regclass) NOT NULL,
    from_user_id character varying(10) NOT NULL,
    date_message timestamp without time zone NOT NULL,
    subject_message character varying(40) NOT NULL,
    text_message text NOT NULL,
    to_user_id character varying(10) NOT NULL,
    from_user_fio character varying(40) NOT NULL,
    to_user_fio character varying(40) NOT NULL
);


ALTER TABLE messages OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    login character varying(10) NOT NULL,
    fio_user character varying(40) NOT NULL,
    group_user text DEFAULT 'user'::text NOT NULL,
    password character varying(10) NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    email character varying(30) NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- Data for Name: addressbook; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (login);


--
-- Name: index_login; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_login ON users USING btree (login);


--
-- Name: FK_addressbook_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addressbook
    ADD CONSTRAINT "FK_addressbook_users" FOREIGN KEY (user_owner) REFERENCES users(login) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_messages_users_from; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "FK_messages_users_from" FOREIGN KEY (from_user_id) REFERENCES users(login) MATCH FULL;


--
-- Name: FK_messages_users_to; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "FK_messages_users_to" FOREIGN KEY (to_user_id) REFERENCES users(login) MATCH FULL;


--
-- PostgreSQL database dump complete
--

