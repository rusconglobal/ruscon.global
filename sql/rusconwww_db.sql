--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django_login;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django_login;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django_login;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django_login;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django_login;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django_login;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django_login;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django_login;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django_login;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django_login;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django_login;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django_login;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: cms_cmsplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_cmsplugin (
    id integer NOT NULL,
    placeholder_id integer,
    parent_id integer,
    "position" smallint,
    language character varying(15) NOT NULL,
    plugin_type character varying(50) NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT cms_cmsplugin_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_cmsplugin_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_cmsplugin_position_check CHECK (("position" >= 0)),
    CONSTRAINT cms_cmsplugin_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_cmsplugin_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_cmsplugin OWNER TO django_login;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_cmsplugin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_cmsplugin_id_seq OWNER TO django_login;

--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_cmsplugin_id_seq OWNED BY cms_cmsplugin.id;


--
-- Name: cms_globalpagepermission; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_globalpagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_moderate boolean NOT NULL,
    can_view boolean NOT NULL,
    can_recover_page boolean NOT NULL
);


ALTER TABLE public.cms_globalpagepermission OWNER TO django_login;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_globalpagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_id_seq OWNER TO django_login;

--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_globalpagepermission_id_seq OWNED BY cms_globalpagepermission.id;


--
-- Name: cms_globalpagepermission_sites; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_globalpagepermission_sites (
    id integer NOT NULL,
    globalpagepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.cms_globalpagepermission_sites OWNER TO django_login;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_globalpagepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_globalpagepermission_sites_id_seq OWNER TO django_login;

--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_globalpagepermission_sites_id_seq OWNED BY cms_globalpagepermission_sites.id;


--
-- Name: cms_helper_clocktown; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_helper_clocktown (
    id integer NOT NULL,
    town character varying(255) NOT NULL,
    hour_shift integer NOT NULL,
    town_en character varying(255),
    town_ru character varying(255),
    "order" integer NOT NULL,
    CONSTRAINT ck_order_pstv_6c4e235a5e85d37c CHECK (("order" >= 0)),
    CONSTRAINT cms_helper_clocktown_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.cms_helper_clocktown OWNER TO django_login;

--
-- Name: cms_helper_clocktown_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_helper_clocktown_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_helper_clocktown_id_seq OWNER TO django_login;

--
-- Name: cms_helper_clocktown_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_helper_clocktown_id_seq OWNED BY cms_helper_clocktown.id;


--
-- Name: cms_page; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_page (
    id integer NOT NULL,
    created_by character varying(70) NOT NULL,
    changed_by character varying(70) NOT NULL,
    parent_id integer,
    creation_date timestamp with time zone NOT NULL,
    changed_date timestamp with time zone NOT NULL,
    publication_date timestamp with time zone,
    publication_end_date timestamp with time zone,
    in_navigation boolean NOT NULL,
    soft_root boolean NOT NULL,
    reverse_id character varying(40),
    navigation_extenders character varying(80),
    published boolean NOT NULL,
    template character varying(100) NOT NULL,
    site_id integer NOT NULL,
    moderator_state smallint NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    login_required boolean NOT NULL,
    limit_visibility_in_menu smallint,
    publisher_is_draft boolean NOT NULL,
    publisher_public_id integer,
    publisher_state smallint NOT NULL,
    CONSTRAINT cms_page_level_check CHECK ((level >= 0)),
    CONSTRAINT cms_page_lft_check CHECK ((lft >= 0)),
    CONSTRAINT cms_page_rght_check CHECK ((rght >= 0)),
    CONSTRAINT cms_page_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.cms_page OWNER TO django_login;

--
-- Name: cms_page_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_id_seq OWNER TO django_login;

--
-- Name: cms_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_page_id_seq OWNED BY cms_page.id;


--
-- Name: cms_page_placeholders; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_page_placeholders (
    id integer NOT NULL,
    page_id integer NOT NULL,
    placeholder_id integer NOT NULL
);


ALTER TABLE public.cms_page_placeholders OWNER TO django_login;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_page_placeholders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_page_placeholders_id_seq OWNER TO django_login;

--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_page_placeholders_id_seq OWNED BY cms_page_placeholders.id;


--
-- Name: cms_pagemoderator; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_pagemoderator (
    id integer NOT NULL,
    page_id integer NOT NULL,
    user_id integer NOT NULL,
    moderate_page boolean NOT NULL,
    moderate_children boolean NOT NULL,
    moderate_descendants boolean NOT NULL
);


ALTER TABLE public.cms_pagemoderator OWNER TO django_login;

--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_pagemoderator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderator_id_seq OWNER TO django_login;

--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_pagemoderator_id_seq OWNED BY cms_pagemoderator.id;


--
-- Name: cms_pagemoderatorstate; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_pagemoderatorstate (
    id integer NOT NULL,
    page_id integer NOT NULL,
    user_id integer,
    created timestamp with time zone NOT NULL,
    action character varying(3),
    message text NOT NULL
);


ALTER TABLE public.cms_pagemoderatorstate OWNER TO django_login;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_pagemoderatorstate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagemoderatorstate_id_seq OWNER TO django_login;

--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_pagemoderatorstate_id_seq OWNED BY cms_pagemoderatorstate.id;


--
-- Name: cms_pagepermission; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_pagepermission (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    can_change boolean NOT NULL,
    can_add boolean NOT NULL,
    can_delete boolean NOT NULL,
    can_change_advanced_settings boolean NOT NULL,
    can_publish boolean NOT NULL,
    can_change_permissions boolean NOT NULL,
    can_move_page boolean NOT NULL,
    can_moderate boolean NOT NULL,
    can_view boolean NOT NULL,
    grant_on integer NOT NULL,
    page_id integer
);


ALTER TABLE public.cms_pagepermission OWNER TO django_login;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_pagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pagepermission_id_seq OWNER TO django_login;

--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_pagepermission_id_seq OWNED BY cms_pagepermission.id;


--
-- Name: cms_pageuser; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_pageuser (
    user_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageuser OWNER TO django_login;

--
-- Name: cms_pageusergroup; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_pageusergroup (
    group_ptr_id integer NOT NULL,
    created_by_id integer NOT NULL
);


ALTER TABLE public.cms_pageusergroup OWNER TO django_login;

--
-- Name: cms_placeholder; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    default_width smallint,
    CONSTRAINT cms_placeholder_default_width_check CHECK ((default_width >= 0))
);


ALTER TABLE public.cms_placeholder OWNER TO django_login;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_placeholder_id_seq OWNER TO django_login;

--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_placeholder_id_seq OWNED BY cms_placeholder.id;


--
-- Name: cms_title; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cms_title (
    id integer NOT NULL,
    language character varying(15) NOT NULL,
    title character varying(255) NOT NULL,
    menu_title character varying(255),
    slug character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    has_url_overwrite boolean NOT NULL,
    application_urls character varying(200),
    redirect character varying(255),
    meta_description text,
    meta_keywords character varying(255),
    page_title character varying(255),
    page_id integer NOT NULL,
    creation_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cms_title OWNER TO django_login;

--
-- Name: cms_title_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cms_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_title_id_seq OWNER TO django_login;

--
-- Name: cms_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cms_title_id_seq OWNED BY cms_title.id;


--
-- Name: cmsplugin_calendarentriesplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_calendarentriesplugin (
    cmsplugin_ptr_id integer NOT NULL,
    year integer,
    month integer
);


ALTER TABLE public.cmsplugin_calendarentriesplugin OWNER TO django_login;

--
-- Name: cmsplugin_file; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_file (
    cmsplugin_ptr_id integer NOT NULL,
    file character varying(100) NOT NULL,
    title character varying(255)
);


ALTER TABLE public.cmsplugin_file OWNER TO django_login;

--
-- Name: cmsplugin_googlemap; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_googlemap (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(100),
    address character varying(150) NOT NULL,
    zipcode character varying(30) NOT NULL,
    city character varying(100) NOT NULL,
    content character varying(255) NOT NULL,
    zoom smallint NOT NULL,
    lat numeric(10,6),
    lng numeric(10,6),
    route_planer_title character varying(150),
    route_planer boolean NOT NULL,
    width character varying(6) NOT NULL,
    height character varying(6) NOT NULL,
    CONSTRAINT cmsplugin_googlemap_zoom_check CHECK ((zoom >= 0))
);


ALTER TABLE public.cmsplugin_googlemap OWNER TO django_login;

--
-- Name: cmsplugin_latestentriesplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_latestentriesplugin (
    cmsplugin_ptr_id integer NOT NULL,
    subcategories boolean NOT NULL,
    number_of_entries integer NOT NULL,
    template_to_render character varying(250) NOT NULL
);


ALTER TABLE public.cmsplugin_latestentriesplugin OWNER TO django_login;

--
-- Name: cmsplugin_link; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_link (
    cmsplugin_ptr_id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(200),
    page_link_id integer,
    mailto character varying(75),
    target character varying(100) NOT NULL
);


ALTER TABLE public.cmsplugin_link OWNER TO django_login;

--
-- Name: cmsplugin_picture; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_picture (
    cmsplugin_ptr_id integer NOT NULL,
    image character varying(100) NOT NULL,
    url character varying(255),
    page_link_id integer,
    alt character varying(255),
    longdesc character varying(255),
    "float" character varying(10)
);


ALTER TABLE public.cmsplugin_picture OWNER TO django_login;

--
-- Name: cmsplugin_queryentriesplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_queryentriesplugin (
    cmsplugin_ptr_id integer NOT NULL,
    query character varying(250) NOT NULL,
    number_of_entries integer NOT NULL,
    template_to_render character varying(250) NOT NULL
);


ALTER TABLE public.cmsplugin_queryentriesplugin OWNER TO django_login;

--
-- Name: cmsplugin_randomentriesplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_randomentriesplugin (
    cmsplugin_ptr_id integer NOT NULL,
    number_of_entries integer NOT NULL,
    template_to_render character varying(250) NOT NULL
);


ALTER TABLE public.cmsplugin_randomentriesplugin OWNER TO django_login;

--
-- Name: cmsplugin_selectedentriesplugin; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_selectedentriesplugin (
    cmsplugin_ptr_id integer NOT NULL,
    template_to_render character varying(250) NOT NULL
);


ALTER TABLE public.cmsplugin_selectedentriesplugin OWNER TO django_login;

--
-- Name: cmsplugin_snippetptr; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_snippetptr (
    cmsplugin_ptr_id integer NOT NULL,
    snippet_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_snippetptr OWNER TO django_login;

--
-- Name: cmsplugin_text; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_text (
    cmsplugin_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.cmsplugin_text OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_zinnia_latestentriesplugin_authors (
    id integer NOT NULL,
    latestentriesplugin_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_authors OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cmsplugin_zinnia_latestentriesplugin_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_authors_id_seq OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cmsplugin_zinnia_latestentriesplugin_authors_id_seq OWNED BY cmsplugin_zinnia_latestentriesplugin_authors.id;


--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_zinnia_latestentriesplugin_categories (
    id integer NOT NULL,
    latestentriesplugin_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_categories OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cmsplugin_zinnia_latestentriesplugin_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_categories_id_seq OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cmsplugin_zinnia_latestentriesplugin_categories_id_seq OWNED BY cmsplugin_zinnia_latestentriesplugin_categories.id;


--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_zinnia_latestentriesplugin_tags (
    id integer NOT NULL,
    latestentriesplugin_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_tags OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cmsplugin_zinnia_latestentriesplugin_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_zinnia_latestentriesplugin_tags_id_seq OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cmsplugin_zinnia_latestentriesplugin_tags_id_seq OWNED BY cmsplugin_zinnia_latestentriesplugin_tags.id;


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_zinnia_selectedentriesplugin_entries (
    id integer NOT NULL,
    selectedentriesplugin_id integer NOT NULL,
    entry_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_zinnia_selectedentriesplugin_entries OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cmsplugin_zinnia_selectedentriesplugin_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_zinnia_selectedentriesplugin_entries_id_seq OWNER TO django_login;

--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cmsplugin_zinnia_selectedentriesplugin_entries_id_seq OWNED BY cmsplugin_zinnia_selectedentriesplugin_entries.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django_login;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django_login;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment_id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO django_login;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO django_login;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk text NOT NULL,
    site_id integer NOT NULL,
    user_id integer,
    user_name character varying(50) NOT NULL,
    user_email character varying(75) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL
);


ALTER TABLE public.django_comments OWNER TO django_login;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO django_login;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django_login;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django_login;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django_login;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO django_login;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO django_login;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: menus_cachekey; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE menus_cachekey (
    id integer NOT NULL,
    language character varying(255) NOT NULL,
    site integer NOT NULL,
    key character varying(255) NOT NULL,
    CONSTRAINT menus_cachekey_site_check CHECK ((site >= 0))
);


ALTER TABLE public.menus_cachekey OWNER TO django_login;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE menus_cachekey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_cachekey_id_seq OWNER TO django_login;

--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE menus_cachekey_id_seq OWNED BY menus_cachekey.id;


--
-- Name: snippet_snippet; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE snippet_snippet (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    html text NOT NULL,
    template character varying(50) NOT NULL
);


ALTER TABLE public.snippet_snippet OWNER TO django_login;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE snippet_snippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.snippet_snippet_id_seq OWNER TO django_login;

--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE snippet_snippet_id_seq OWNED BY snippet_snippet.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO django_login;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO django_login;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: tagging_tag; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE tagging_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tagging_tag OWNER TO django_login;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE tagging_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_tag_id_seq OWNER TO django_login;

--
-- Name: tagging_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE tagging_tag_id_seq OWNED BY tagging_tag.id;


--
-- Name: tagging_taggeditem; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE tagging_taggeditem (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    CONSTRAINT tagging_taggeditem_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tagging_taggeditem OWNER TO django_login;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE tagging_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagging_taggeditem_id_seq OWNER TO django_login;

--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE tagging_taggeditem_id_seq OWNED BY tagging_taggeditem.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO django_login;

--
-- Name: zinnia_category; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_category (
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    parent_id integer,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    title_en character varying(255),
    title_ru character varying(255),
    description_en text,
    description_ru text,
    CONSTRAINT ck_level_pstv_2defc3078550b0a8 CHECK ((level >= 0)),
    CONSTRAINT ck_lft_pstv_5a7e18a2078ca802 CHECK ((lft >= 0)),
    CONSTRAINT ck_rght_pstv_7385a7b3d63fbe70 CHECK ((rght >= 0)),
    CONSTRAINT ck_tree_id_pstv_72d54362966174e0 CHECK ((tree_id >= 0)),
    CONSTRAINT zinnia_category_level_check CHECK ((level >= 0)),
    CONSTRAINT zinnia_category_lft_check CHECK ((lft >= 0)),
    CONSTRAINT zinnia_category_rght_check CHECK ((rght >= 0)),
    CONSTRAINT zinnia_category_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.zinnia_category OWNER TO django_login;

--
-- Name: zinnia_category_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_category_id_seq OWNER TO django_login;

--
-- Name: zinnia_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_category_id_seq OWNED BY zinnia_category.id;


--
-- Name: zinnia_entry; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_entry (
    status integer NOT NULL,
    last_update timestamp with time zone NOT NULL,
    comment_enabled boolean NOT NULL,
    tags character varying(255) NOT NULL,
    image character varying(100) NOT NULL,
    title character varying(255) NOT NULL,
    excerpt text NOT NULL,
    slug character varying(255) NOT NULL,
    content text NOT NULL,
    end_publication timestamp with time zone,
    start_publication timestamp with time zone,
    creation_date timestamp with time zone NOT NULL,
    id integer NOT NULL,
    pingback_enabled boolean DEFAULT true NOT NULL,
    login_required boolean NOT NULL,
    password character varying(50) NOT NULL,
    detail_template character varying(250) NOT NULL,
    featured boolean NOT NULL,
    comment_count integer NOT NULL,
    pingback_count integer NOT NULL,
    trackback_count integer NOT NULL,
    trackback_enabled boolean NOT NULL,
    content_template character varying(250) NOT NULL,
    title_en character varying(255),
    title_ru character varying(255),
    content_en text,
    content_ru text,
    excerpt_en text,
    excerpt_ru text
);


ALTER TABLE public.zinnia_entry OWNER TO django_login;

--
-- Name: zinnia_entry_authors; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_entry_authors (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.zinnia_entry_authors OWNER TO django_login;

--
-- Name: zinnia_entry_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_entry_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_entry_authors_id_seq OWNER TO django_login;

--
-- Name: zinnia_entry_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_entry_authors_id_seq OWNED BY zinnia_entry_authors.id;


--
-- Name: zinnia_entry_categories; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_entry_categories (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.zinnia_entry_categories OWNER TO django_login;

--
-- Name: zinnia_entry_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_entry_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_entry_categories_id_seq OWNER TO django_login;

--
-- Name: zinnia_entry_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_entry_categories_id_seq OWNED BY zinnia_entry_categories.id;


--
-- Name: zinnia_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_entry_id_seq OWNER TO django_login;

--
-- Name: zinnia_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_entry_id_seq OWNED BY zinnia_entry.id;


--
-- Name: zinnia_entry_related; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_entry_related (
    id integer NOT NULL,
    from_entry_id integer NOT NULL,
    to_entry_id integer NOT NULL
);


ALTER TABLE public.zinnia_entry_related OWNER TO django_login;

--
-- Name: zinnia_entry_related_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_entry_related_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_entry_related_id_seq OWNER TO django_login;

--
-- Name: zinnia_entry_related_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_entry_related_id_seq OWNED BY zinnia_entry_related.id;


--
-- Name: zinnia_entry_sites; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE zinnia_entry_sites (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.zinnia_entry_sites OWNER TO django_login;

--
-- Name: zinnia_entry_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE zinnia_entry_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zinnia_entry_sites_id_seq OWNER TO django_login;

--
-- Name: zinnia_entry_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE zinnia_entry_sites_id_seq OWNED BY zinnia_entry_sites.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_cmsplugin ALTER COLUMN id SET DEFAULT nextval('cms_cmsplugin_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission_sites ALTER COLUMN id SET DEFAULT nextval('cms_globalpagepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_helper_clocktown ALTER COLUMN id SET DEFAULT nextval('cms_helper_clocktown_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page ALTER COLUMN id SET DEFAULT nextval('cms_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page_placeholders ALTER COLUMN id SET DEFAULT nextval('cms_page_placeholders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderator ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderator_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderatorstate ALTER COLUMN id SET DEFAULT nextval('cms_pagemoderatorstate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagepermission ALTER COLUMN id SET DEFAULT nextval('cms_pagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_placeholder ALTER COLUMN id SET DEFAULT nextval('cms_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_title ALTER COLUMN id SET DEFAULT nextval('cms_title_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_authors ALTER COLUMN id SET DEFAULT nextval('cmsplugin_zinnia_latestentriesplugin_authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_categories ALTER COLUMN id SET DEFAULT nextval('cmsplugin_zinnia_latestentriesplugin_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_tags ALTER COLUMN id SET DEFAULT nextval('cmsplugin_zinnia_latestentriesplugin_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_selectedentriesplugin_entries ALTER COLUMN id SET DEFAULT nextval('cmsplugin_zinnia_selectedentriesplugin_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY menus_cachekey ALTER COLUMN id SET DEFAULT nextval('menus_cachekey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY snippet_snippet ALTER COLUMN id SET DEFAULT nextval('snippet_snippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY tagging_tag ALTER COLUMN id SET DEFAULT nextval('tagging_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY tagging_taggeditem ALTER COLUMN id SET DEFAULT nextval('tagging_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_category ALTER COLUMN id SET DEFAULT nextval('zinnia_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry ALTER COLUMN id SET DEFAULT nextval('zinnia_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_authors ALTER COLUMN id SET DEFAULT nextval('zinnia_entry_authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_categories ALTER COLUMN id SET DEFAULT nextval('zinnia_entry_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_related ALTER COLUMN id SET DEFAULT nextval('zinnia_entry_related_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_sites ALTER COLUMN id SET DEFAULT nextval('zinnia_entry_sites_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add placeholder	8	add_placeholder
23	Can change placeholder	8	change_placeholder
24	Can delete placeholder	8	delete_placeholder
25	Can add cms plugin	9	add_cmsplugin
26	Can change cms plugin	9	change_cmsplugin
27	Can delete cms plugin	9	delete_cmsplugin
28	Can add page	10	add_page
29	Can change page	10	change_page
30	Can delete page	10	delete_page
31	Can view page	10	view_page
32	Can add PageModerator	11	add_pagemoderator
33	Can change PageModerator	11	change_pagemoderator
34	Can delete PageModerator	11	delete_pagemoderator
35	Can add Page moderator state	12	add_pagemoderatorstate
36	Can change Page moderator state	12	change_pagemoderatorstate
37	Can delete Page moderator state	12	delete_pagemoderatorstate
38	Can add Page global permission	13	add_globalpagepermission
39	Can change Page global permission	13	change_globalpagepermission
40	Can delete Page global permission	13	delete_globalpagepermission
41	Can add Page permission	14	add_pagepermission
42	Can change Page permission	14	change_pagepermission
43	Can delete Page permission	14	delete_pagepermission
44	Can add User (page)	15	add_pageuser
45	Can change User (page)	15	change_pageuser
46	Can delete User (page)	15	delete_pageuser
47	Can add User group (page)	16	add_pageusergroup
48	Can change User group (page)	16	change_pageusergroup
49	Can delete User group (page)	16	delete_pageusergroup
50	Can add title	17	add_title
51	Can change title	17	change_title
52	Can delete title	17	delete_title
53	Can add cache key	18	add_cachekey
54	Can change cache key	18	change_cachekey
55	Can delete cache key	18	delete_cachekey
56	Can add migration history	19	add_migrationhistory
57	Can change migration history	19	change_migrationhistory
58	Can delete migration history	19	delete_migrationhistory
59	Can add text	20	add_text
60	Can change text	20	change_text
61	Can delete text	20	delete_text
62	Can add picture	21	add_picture
63	Can change picture	21	change_picture
64	Can delete picture	21	delete_picture
65	Can add link	22	add_link
66	Can change link	22	change_link
67	Can delete link	22	delete_link
68	Can add file	23	add_file
69	Can change file	23	change_file
70	Can delete file	23	delete_file
71	Can add Snippet	24	add_snippet
72	Can change Snippet	24	change_snippet
73	Can delete Snippet	24	delete_snippet
74	Can add Snippet	25	add_snippetptr
75	Can change Snippet	25	change_snippetptr
76	Can delete Snippet	25	delete_snippetptr
77	Can add google map	26	add_googlemap
78	Can change google map	26	change_googlemap
79	Can delete google map	26	delete_googlemap
80	Can add comment	27	add_comment
81	Can change comment	27	change_comment
82	Can delete comment	27	delete_comment
83	Can moderate comments	27	can_moderate
84	Can add comment flag	28	add_commentflag
85	Can change comment flag	28	change_commentflag
86	Can delete comment flag	28	delete_commentflag
87	Can add tag	29	add_tag
88	Can change tag	29	change_tag
89	Can delete tag	29	delete_tag
90	Can add tagged item	30	add_taggeditem
91	Can change tagged item	30	change_taggeditem
92	Can delete tagged item	30	delete_taggeditem
93	Can change status	31	can_change_status
94	Can add author	3	add_author
95	Can change author	3	change_author
96	Can delete author	3	delete_author
97	Can add category	32	add_category
98	Can change category	32	change_category
99	Can delete category	32	delete_category
100	Can add entry	31	add_entry
101	Can change entry	31	change_entry
102	Can delete entry	31	delete_entry
103	Can view all entries	31	can_view_all
104	Can change author(s)	31	can_change_author
105	Can add clock town	34	add_clocktown
106	Can change clock town	34	change_clocktown
107	Can delete clock town	34	delete_clocktown
108	Can add latest entries plugin	35	add_latestentriesplugin
109	Can change latest entries plugin	35	change_latestentriesplugin
110	Can delete latest entries plugin	35	delete_latestentriesplugin
111	Can add selected entries plugin	36	add_selectedentriesplugin
112	Can change selected entries plugin	36	change_selectedentriesplugin
113	Can delete selected entries plugin	36	delete_selectedentriesplugin
114	Can add random entries plugin	37	add_randomentriesplugin
115	Can change random entries plugin	37	change_randomentriesplugin
116	Can delete random entries plugin	37	delete_randomentriesplugin
117	Can add query entries plugin	38	add_queryentriesplugin
118	Can change query entries plugin	38	change_queryentriesplugin
119	Can delete query entries plugin	38	delete_queryentriesplugin
120	Can add calendar entries plugin	39	add_calendarentriesplugin
121	Can change calendar entries plugin	39	change_calendarentriesplugin
122	Can delete calendar entries plugin	39	delete_calendarentriesplugin
123	Can add kv store	40	add_kvstore
124	Can change kv store	40	change_kvstore
125	Can delete kv store	40	delete_kvstore
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_permission_id_seq', 125, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	picasso	Павел	Саввин	it-support2@ruscon.gcs-group.ru	pbkdf2_sha256$10000$Vc4m0P0zmaeh$K7KjNdnSmJBQbBvLCQDCCEYbzjm39PpFhN+nVZ8gOQk=	t	t	t	2013-02-14 16:50:12+04	2013-02-11 08:59:46+04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_cmsplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_cmsplugin (id, placeholder_id, parent_id, "position", language, plugin_type, creation_date, changed_date, level, lft, rght, tree_id) FROM stdin;
2	1	\N	0	ru	TextPlugin	2013-02-11 09:31:31.784737+04	2013-02-11 09:44:34.892075+04	0	1	2	1
3	4	\N	0	ru	PicturePlugin	2013-02-12 12:44:49.403252+04	2013-02-12 12:44:49.411672+04	0	1	2	2
4	4	\N	1	ru	TextPlugin	2013-02-12 12:45:00.840313+04	2013-02-12 12:45:17.637593+04	0	1	2	3
5	3	\N	0	en	LinkPlugin	2013-02-12 12:46:21.331702+04	2013-02-12 12:46:49.658904+04	0	1	2	4
28	23	\N	0	ru	TextPlugin	2013-02-22 14:13:02.040789+04	2013-02-22 14:13:44.529319+04	0	1	2	23
6	5	\N	0	ru	TextPlugin	2013-02-15 11:51:43.625115+04	2013-02-15 13:44:07.010884+04	0	1	2	5
29	23	\N	0	en	TextPlugin	2013-02-22 14:13:02.040789+04	2013-02-22 14:15:16.878362+04	0	1	2	24
7	5	\N	0	en	TextPlugin	2013-02-15 11:51:43.625115+04	2013-02-15 13:46:47.879583+04	0	1	2	6
9	7	\N	0	ru	SnippetPlugin	2013-02-15 14:19:03.68113+04	2013-02-15 14:19:29.882611+04	0	1	2	7
10	7	\N	0	en	SnippetPlugin	2013-02-15 14:19:03.68113+04	2013-02-15 14:19:41.707856+04	0	1	2	8
14	10	\N	0	ru	CMSLatestEntriesPlugin	2013-02-19 11:49:03.978093+04	2013-02-19 13:10:07.448891+04	0	1	2	11
15	10	\N	0	en	CMSLatestEntriesPlugin	2013-02-19 11:49:03.978093+04	2013-02-20 08:54:54.799777+04	0	1	2	12
17	17	\N	0	en	TextPlugin	2013-02-22 08:42:44.536759+04	2013-02-22 08:46:35.525119+04	0	1	2	13
18	17	\N	0	ru	TextPlugin	2013-02-22 08:42:44.536759+04	2013-02-22 08:46:58.77133+04	0	1	2	14
19	18	\N	0	ru	TextPlugin	2013-02-22 12:01:09.164336+04	2013-02-22 12:01:21.416159+04	0	1	2	15
20	19	\N	0	ru	TextPlugin	2013-02-22 12:01:59.107332+04	2013-02-22 12:02:11.079098+04	0	1	2	16
21	18	\N	0	en	TextPlugin	2013-02-22 12:01:09.164336+04	2013-02-22 12:04:15.190448+04	0	1	2	17
22	19	\N	0	en	TextPlugin	2013-02-22 12:01:59.107332+04	2013-02-22 12:04:49.424021+04	0	1	2	18
23	20	\N	0	ru	TextPlugin	2013-02-22 12:08:46.127465+04	2013-02-22 12:14:10.912115+04	0	1	2	19
24	20	\N	0	en	TextPlugin	2013-02-22 12:08:46.127465+04	2013-02-22 13:19:10.896182+04	0	1	2	20
26	21	\N	0	ru	TextPlugin	2013-02-22 13:26:48.279664+04	2013-02-22 13:27:52.336099+04	0	1	2	21
27	21	\N	0	en	TextPlugin	2013-02-22 13:26:48.279664+04	2013-02-22 13:31:54.437749+04	0	1	2	22
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 29, true);


--
-- Data for Name: cms_globalpagepermission; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_globalpagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_moderate, can_view, can_recover_page) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_globalpagepermission_id_seq', 1, false);


--
-- Data for Name: cms_globalpagepermission_sites; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_globalpagepermission_sites (id, globalpagepermission_id, site_id) FROM stdin;
\.


--
-- Name: cms_globalpagepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_globalpagepermission_sites_id_seq', 1, false);


--
-- Data for Name: cms_helper_clocktown; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_helper_clocktown (id, town, hour_shift, town_en, town_ru, "order") FROM stdin;
3	Калининград	3	Kaliningrad	Калининград	1
4	Москва	4	Moscow	Москва	2
5	Новосибирск	7	Novosibirsk	Новосибирск	3
6	Алматы	6	Almaty	Алматы	4
2	Шанхай	8	Shanghai	Шанхай	6
7	Находка	11	Nakhodka	Находка	5
\.


--
-- Name: cms_helper_clocktown_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_helper_clocktown_id_seq', 7, true);


--
-- Data for Name: cms_page; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_page (id, created_by, changed_by, parent_id, creation_date, changed_date, publication_date, publication_end_date, in_navigation, soft_root, reverse_id, navigation_extenders, published, template, site_id, moderator_state, level, lft, rght, tree_id, login_required, limit_visibility_in_menu, publisher_is_draft, publisher_public_id, publisher_state) FROM stdin;
8	picasso	picasso	2	2013-02-21 13:07:27.706385+04	2013-02-21 13:24:57.70644+04	2013-02-21 13:10:03.275317+04	\N	t	f	\N		t	INHERIT	1	0	1	4	5	2	f	\N	t	\N	1
3	picasso	picasso	\N	2013-02-15 11:42:24.135752+04	2013-02-22 08:47:00.19695+04	\N	\N	t	f	global_placeholder		f	global_placeholder.html	1	0	0	1	2	3	f	\N	t	\N	1
1	picasso	picasso	\N	2013-02-11 09:28:39.70025+04	2013-02-22 12:04:50.849583+04	2013-02-11 09:32:25.525471+04	\N	t	f	\N		t	home.html	1	0	0	1	2	1	f	\N	t	\N	1
2	picasso	picasso	\N	2013-02-12 11:34:09.471682+04	2013-02-22 13:31:56.176656+04	2013-02-12 11:34:24.973068+04	\N	t	f	company		t	page.html	1	0	0	1	6	2	f	\N	t	\N	1
7	picasso	picasso	2	2013-02-21 12:29:49.894086+04	2013-02-22 14:15:19.443784+04	2013-02-21 12:30:05.301344+04	\N	t	f	\N		t	INHERIT	1	0	1	2	3	2	f	\N	t	\N	1
4	picasso	picasso	\N	2013-02-20 12:08:38.401493+04	2013-02-21 12:24:56.197502+04	2013-02-20 12:20:50.227565+04	\N	f	f	zinnia		f	base.html	1	0	0	1	2	4	f	\N	t	\N	1
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_page_id_seq', 8, true);


--
-- Data for Name: cms_page_placeholders; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_page_placeholders (id, page_id, placeholder_id) FROM stdin;
1	1	1
2	2	2
3	2	3
4	1	4
5	3	5
6	1	6
7	3	7
8	3	8
9	3	9
10	3	10
16	3	16
17	3	17
18	1	18
19	1	19
20	2	20
21	2	21
22	7	22
23	7	23
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 23, true);


--
-- Data for Name: cms_pagemoderator; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_pagemoderator (id, page_id, user_id, moderate_page, moderate_children, moderate_descendants) FROM stdin;
\.


--
-- Name: cms_pagemoderator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_pagemoderator_id_seq', 1, false);


--
-- Data for Name: cms_pagemoderatorstate; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_pagemoderatorstate (id, page_id, user_id, created, action, message) FROM stdin;
\.


--
-- Name: cms_pagemoderatorstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_pagemoderatorstate_id_seq', 1, false);


--
-- Data for Name: cms_pagepermission; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_pagepermission (id, user_id, group_id, can_change, can_add, can_delete, can_change_advanced_settings, can_publish, can_change_permissions, can_move_page, can_moderate, can_view, grant_on, page_id) FROM stdin;
\.


--
-- Name: cms_pagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_pagepermission_id_seq', 1, false);


--
-- Data for Name: cms_pageuser; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_pageuser (user_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_pageusergroup; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_pageusergroup (group_ptr_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cms_placeholder; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_placeholder (id, slot, default_width) FROM stdin;
1	main	\N
2	main	\N
3	Main	\N
4	Main	\N
5	adresses	\N
6	adresses	\N
7	liveinternet	\N
8	bigpromo-title	\N
9	bigpromo-text	\N
10	zinnia-entries-press	\N
16	get_copyright	\N
17	get-copyright	\N
18	bigpromo-title	\N
19	bigpromo-text	\N
20	bigpromo-title	\N
21	page-content	\N
22	bigpromo-title	\N
23	page-content	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 23, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, application_urls, redirect, meta_description, meta_keywords, page_title, page_id, creation_date) FROM stdin;
13	ru	Редирект		redirekt	zinnia/categories/press-releases	t						8	2013-02-21 13:07:27.7157+04
14	en	Redirect		redirect	company/redirect	f		/zinnia/categories/press-releases				8	2013-02-21 13:09:27.786581+04
4	en	Company		company	company	f						2	2013-02-12 12:21:31.564438+04
12	ru	История		history	company/history	f						7	2013-02-21 12:29:49.904681+04
15	en	History		history	company/history	f	\N	\N				7	2013-02-22 14:15:19.460375+04
1	ru	Главная		home		f				Оля	Логис	1	2013-02-11 09:28:39.751702+04
5	ru	Global Placeholder		base	base	f						3	2013-02-15 11:42:24.19937+04
3	en	Home		home		f			123	logistic	123	1	2013-02-12 12:21:18.650103+04
2	ru	Компания		company	company	f						2	2013-02-12 11:34:09.504639+04
6	en	Global Placeholder		base	base	f						3	2013-02-15 11:43:09.520358+04
7	ru	Zinnia		zinnia	zinnia	f	ZinniaApphook					4	2013-02-20 12:08:38.62098+04
8	en	Zinnia		zinnia	zinnia	f	ZinniaApphook					4	2013-02-20 12:28:21.347387+04
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_title_id_seq', 15, true);


--
-- Data for Name: cmsplugin_calendarentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_calendarentriesplugin (cmsplugin_ptr_id, year, month) FROM stdin;
\.


--
-- Data for Name: cmsplugin_file; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_file (cmsplugin_ptr_id, file, title) FROM stdin;
\.


--
-- Data for Name: cmsplugin_googlemap; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_googlemap (cmsplugin_ptr_id, title, address, zipcode, city, content, zoom, lat, lng, route_planer_title, route_planer, width, height) FROM stdin;
\.


--
-- Data for Name: cmsplugin_latestentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_latestentriesplugin (cmsplugin_ptr_id, subcategories, number_of_entries, template_to_render) FROM stdin;
14	t	5	cmsplugin_zinnia/entry_list.html
15	t	5	cmsplugin_zinnia/entry_list.html
\.


--
-- Data for Name: cmsplugin_link; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_link (cmsplugin_ptr_id, name, url, page_link_id, mailto, target) FROM stdin;
5	2323	http://yandex.ru/	\N		
\.


--
-- Data for Name: cmsplugin_picture; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_picture (cmsplugin_ptr_id, image, url, page_link_id, alt, longdesc, "float") FROM stdin;
\.


--
-- Data for Name: cmsplugin_queryentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_queryentriesplugin (cmsplugin_ptr_id, query, number_of_entries, template_to_render) FROM stdin;
\.


--
-- Data for Name: cmsplugin_randomentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_randomentriesplugin (cmsplugin_ptr_id, number_of_entries, template_to_render) FROM stdin;
\.


--
-- Data for Name: cmsplugin_selectedentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_selectedentriesplugin (cmsplugin_ptr_id, template_to_render) FROM stdin;
\.


--
-- Data for Name: cmsplugin_snippetptr; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_snippetptr (cmsplugin_ptr_id, snippet_id) FROM stdin;
9	1
10	1
\.


--
-- Data for Name: cmsplugin_text; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_text (cmsplugin_ptr_id, body) FROM stdin;
2	<p><strong>Вот это да! Хехе!</strong></p>
4	<h1>Ololo</h1>
22	Ruscon Ltd. is one of the leading container shipping specialists in Russia and the FSU. Since the mid-90s we have pioneered containeriszation in this region and now offer country-wide transportation of goods, based on our own network, vehicles and facilities via in all of the main rail and sea gateways throughout Russia and the FSU.
6	<div class="offices gradient_blue radius8_bottom">\n\tОФИСЫ\n</div>\n<div class="line">\n\t \n</div>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>Санкт-Петербург</strong>,\n\t\t<br>\n\t\tТелефон: +7 (812) 335-00-20,\n\t\t<br>\n\t\tФакс: +7 (812) 335-00-21\n\t</li>\t<li class="ru">\t\t<strong>Калининград</strong>,\n\t\t<br>\n\t\tТелефон: + 7 (401) 269-21-17,\n\t\t<br>\n\t\tФакс: + 7 (401) 269-21-17\n\t</li>\t<li class="ru">\t\t<strong>Находка</strong>,\n\t\t<br>\n\t\tТелефон: +7 (4236) 666-51-56,\n\t\t<br>\n\t\tФакс: +7 (4236) 666-51-56\n\t</li></ul>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>Москва</strong>,\n\t\t<br>\n\t\tТелефон: +7 (495) 740-16-60,\n\t\t<br>\n\t\tФакс: +7 (495) 740-16-60\n\t</li>\t<li class="ru">\t\t<strong>Ростов-на-Дону</strong>,\n\t\t<br>\n\t\tТелефон: +7 (906) 180-07-05\n\t</li>\t<li class="kz">\t\t<strong>Алматы</strong>,\n\t\t<br>\n\t\tТелефон: +7 (3272) 662-864,\n\t\t<br>\n\t\tФакс: +7 (3272) 662-864\n\t</li></ul>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>Новороссийск</strong>,\n\t\t<br>\n\t\tТелефон: +7 (8617) 678-000,\n\t\t<br>\n\t\tФакс: +7 (8617) 678-066\n\t</li>\t<li class="ru">\t\t<strong>Краснодар</strong>,\n\t\t<br>\n\t\tТелефон: +7 (861) 224-41-59,\n\t\t<br>\n\t\tФакс: +7 (861) 224-41-59\n\t</li>\t<li class="cn">\t\t<strong>Шанхай</strong>, Пудун,\n\t\t<br>\n\t\tТелефон:  +8 (621) 587-66-741\n\t\t<br>\n\t\tФакс: +8 (621) 587-66-741\n\t</li></ul>
7	<div class="offices gradient_blue radius8_bottom">\n\tMAIN OFFICES\n</div>\n<div class="line">\n\t \n</div>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>St.Petersburg</strong>,\n\t\t<br>\n\t\tPhone: +7 (812) 335-00-20,\n\t\t<br>\n\t\tFax: +7 (812) 335-00-21\n\t</li>\t<li class="ru">\t\t<strong>Kaliningrad</strong>,\n\t\t<br>\n\t\tPhone: + 7 (401) 269-21-17,\n\t\t<br>\n\t\tFax: + 7 (401) 269-21-17\n\t</li>\t<li class="ru">\t\t<strong>Nakhodka</strong>,\n\t\t<br>\n\t\tPhone: +7 (4236) 666-51-56,\n\t\t<br>\n\t\tFax: +7 (4236) 666-51-56\n\t</li></ul>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>Moscow</strong>,\n\t\t<br>\n\t\tPhone: +7 (495) 740-16-60,\n\t\t<br>\n\t\tFax: +7 (495) 740-16-60\n\t</li>\t<li class="ru">\t\t<strong>Rostov-on-Don</strong>,\n\t\t<br>\n\t\tPhone: +7 (906) 180-07-05\n\t</li>\t<li class="kz">\t\t<strong>Almaty</strong>,\n\t\t<br>\n\t\tPhone: +7 (3272) 662-864,\n\t\t<br>\n\t\tFax: +7 (3272) 662-864\n\t</li></ul>\n<ul class="adresses">\n\t<li class="ru">\t\t<strong>Novorossiysk</strong>,\n\t\t<br>\n\t\tPhone: +7 (8617) 678-000,\n\t\t<br>\n\t\tFax: +7 (8617) 678-066\n\t</li>\t<li class="ru">\t\t<strong>Krasnodar</strong>,\n\t\t<br>\n\t\tPhone: +7 (861) 224-41-59,\n\t\t<br>\n\t\tFax: +7 (861) 224-41-59\n\t</li>\t<li class="cn">\t\t<strong>Shanghai</strong>, Pudong,\n\t\t<br>\n\t\tPhone:  +8 (621) 587-66-741\n\t\t<br>\n\t\tFax: +8 (621) 587-66-741\n\t</li></ul>
28	<p>\nКомпания Рускон была основана в 2002 году для оказания услуг портового и транспортного экспедирования через порты Новороссийск и Санкт-Петербург.</p>\n<p>\nС момента своего создания мы достигли более, чем 20-кратного роста объемов и лидерства в экспедировании контейнерных грузов в ведущих портах России.</p>\n
27	<p>\nRuscon provides a full range of logistics services related to the  transportation of goods in containers via the seaports of Russia and the FSU.<br>\n<br>\nOur highly-skilled staff operating out of our own facilities in the largest Russian ports and regions enable us to offer logistics products fully adapted to the needs of international customers and the local business environment. Ruscon is one of the most highly reputable specialists in transportation logistics, terminal handling and customs brokerage of containerised goods in Russia and the FSU</p>
17	«Ruscon» — Container Shipping world-wide
18	«Рускон» — контейнерные перевозки
19	Международные контейнерные перевозки
20	Компания «Рускон» сегодня – это профессиональная логистика ваших товаров. Мы предлагаем качественный сервис по контейнеризации и международной доставке грузов. Выгодные условия по морским перевозкам, широкая сеть офисов, таможенное оформление и собственный автопарк позволяют создавать оптимальные схемы логистики для ваших грузов.
21	Container Shipping world-wide
29	<p>Ruscon was founded in 2002 as a forwarding and transportation company in the ports of Novorossiysk and St Petersburg.</p>\n<p>Since then we have managed to expand our volumes more than 20-fold and we are now prominent the handling of containers in the major Russian ports.</p>
23	<p>Международные</p><p>контейнерные</p><p>перевозки</p>
24	<p>Container Shipping</p><p>in Russia and world-wide</p>
26	<p>\nРускон оказывает услуги по международной доставке грузов в контейнерах через порты России.</p>\n<p>\nОпираясь на высококвалифицированный персонал и собственные транспортные активы в крупнейших российский портах и регионах, мы предлагаем логистические решения, полностью адаптированные нуждам наших клиентов. Рускон является одним из признанных лидеров в сфере логистики, перевалки, хранения и таможенного оформления контейнерных грузов в России и СНГ.</p>
\.


--
-- Data for Name: cmsplugin_zinnia_latestentriesplugin_authors; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_zinnia_latestentriesplugin_authors (id, latestentriesplugin_id, user_id) FROM stdin;
\.


--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cmsplugin_zinnia_latestentriesplugin_authors_id_seq', 1, false);


--
-- Data for Name: cmsplugin_zinnia_latestentriesplugin_categories; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_zinnia_latestentriesplugin_categories (id, latestentriesplugin_id, category_id) FROM stdin;
\.


--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cmsplugin_zinnia_latestentriesplugin_categories_id_seq', 1, false);


--
-- Data for Name: cmsplugin_zinnia_latestentriesplugin_tags; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_zinnia_latestentriesplugin_tags (id, latestentriesplugin_id, tag_id) FROM stdin;
\.


--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cmsplugin_zinnia_latestentriesplugin_tags_id_seq', 1, false);


--
-- Data for Name: cmsplugin_zinnia_selectedentriesplugin_entries; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_zinnia_selectedentriesplugin_entries (id, selectedentriesplugin_id, entry_id) FROM stdin;
\.


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cmsplugin_zinnia_selectedentriesplugin_entries_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2013-02-11 09:28:39.783801+04	1	10	1	Новая	1	
2	2013-02-11 09:32:25.548046+04	1	10	1	Новая	2	Изменен published,in_navigation и moderator_state.
3	2013-02-12 11:34:09.561992+04	1	10	2	Вторая	1	
4	2013-02-12 12:21:18.696895+04	1	10	1	Новая	2	Изменен title,slug,language и moderator_state.
5	2013-02-12 12:21:31.574495+04	1	10	2	Вторая	2	Изменен title,slug,language и moderator_state.
6	2013-02-12 12:46:52.859715+04	1	10	2	Second	2	Изменен language и moderator_state.
7	2013-02-12 12:48:46.729666+04	1	10	2	Second	2	Изменен language и moderator_state.
8	2013-02-12 13:35:05.72027+04	1	31	1	Тестовая запись: draft	1	
9	2013-02-12 13:35:35.701697+04	1	31	1	Тестовая запись: опубликован	2	Изменен status.
10	2013-02-12 13:55:01.958673+04	1	31	1	Тестовая запись: опубликован	2	Изменен content.
11	2013-02-12 14:08:57.139108+04	1	32	1	Публикации	1	
12	2013-02-12 14:09:08.068673+04	1	31	1	Тестовая запись: опубликован	2	Изменен categories.
13	2013-02-12 14:26:24.157877+04	1	31	1	Тестовая запись: опубликован	2	Изменен image.
14	2013-02-12 16:58:25.948356+04	1	31	1	Первый: опубликован	2	Изменен title_en,title_ru,content_en и content_ru.
15	2013-02-12 16:59:13.001367+04	1	31	1	Первый: опубликован	2	Изменен excerpt_en.
16	2013-02-14 09:43:27.17896+04	1	32	2	Пресс-релизы	1	
17	2013-02-14 09:43:43.790515+04	1	31	1	Первый: опубликован	2	Изменен categories.
18	2013-02-14 10:38:59.783749+04	1	10	1	New	2	Изменен meta_keywords,language и moderator_state.
19	2013-02-14 10:42:33.732743+04	1	10	1	New	2	Изменен page_title,meta_description,language и moderator_state.
20	2013-02-14 10:43:30.937536+04	1	10	1	Новая	2	Изменен page_title,meta_keywords и moderator_state.
21	2013-02-14 10:44:02.213582+04	1	10	1	Новая	2	Изменен meta_keywords и moderator_state.
22	2013-02-14 10:59:48.551495+04	1	10	1	Новая	2	Изменен template и moderator_state.
23	2013-02-14 10:59:53.888317+04	1	10	2	Вторая	2	Изменен template и moderator_state.
24	2013-02-14 16:58:16.881489+04	1	34	2	Шанхай	1	
25	2013-02-15 09:38:04.193865+04	1	34	3	Калининград	1	
26	2013-02-15 09:46:59.730761+04	1	34	4	Москва	1	
27	2013-02-15 09:48:24.392913+04	1	34	5	Новосибирск	1	
28	2013-02-15 09:48:58.702692+04	1	34	6	Алматы	1	
29	2013-02-15 09:49:26.47747+04	1	34	7	Находка	1	
30	2013-02-15 11:42:24.230878+04	1	10	3	Base	1	
31	2013-02-15 11:43:09.531317+04	1	10	3	Base	2	Изменен title,slug,language и moderator_state.
32	2013-02-15 11:43:20.460381+04	1	10	3	Base	2	Изменен moderator_state.
33	2013-02-15 11:52:54.240784+04	1	10	1	Новая	2	Изменен template и moderator_state.
34	2013-02-15 13:28:58.233528+04	1	10	3	Base	2	Изменен reverse_id и moderator_state.
35	2013-02-15 13:31:17.156259+04	1	10	3	Base	2	Изменен language и moderator_state.
36	2013-02-15 13:31:49.807055+04	1	10	3	Base	2	Изменен moderator_state.
37	2013-02-15 13:39:17.738352+04	1	10	3	Base	2	Изменен template и moderator_state.
38	2013-02-15 13:39:44.279777+04	1	10	3	Base	2	Изменен title и moderator_state.
39	2013-02-15 13:39:51.377643+04	1	10	3	Base	2	Изменен title,language и moderator_state.
40	2013-02-15 13:40:24.484105+04	1	10	3	Gglobal Placeholder	2	Изменен title,reverse_id и moderator_state.
41	2013-02-15 13:40:33.105926+04	1	10	3	Gglobal Placeholder	2	Изменен title,language и moderator_state.
42	2013-02-15 13:46:51.78712+04	1	10	3	Global Placeholder	2	Изменен language и moderator_state.
43	2013-02-15 14:18:10.768501+04	1	10	3	Global Placeholder	2	Изменен moderator_state.
44	2013-02-15 14:19:21.886679+04	1	24	1	LiveInternet counter	1	
45	2013-02-15 14:19:44.988341+04	1	10	3	Global Placeholder	2	Изменен language и moderator_state.
46	2013-02-15 16:03:23.614518+04	1	10	3	Global Placeholder	2	Изменен moderator_state.
47	2013-02-19 11:59:28.741403+04	1	10	3	Global Placeholder	2	Изменен language и moderator_state.
48	2013-02-19 13:12:32.347634+04	1	31	2	Новая волна: draft	1	
49	2013-02-19 13:13:39.470867+04	1	31	2	Новая волна: опубликован	2	Изменен status.
50	2013-02-19 14:36:27.525011+04	1	3	1	picasso	2	Изменен password,first_name и last_name.
51	2013-02-19 16:42:15.627942+04	1	32	1		3	
52	2013-02-19 16:47:40.242449+04	1	31	2	Новая волна: опубликован	2	Изменен start_publication.
53	2013-02-19 16:49:27.822844+04	1	31	2	Новая волна: опубликован	2	Изменен start_publication.
54	2013-02-19 16:50:34.319109+04	1	31	2	Новая волна: опубликован	2	Изменен start_publication.
55	2013-02-20 09:37:25.068315+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен title_ru,content_ru и excerpt_ru.
56	2013-02-20 09:59:02.529119+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Ни одно поле не изменено.
57	2013-02-20 10:20:50.616013+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен title_ru и content_ru.
58	2013-02-20 10:26:56.637394+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен start_publication.
59	2013-02-20 12:08:38.688661+04	1	10	4	Zinnia	1	
60	2013-02-20 12:08:49.19844+04	1	10	4	Zinnia	2	Изменен application_urls и moderator_state.
61	2013-02-20 12:28:21.357102+04	1	10	4	Zinnia	2	Изменен title,slug,language и moderator_state.
62	2013-02-21 09:58:50.967769+04	1	10	2	Вторая	2	Изменен title,slug и moderator_state.
63	2013-02-21 09:59:17.153265+04	1	10	2	Second	2	Изменен title,slug,language и moderator_state.
64	2013-02-21 10:42:08.640241+04	1	10	5	Helper	1	
65	2013-02-21 10:42:18.991551+04	1	10	5	Helper	2	Изменен application_urls и moderator_state.
66	2013-02-21 10:44:38.47681+04	1	10	5	Helper	3	
67	2013-02-21 11:03:25.038891+04	1	10	2	Компания	2	Изменен navigation_extenders и moderator_state.
68	2013-02-21 11:04:37.260119+04	1	10	2	Компания	2	Изменен navigation_extenders и moderator_state.
69	2013-02-21 11:09:10.895123+04	1	10	4	Zinnia	2	Изменен navigation_extenders и moderator_state.
70	2013-02-21 11:09:52.026263+04	1	10	4	Zinnia	2	Изменен navigation_extenders и moderator_state.
71	2013-02-21 11:11:56.430936+04	1	10	3	Global Placeholder	2	Изменен navigation_extenders и moderator_state.
72	2013-02-21 11:13:13.977919+04	1	10	3	Global Placeholder	2	Изменен navigation_extenders и moderator_state.
73	2013-02-21 11:13:50.44722+04	1	10	3	Global Placeholder	2	Изменен navigation_extenders и moderator_state.
74	2013-02-21 11:14:05.712786+04	1	10	3	Global Placeholder	2	Изменен language и moderator_state.
75	2013-02-21 11:41:09.775024+04	1	10	6	123	1	
76	2013-02-21 11:44:11.56859+04	1	10	6	123	2	Изменен title,slug,language и moderator_state.
77	2013-02-21 11:45:24.474348+04	1	10	6	123	3	
78	2013-02-21 11:45:57.007396+04	1	10	3	Global Placeholder	2	Изменен language и moderator_state.
79	2013-02-21 11:53:36.964083+04	1	10	4	Zinnia	2	Изменен application_urls,language и moderator_state.
80	2013-02-21 11:56:40.451527+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен title_en.
81	2013-02-21 11:56:49.708101+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Ни одно поле не изменено.
82	2013-02-21 11:57:41.027892+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен title_en и content_en.
83	2013-02-21 11:59:07.189931+04	1	10	4	Zinnia	2	Изменен navigation_extenders и moderator_state.
84	2013-02-21 12:01:21.431414+04	1	10	4	Zinnia	2	Изменен reverse_id и moderator_state.
85	2013-02-21 12:01:48.456654+04	1	10	3	Global Placeholder	2	Изменен navigation_extenders и moderator_state.
86	2013-02-21 12:21:52.006464+04	1	10	2	Компания	2	Изменен navigation_extenders и moderator_state.
87	2013-02-21 12:22:59.246643+04	1	10	2	Компания	2	Изменен reverse_id и moderator_state.
88	2013-02-21 12:24:17.836468+04	1	10	2	Company	2	Изменен navigation_extenders,language и moderator_state.
89	2013-02-21 12:24:24.038939+04	1	10	2	Company	2	Изменен reverse_id,language и moderator_state.
90	2013-02-21 12:24:44.474014+04	1	10	4	Zinnia	2	Изменен navigation_extenders и moderator_state.
91	2013-02-21 12:24:56.218295+04	1	10	4	Zinnia	2	Изменен language и moderator_state.
92	2013-02-21 12:29:49.913806+04	1	10	7	История	1	
93	2013-02-21 12:40:23.996746+04	1	10	2	Company	2	Изменен reverse_id,language и moderator_state.
94	2013-02-21 12:42:12.590665+04	1	10	2	Company	2	Изменен navigation_extenders,language и moderator_state.
95	2013-02-21 13:07:27.723916+04	1	10	8	Редирект	1	
96	2013-02-21 13:08:12.941504+04	1	10	8	Редирект	2	Изменен overwrite_url и moderator_state.
97	2013-02-21 13:09:27.793994+04	1	10	8	Редирект	2	Изменен title,slug,language и moderator_state.
98	2013-02-21 13:09:53.377084+04	1	10	8	Редирект	2	Изменен moderator_state.
99	2013-02-21 13:10:36.911273+04	1	10	8	Redirect	2	Изменен overwrite_url,language и moderator_state.
100	2013-02-21 13:11:36.778746+04	1	10	8	Редирект	2	Изменен overwrite_url и moderator_state.
101	2013-02-21 13:11:50.349673+04	1	10	8	Redirect	2	Изменен overwrite_url,language и moderator_state.
102	2013-02-21 13:13:47.079401+04	1	10	2	Company	2	Изменен navigation_extenders,language и moderator_state.
103	2013-02-21 13:14:40.42954+04	1	10	8	Редирект	2	Изменен overwrite_url и moderator_state.
104	2013-02-21 13:14:51.611502+04	1	10	8	Redirect	2	Изменен overwrite_url,language и moderator_state.
105	2013-02-21 13:22:35.053834+04	1	10	8	Redirect	2	Changed overwrite_url, redirect and moderator_state.
106	2013-02-21 13:22:47.56844+04	1	10	8	Redirect	2	Changed moderator_state.
107	2013-02-21 13:24:57.72128+04	1	10	8	Redirect	2	Changed redirect and moderator_state.
108	2013-02-21 15:14:14.616109+04	1	31	2	Rus: published	2	Changed excerpt_ru.
109	2013-02-21 16:46:17.371462+04	1	31	3	Хохо: draft	1	
110	2013-02-21 16:46:46.369941+04	1	31	3	Хохо: published	2	Changed status.
111	2013-02-21 16:47:05.337977+04	1	31	3	Хохо: published	2	Changed categories.
112	2013-02-21 16:52:11.068804+04	1	10	1	New	2	Changed title, slug and moderator_state.
113	2013-02-21 16:52:32.572579+04	1	10	1	Новая	2	Changed title, slug, language and moderator_state.
114	2013-02-22 08:45:23.13621+04	1	10	3	Global Placeholder	2	Changed language and moderator_state.
115	2013-02-22 08:47:00.212458+04	1	10	3	Global Placeholder	2	Changed language and moderator_state.
116	2013-02-22 12:04:50.870224+04	1	10	1	Home	2	Изменен language и moderator_state.
117	2013-02-22 12:10:31.566736+04	1	10	2	Компания	2	Изменен template и moderator_state.
118	2013-02-22 13:19:13.905788+04	1	10	2	Company	2	Изменен language и moderator_state.
119	2013-02-22 13:31:56.224822+04	1	10	2	Company	2	Изменен language и moderator_state.
120	2013-02-22 14:13:45.836691+04	1	10	7	История	2	Изменен moderator_state.
121	2013-02-22 14:15:19.471234+04	1	10	7	История	2	Изменен title,slug,language и moderator_state.
122	2013-02-22 14:26:53.420614+04	1	31	3	Хохо: опубликован	3	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 122, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_comment_flags (id, user_id, comment_id, flag, flag_date) FROM stdin;
\.


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_comments (id, content_type_id, object_pk, site_id, user_id, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed) FROM stdin;
\.


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	placeholder	cms	placeholder
9	cms plugin	cms	cmsplugin
10	page	cms	page
11	PageModerator	cms	pagemoderator
12	Page moderator state	cms	pagemoderatorstate
13	Page global permission	cms	globalpagepermission
14	Page permission	cms	pagepermission
15	User (page)	cms	pageuser
16	User group (page)	cms	pageusergroup
17	title	cms	title
18	cache key	menus	cachekey
19	migration history	south	migrationhistory
20	text	text	text
21	picture	picture	picture
22	link	link	link
23	file	file	file
24	Snippet	snippet	snippet
25	Snippet	snippet	snippetptr
26	google map	googlemap	googlemap
27	comment	comments	comment
28	comment flag	comments	commentflag
29	tag	tagging	tag
30	tagged item	tagging	taggeditem
31		zinnia	entry
32	category	zinnia	category
33	author	zinnia	author
34	clock town	cms_helper	clocktown
35	latest entries plugin	cmsplugin_zinnia	latestentriesplugin
36	selected entries plugin	cmsplugin_zinnia	selectedentriesplugin
37	random entries plugin	cmsplugin_zinnia	randomentriesplugin
38	query entries plugin	cmsplugin_zinnia	queryentriesplugin
39	calendar entries plugin	cmsplugin_zinnia	calendarentriesplugin
40	kv store	thumbnail	kvstore
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_content_type_id_seq', 40, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
975982c067e4336e05b61f4ff15a55a5	MWYzMTE3ZmE1MjlhNmI5MGUwYWVmZjhlYTgxOTc1YjhiNjNjMGEzNDqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlSwFVDV9hdXRoX3VzZXJfaWRLAVUJX21lc3NhZ2VzXXECKGNkamFuZ28uY29udHJpYi5t\nZXNzYWdlcy5zdG9yYWdlLmJhc2UKTWVzc2FnZQpxAymBcQR9cQUoVQpleHRyYV90YWdzcQZOVQdt\nZXNzYWdlcQdYuQAAAHRleHQgItCc0LXQttC00YPQvdCw0YDQvtC00L3Ri9C1INC60L7QvdGC0LXQ\nudC90LXRgNC90YvQtSDQv9C10YAuLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy\n0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC\n0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuVQVsZXZlbHEISxR1YmgDKYFxCX1xCihoBlgAAAAA\naAdYlgAAANGB0YLRgNCw0L3QuNGG0LAgItCa0L7QvNC/0LDQvdC40Y8iINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+\n0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxC31x\nDChoBlgAAAAAaAdYtwAAAHRleHQgItCc0LXQttC00YPQvdCw0YDQvtC00L3Ri9C1INC60L7QvdGC\n0LXQudC90LXRgNC90YvQtSDQv9C10YAuLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQ\ntdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7R\ngtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxDX1xDihoBlgAAAAAaAdYtwAA\nAHRleHQgItCc0LXQttC00YPQvdCw0YDQvtC00L3Ri9C1INC60L7QvdGC0LXQudC90LXRgNC90YvQ\ntSDQv9C10YAuLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC4\n0YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxD31xEChoBlgAAAAAaAdYtwAAAHRleHQgItCc0LXQttC0\n0YPQvdCw0YDQvtC00L3Ri9C1INC60L7QvdGC0LXQudC90LXRgNC90YvQtSDQv9C10YAuLi4iINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgI\nSxR1YmgDKYFxEX1xEihoBlgAAAAAaAdYtwAAAHRleHQgItCc0LXQttC00YPQvdCw0YDQvtC00L3R\ni9C1INC60L7QvdGC0LXQudC90LXRgNC90YvQtSDQv9C10YAuLi4iINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQ\nsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxE31xFCho\nBlgAAAAAaAdYuQAAAHRleHQgItCc0LXQttC00YPQvdCw0YDQvtC00L3Ri9C10LrQvtC90YLQtdC5\n0L3QtdGA0L3Ri9C10L/QtdGA0LXQsi4uLiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC1\n0L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC\n0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEVfXEWKGgGWAAAAABoB1i5AAAA\ndGV4dCAi0JzQtdC20LTRg9C90LDRgNC+0LTQvdGL0LXQutC+0L3RgtC10LnQvdC10YDQvdGL0LXQ\nv9C10YDQtdCyLi4uIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQ\nuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcRd9cRgoaAZYAAAAAGgHWJsAAAB0ZXh0ICJDb250YWlu\nZXIgU2hpcHBpbmdpbiBSdXNzaWEgLi4uLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQ\ntdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7R\ngtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxGX1xGihoBlgAAAAAaAdYQAAA\nANGB0YLRgNCw0L3QuNGG0LAgIkNvbXBhbnkiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQ\ntdC90LXQvS5oCEsUdWJoAymBcRt9cRwoaAZYAAAAAGgHWK8AAAB0ZXh0ICLQoNGD0YHQutC+0L0g\n0L7QutCw0LfRi9Cy0LDQtdGCINGD0YHQu9GD0LPQuCAuLi4uLi4iINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7Q\nstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEdfXEe\nKGgGWAAAAABoB1iSAAAAdGV4dCAiUnVzY29uIHByb3ZpZGVzIGEgLi4uLi4uIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB\n0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymB\ncR99cSAoaAZYAAAAAGgHWEAAAADRgdGC0YDQsNC90LjRhtCwICJDb21wYW55IiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXEhfXEiKGgGWAAAAABoB1ipAAAA\ndGV4dCAi0JrQvtC80L/QsNC90LjRjyDQoNGD0YHQutC+0L0g0LHRi9C70LAgLi4uLi4uIiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQ\ntdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgI\nSxR1YmgDKYFxI31xJChoBlgAAAAAaAdYRwAAANGB0YLRgNCw0L3QuNGG0LAgItCY0YHRgtC+0YDQ\nuNGPIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXElfXEm\nKGgGWAAAAABoB1iTAAAAdGV4dCAiUnVzY29uIHdhcyBmb3VuZGVkIC4uLi4uLiIg0LHRi9C7INGD\n0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDR\ngdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMp\ngXEnfXEoKGgGWAAAAABoB1hHAAAA0YHRgtGA0LDQvdC40YbQsCAi0JjRgdGC0L7RgNC40Y8iINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5oCEsUdWJoAymBcSl9cSooaAZYAAAA\nAGgHWC0AAADQo9GB0L/QtdGI0L3QviDRg9C00LDQu9C10L3RiyAxINC30LDQv9C40YHRjC5oCEsU\ndWJlVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9k\nZWxCYWNrZW5kVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAHJ1cSt1Lg==\n	2013-03-08 15:11:15.239484+04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
98	ru	1	cms-menu_nodes_ru_1_1_user
99	en	1	cms-menu_nodes_en_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 99, true);


--
-- Data for Name: snippet_snippet; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY snippet_snippet (id, name, html, template) FROM stdin;
1	LiveInternet counter	<!--LiveInternet counter--><script type="text/javascript"><!--\r\ndocument.write("<a href='http://www.liveinternet.ru/click' "+\r\n"target=_blank><img src='//counter.yadro.ru/hit?t45.10;r"+\r\nescape(document.referrer)+((typeof(screen)=="undefined")?"":\r\n";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?\r\nscreen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+\r\n";h"+escape(document.title.substring(0,80))+";"+Math.random()+\r\n"' alt='' title='LiveInternet' "+\r\n"border='0' width='31' height='31'><\\/a>")\r\n//--></script><!--/LiveInternet-->	
\.


--
-- Name: snippet_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('snippet_snippet_id_seq', 1, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	cms	0001_initial	2013-02-11 09:00:08.705664+04
2	cms	0002_auto_start	2013-02-11 09:00:08.709043+04
3	cms	0003_remove_placeholder	2013-02-11 09:00:08.71216+04
4	cms	0004_textobjects	2013-02-11 09:00:08.714791+04
5	cms	0005_mptt_added_to_plugins	2013-02-11 09:00:08.717485+04
6	text	0001_initial	2013-02-11 09:00:08.720433+04
7	text	0002_freeze	2013-02-11 09:00:08.723158+04
8	cms	0006_apphook	2013-02-11 09:00:08.72659+04
9	cms	0007_apphook_longer	2013-02-11 09:00:08.729193+04
10	cms	0008_redirects	2013-02-11 09:00:08.732265+04
11	cms	0009_added_meta_fields	2013-02-11 09:00:08.734904+04
12	cms	0010_5char_language	2013-02-11 09:00:08.737583+04
13	cms	0011_title_overwrites	2013-02-11 09:00:08.740195+04
14	cms	0012_publisher	2013-02-11 09:00:08.748761+04
15	text	0003_publisher	2013-02-11 09:00:08.751397+04
16	snippet	0001_initial	2013-02-11 09:00:08.753867+04
17	snippet	0002_publisher	2013-02-11 09:00:08.756273+04
18	picture	0001_initial	2013-02-11 09:00:08.758626+04
19	picture	0002_link_rename	2013-02-11 09:00:08.771016+04
20	picture	0003_freeze	2013-02-11 09:00:08.774883+04
21	picture	0004_publisher	2013-02-11 09:00:08.779323+04
22	link	0001_initial	2013-02-11 09:00:08.782973+04
23	link	0002_link_rename	2013-02-11 09:00:08.788354+04
24	link	0003_page_link	2013-02-11 09:00:08.791263+04
25	link	0004_larger_link_names	2013-02-11 09:00:08.793999+04
26	link	0005_publisher	2013-02-11 09:00:08.798221+04
27	googlemap	0001_initial	2013-02-11 09:00:08.801361+04
28	file	0001_initial	2013-02-11 09:00:08.805248+04
29	file	0002_freeze	2013-02-11 09:00:08.808069+04
30	file	0003_publisher	2013-02-11 09:00:08.815759+04
31	cms	0013_site_copy	2013-02-11 09:00:08.820927+04
32	cms	0014_sites_removed	2013-02-11 09:00:08.823713+04
33	cms	0015_modified_by_added	2013-02-11 09:00:08.835206+04
34	cms	0016_author_copy	2013-02-11 09:00:08.83908+04
35	cms	0017_author_removed	2013-02-11 09:00:08.842008+04
36	cms	0018_site_permissions	2013-02-11 09:00:08.846087+04
37	cms	0019_public_table_renames	2013-02-11 09:00:08.849356+04
38	text	0004_table_rename	2013-02-11 09:00:08.853481+04
39	text	0005_publisher2	2013-02-11 09:00:08.857323+04
40	snippet	0003_table_rename	2013-02-11 09:00:08.8613+04
41	snippet	0004_publisher2	2013-02-11 09:00:08.863999+04
42	picture	0005_table_rename	2013-02-11 09:00:08.867409+04
43	picture	0006_float_added	2013-02-11 09:00:08.876428+04
44	picture	0007_publisher2	2013-02-11 09:00:08.879053+04
45	link	0006_table_rename	2013-02-11 09:00:08.885997+04
46	link	0007_publisher2	2013-02-11 09:00:08.893283+04
47	googlemap	0002_table_rename	2013-02-11 09:00:08.902265+04
48	googlemap	0003_address_unified	2013-02-11 09:00:08.905474+04
49	googlemap	0004_copy_address	2013-02-11 09:00:08.908111+04
50	googlemap	0005_delete_street	2013-02-11 09:00:08.910918+04
51	googlemap	0006_publisher2	2013-02-11 09:00:08.913916+04
52	file	0004_table_rename	2013-02-11 09:00:08.917514+04
53	file	0005_publisher2	2013-02-11 09:00:08.921238+04
54	cms	0020_advanced_permissions	2013-02-11 09:00:08.924655+04
55	cms	0021_publisher2	2013-02-11 09:00:08.927818+04
56	cms	0022_login_required_added	2013-02-11 09:00:08.934284+04
57	cms	0023_plugin_table_naming_function_changed	2013-02-11 09:00:08.938091+04
58	cms	0024_added_placeholder_model	2013-02-11 09:00:08.941228+04
59	cms	0025_placeholder_migration	2013-02-11 09:00:08.943932+04
60	cms	0026_finish_placeholder_migration	2013-02-11 09:00:08.953228+04
61	cms	0027_added_width_to_placeholder	2013-02-11 09:00:08.960966+04
62	cms	0028_limit_visibility_in_menu_step1of3	2013-02-11 09:00:08.964617+04
63	cms	0029_limit_visibility_in_menu_step2of3_data	2013-02-11 09:00:08.967741+04
64	cms	0030_limit_visibility_in_menu_step3of3	2013-02-11 09:00:08.971562+04
65	cms	0031_improved_language_code_support	2013-02-11 09:00:08.974746+04
66	cms	0032_auto__del_field_cmsplugin_publisher_public__del_field_cmsplugin_publis	2013-02-11 09:00:08.978497+04
67	cms	0033_auto__del_field_title_publisher_is_draft__del_field_title_publisher_st	2013-02-11 09:00:08.981343+04
68	cms	0034_auto__chg_field_title_language__chg_field_cmsplugin_language__add_fiel	2013-02-11 09:00:08.986554+04
69	cms	0035_auto__add_field_globalpagepermission_can_view__add_field_pagepermissio	2013-02-11 09:00:08.99013+04
70	cms	0036_auto__add_field_cmsplugin_changed_date	2013-02-11 09:00:08.998029+04
71	menus	0001_initial	2013-02-11 09:00:09.072252+04
72	text	0006_2_1_4_upgrade	2013-02-11 09:00:09.122782+04
73	picture	0008_longdesc_added	2013-02-11 09:00:09.172527+04
74	link	0008_mailto	2013-02-11 09:00:09.23466+04
75	link	0009_add_target	2013-02-11 09:00:09.240178+04
76	snippet	0005_template_added	2013-02-11 09:00:09.372342+04
77	googlemap	0007_latlng	2013-02-11 09:00:09.440072+04
78	googlemap	0008_routeplaner	2013-02-11 09:00:09.444513+04
79	googlemap	0009_routeplaner_title	2013-02-11 09:00:09.447592+04
80	googlemap	0010_auto__chg_field_googlemap_content	2013-02-11 09:00:09.450696+04
81	googlemap	0011_remove_zoom_null_values	2013-02-11 09:00:09.455933+04
82	googlemap	0012_auto__add_field_googlemap_width__add_field_googlemap_height__chg_field	2013-02-11 09:00:09.459943+04
83	zinnia	0001_initial	2013-02-12 13:32:54.381665+04
84	zinnia	0002_auto__add_field_entry_pingback_enabled	2013-02-12 13:32:54.627758+04
85	zinnia	0003_auto__chg_field_category_title__chg_field_category_slug__add_unique_ca	2013-02-12 13:32:55.104757+04
86	zinnia	0004_mptt_categories	2013-02-12 13:32:55.318794+04
87	zinnia	0005_entry_protection	2013-02-12 13:32:55.39395+04
88	zinnia	0006_entry_template	2013-02-12 13:32:55.457906+04
89	zinnia	0007_entry_featured	2013-02-12 13:32:55.500269+04
90	zinnia	0008_add_status_permission	2013-02-12 13:32:55.541953+04
91	zinnia	0009_change_mptt_field	2013-02-12 13:32:55.637432+04
92	zinnia	0010_publication_dates_unrequired	2013-02-12 13:32:55.703012+04
93	zinnia	0011_author_proxy	2013-02-12 13:32:55.746058+04
94	zinnia	0012_discussion_count	2013-02-12 13:32:55.830344+04
95	zinnia	0013_compute_discussion_count	2013-02-12 13:32:55.872486+04
96	zinnia	0014_trackback_enabled	2013-02-12 13:32:55.923136+04
97	zinnia	0015_rename_template	2013-02-12 13:32:55.96408+04
98	zinnia	0016_entry_content_template	2013-02-12 13:32:56.01071+04
99	cms_helper	0001_initial	2013-02-12 16:52:23.022062+04
100	zinnia	0017_auto__add_field_category_title_en__add_field_category_title_ru__add_fi	2013-02-12 16:55:27.846508+04
101	cms_helper	0002_auto__add_clocktown	2013-02-14 16:49:22.476375+04
102	cms_helper	0003_auto__add_field_clocktown_town_en__add_field_clocktown_town_ru	2013-02-14 16:52:42.681967+04
103	cms_helper	0004_auto__add_field_clocktown_order	2013-02-15 09:31:35.566253+04
104	cmsplugin_zinnia	0001_initial	2013-02-19 11:48:30.595993+04
105	cmsplugin_zinnia	0002_query_entries_plugin	2013-02-19 11:48:30.65348+04
106	cmsplugin_zinnia	0003_calendar_entries_plugin	2013-02-19 11:48:30.715929+04
108	thumbnail	0001_initial	2013-02-19 14:06:04.124207+04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 108, true);


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY tagging_tag (id, name) FROM stdin;
\.


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 1, false);


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY tagging_taggeditem (id, tag_id, content_type_id, object_id) FROM stdin;
\.


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 1, false);


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||53992ae5bb09118436be1e4368b3cf05	{"storage": "django.core.files.storage.FileSystemStorage", "name": "uploads/zinnia/stars_near_cho_la_LJ.jpg", "size": [1000, 667]}
sorl-thumbnail||image||6490a897371dfe7dc2a5008ec3f86c45	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c8/3a/c83a249498763390f9a5dd746d5bcfca.jpg", "size": [110, 80]}
sorl-thumbnail||image||67560eaff8de2c371d574689baf25119	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/48/25/4825f2bb3d893dec12e5782ed5462b6c.jpg", "size": [160, 120]}
sorl-thumbnail||image||9c3d81ff0cd53ce444a73a52e0da9408	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/25/19/2519a2dc9f860f80f39b9539b1ccadb4.jpg", "size": [240, 135]}
sorl-thumbnail||thumbnails||53992ae5bb09118436be1e4368b3cf05	["30dd09287e5afa713b079eb20cfa2503", "67560eaff8de2c371d574689baf25119", "ca1fcb9f501e70c5767d6d03c50f2531", "9c3d81ff0cd53ce444a73a52e0da9408", "8dd92f96abdb812df0ee1372643b2b0b", "6490a897371dfe7dc2a5008ec3f86c45", "af0404eb2079b330f374704b09f22aca", "a3de6b3774a686df9b5f0f063a399593", "cb052cd6c6988942c1fcf096a87c50ce", "e280570025c1e872f33612f60af2353f", "da769bf0e74523bc5a5a8f90c226edbd", "911aa59225e2149f7ef530c9efb6ede4"]
sorl-thumbnail||image||e280570025c1e872f33612f60af2353f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/6b/38/6b386d6ab8d17d66eb2e529402077ef9.jpg", "size": [800, 534]}
sorl-thumbnail||image||911aa59225e2149f7ef530c9efb6ede4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d9/0d/d90de8517f81d9ddd4d2dc0981c6f7cf.jpg", "size": [400, 200]}
sorl-thumbnail||image||a3de6b3774a686df9b5f0f063a399593	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/37/99/37992156fdafa16803b2d8d5c448186e.jpg", "size": [340, 220]}
sorl-thumbnail||image||30dd09287e5afa713b079eb20cfa2503	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f5/1a/f51ad55dbedf63d7386f7d34ae98e477.jpg", "size": [210, 140]}
sorl-thumbnail||image||8dd92f96abdb812df0ee1372643b2b0b	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/1e/9a/1e9a950e52899edad35b84d3281ceb59.jpg", "size": [330, 220]}
sorl-thumbnail||image||da769bf0e74523bc5a5a8f90c226edbd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/0c/26/0c26be18c31353581b9e085386c30d67.jpg", "size": [180, 120]}
sorl-thumbnail||image||af0404eb2079b330f374704b09f22aca	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a0/f9/a0f9734c0c8d3303f8aff951dee64844.jpg", "size": [165, 110]}
sorl-thumbnail||image||ca1fcb9f501e70c5767d6d03c50f2531	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/85/80/8580f06c24e882ac051980ecb43645d5.jpg", "size": [173, 115]}
sorl-thumbnail||image||cb052cd6c6988942c1fcf096a87c50ce	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/70/b7/70b72f02408f008d1699405699ecfefb.jpg", "size": [200, 150]}
\.


--
-- Data for Name: zinnia_category; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_category (slug, description, id, title, parent_id, lft, rght, tree_id, level, title_en, title_ru, description_en, description_ru) FROM stdin;
press-releases		2	Пресс-релизы	\N	1	2	1	0	Press releases	Пресс-релизы		
\.


--
-- Name: zinnia_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_category_id_seq', 2, true);


--
-- Data for Name: zinnia_entry; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry (status, last_update, comment_enabled, tags, image, title, excerpt, slug, content, end_publication, start_publication, creation_date, id, pingback_enabled, login_required, password, detail_template, featured, comment_count, pingback_count, trackback_count, trackback_enabled, content_template, title_en, title_ru, content_en, content_ru, excerpt_en, excerpt_ru) FROM stdin;
2	2013-02-20 09:59:02.44042+04	t		uploads/zinnia/stars_near_cho_la_LJ.jpg	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве	Глобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км....	testovaya-zapis	Глобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км.\r\nНовый кран был сделан в России компанией «Техноросс», и имеет грузоподъемность 36 тонн. Кран рассчитан на обработку штабеля высотой  5+1. Внутренний пролет крана составляет 42 метра, что соответствует 12 контейнерам в ширину.\r\nМАНП располагается рядом с железнодорожной станцией Кресты в 45 км на юго-запад от МКАД, недалеко от границы с Калужской области, в районе с высокой концентрацией сборочных производств и распределительных центров многих крупных зарубежных компаний. Среди них такие известные производители и марки, как Samsung, Panasonic, LG, PSA Peugeot Citroën, Mitsubishi, Adidas, X5 и Nestlé. Некоторые из этих компаний уже используют МАНП как терминал для получения, хранения и распределения товаров в регионе Центральной России.\r\nТерминал МАНП занимает 14,6 гектар, на которых расположены несколько складов общей площадью хранения 15,000 м2. На территории терминала находится склад временного хранения для осуществления таможенных операций с поступающими импортными грузами. \r\nМАНП располагает собственным парком автоконтейнеровозов, недавно увеличенным на пять единиц, для доставки товаров с терминала до складов грузополучателей.\r\nТерминал обслуживается специализированными контейнерными поездами из Новороссийска.  В стадии активного рассмотрения находятся проекты поездов из портов Санкт-Петербург/Усть-Луга, Украины и российского Дальнего Востока.	\N	\N	2013-02-12 13:33:46+04	1	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	First	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве	Ololo	Глобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км.\r\nНовый кран был сделан в России компанией «Техноросс», и имеет грузоподъемность 36 тонн. Кран рассчитан на обработку штабеля высотой  5+1. Внутренний пролет крана составляет 42 метра, что соответствует 12 контейнерам в ширину.\r\nМАНП располагается рядом с железнодорожной станцией Кресты в 45 км на юго-запад от МКАД, недалеко от границы с Калужской области, в районе с высокой концентрацией сборочных производств и распределительных центров многих крупных зарубежных компаний. Среди них такие известные производители и марки, как Samsung, Panasonic, LG, PSA Peugeot Citroën, Mitsubishi, Adidas, X5 и Nestlé. Некоторые из этих компаний уже используют МАНП как терминал для получения, хранения и распределения товаров в регионе Центральной России.\r\nТерминал МАНП занимает 14,6 гектар, на которых расположены несколько складов общей площадью хранения 15,000 м2. На территории терминала находится склад временного хранения для осуществления таможенных операций с поступающими импортными грузами. \r\nМАНП располагает собственным парком автоконтейнеровозов, недавно увеличенным на пять единиц, для доставки товаров с терминала до складов грузополучателей.\r\nТерминал обслуживается специализированными контейнерными поездами из Новороссийска.  В стадии активного рассмотрения находятся проекты поездов из портов Санкт-Петербург/Усть-Луга, Украины и российского Дальнего Востока.	wowowow	Глобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км....
2	2013-02-21 15:14:14.237345+04	t			Rus	con	new-wave	con	\N	\N	2013-02-19 13:11:06+04	2	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Rus	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea	con	Новый контейнерный поезд запущен ГКС/Рускон из Усть-Лужского Контейнерного Терминала (УЛКТ) в Нижний Новгород. \r\nПоезд предназначен в первую очередь для перевозок грузов компании General Motors (GM) Korea, которая в 2011 году подписала договор с автозаводом ГАЗ на сборку автомобилей Chevrolet Aveo. Одновременно ГКС предлагает возможности этого поезда также для перевозок сторонних экспедиторов и грузовладельцев, доставляющих контейнеры через Усть-Лугу.\r\nПроизводство Chevrolet Aveo началось с декабря 2012 года, планируемый объем сборки составляет до 32,000 автомобилей в год.\r\nРускон выполнил перевозку двух пробных поездов из УЛКТ в начале декабря. Всего для GM Korea в Нижний Новгород было доставлено 118 контейнеров, в том числе 54x40’ и 2x20’ контейнеров на первом поезде и 60x40’ и 2x20’ – на втором.\r\nРускон использовал для перевозки собственные платформы и недавно сформированный офис в Усть-Луге. Помимо жд перевозки, компания также осуществляла в интересах клиента необходимые портовые и транзитные формальности; морская часть перевозки выполнялась контейнерной линией Maersk Line.\r\nРегулярные перевозки комплектующих GM Korea начинаются с января. Ожидается, что их объем должен составить до 800x40’ в месяц.\r\nРускон является 100% дочкой группы ГКС и оказывает широкий спектр услуг по перевозке контейнеров, помимо услуг линейного агентирования, таможенной очистки и терминальной обработки.	con	Новый контейнерный поезд запущен ГКС/Рускон из Усть-Лужского Контейнерного Терминала (УЛКТ) в Нижний Новгород. Поезд предназначен в первую очередь для перевозок грузов компании General Motors (GM) Korea, которая в 2011 году подписала договор с автозаводом ГАЗ на сборку автомобилей Chevrolet Aveo.
\.


--
-- Data for Name: zinnia_entry_authors; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_authors (id, entry_id, author_id) FROM stdin;
15	1	1
21	2	1
\.


--
-- Name: zinnia_entry_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_authors_id_seq', 24, true);


--
-- Data for Name: zinnia_entry_categories; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_categories (id, entry_id, category_id) FROM stdin;
13	1	2
19	2	2
\.


--
-- Name: zinnia_entry_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_categories_id_seq', 20, true);


--
-- Name: zinnia_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_id_seq', 3, true);


--
-- Data for Name: zinnia_entry_related; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_related (id, from_entry_id, to_entry_id) FROM stdin;
\.


--
-- Name: zinnia_entry_related_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_related_id_seq', 1, false);


--
-- Data for Name: zinnia_entry_sites; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_sites (id, entry_id, site_id) FROM stdin;
15	1	1
21	2	1
\.


--
-- Name: zinnia_entry_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_sites_id_seq', 24, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_cmsplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_globalpagepermission_site_globalpagepermission_id_site__key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_site_globalpagepermission_id_site__key UNIQUE (globalpagepermission_id, site_id);


--
-- Name: cms_globalpagepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: cms_helper_clocktown_order_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_helper_clocktown
    ADD CONSTRAINT cms_helper_clocktown_order_key UNIQUE ("order");


--
-- Name: cms_helper_clocktown_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_helper_clocktown
    ADD CONSTRAINT cms_helper_clocktown_pkey PRIMARY KEY (id);


--
-- Name: cms_helper_clocktown_town_en_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_helper_clocktown
    ADD CONSTRAINT cms_helper_clocktown_town_en_key UNIQUE (town_en);


--
-- Name: cms_helper_clocktown_town_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_helper_clocktown
    ADD CONSTRAINT cms_helper_clocktown_town_key UNIQUE (town);


--
-- Name: cms_helper_clocktown_town_ru_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_helper_clocktown
    ADD CONSTRAINT cms_helper_clocktown_town_ru_key UNIQUE (town_ru);


--
-- Name: cms_page_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_pkey PRIMARY KEY (id);


--
-- Name: cms_page_placeholders_page_id_placeholder_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_page_id_placeholder_id_key UNIQUE (page_id, placeholder_id);


--
-- Name: cms_page_placeholders_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_pkey PRIMARY KEY (id);


--
-- Name: cms_page_publisher_public_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_publisher_public_id_key UNIQUE (publisher_public_id);


--
-- Name: cms_pagemoderator_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT cms_pagemoderator_pkey PRIMARY KEY (id);


--
-- Name: cms_pagemoderatorstate_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_pkey PRIMARY KEY (id);


--
-- Name: cms_pagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_pkey PRIMARY KEY (id);


--
-- Name: cms_pageuser_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_pkey PRIMARY KEY (user_ptr_id);


--
-- Name: cms_pageusergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_pkey PRIMARY KEY (group_ptr_id);


--
-- Name: cms_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_placeholder
    ADD CONSTRAINT cms_placeholder_pkey PRIMARY KEY (id);


--
-- Name: cms_title_language_page_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_language_page_id_key UNIQUE (language, page_id);


--
-- Name: cms_title_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_calendarentriesplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_calendarentriesplugin
    ADD CONSTRAINT cmsplugin_calendarentriesplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_file_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_file_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_googlemap_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_googlemap
    ADD CONSTRAINT cmsplugin_googlemap_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_latestentriesplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_latestentriesplugin
    ADD CONSTRAINT cmsplugin_latestentriesplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_link_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_picture_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_queryentriesplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_queryentriesplugin
    ADD CONSTRAINT cmsplugin_queryentriesplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_randomentriesplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_randomentriesplugin
    ADD CONSTRAINT cmsplugin_randomentriesplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_selectedentriesplugin_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_selectedentriesplugin
    ADD CONSTRAINT cmsplugin_selectedentriesplugin_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_snippetptr_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_snippetptr_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_text_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_zinnia_l_latestentriesplugin_id_293f2f67952dc99e_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_categories
    ADD CONSTRAINT cmsplugin_zinnia_l_latestentriesplugin_id_293f2f67952dc99e_uniq UNIQUE (latestentriesplugin_id, category_id);


--
-- Name: cmsplugin_zinnia_l_latestentriesplugin_id_5d47ab05e6e576c8_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_authors
    ADD CONSTRAINT cmsplugin_zinnia_l_latestentriesplugin_id_5d47ab05e6e576c8_uniq UNIQUE (latestentriesplugin_id, user_id);


--
-- Name: cmsplugin_zinnia_l_latestentriesplugin_id_7b19879bbccb7f4a_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_tags
    ADD CONSTRAINT cmsplugin_zinnia_l_latestentriesplugin_id_7b19879bbccb7f4a_uniq UNIQUE (latestentriesplugin_id, tag_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_authors
    ADD CONSTRAINT cmsplugin_zinnia_latestentriesplugin_authors_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_categories
    ADD CONSTRAINT cmsplugin_zinnia_latestentriesplugin_categories_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_tags
    ADD CONSTRAINT cmsplugin_zinnia_latestentriesplugin_tags_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_selectedentriesplugin_entries
    ADD CONSTRAINT cmsplugin_zinnia_selectedentriesplugin_entries_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_id_3be94f0eb3d73a02_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_zinnia_selectedentriesplugin_entries
    ADD CONSTRAINT cmsplugin_zinnia_selectedentriesplugin_id_3be94f0eb3d73a02_uniq UNIQUE (selectedentriesplugin_id, entry_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_comment_id_flag_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_key UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: menus_cachekey_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY menus_cachekey
    ADD CONSTRAINT menus_cachekey_pkey PRIMARY KEY (id);


--
-- Name: snippet_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_name_key UNIQUE (name);


--
-- Name: snippet_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY snippet_snippet
    ADD CONSTRAINT snippet_snippet_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: tagging_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_name_key UNIQUE (name);


--
-- Name: tagging_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY tagging_tag
    ADD CONSTRAINT tagging_tag_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tagging_taggeditem_tag_id_content_type_id_object_id_key; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_content_type_id_object_id_key UNIQUE (tag_id, content_type_id, object_id);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: zinnia_category_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_category
    ADD CONSTRAINT zinnia_category_pkey PRIMARY KEY (id);


--
-- Name: zinnia_category_slug_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_category
    ADD CONSTRAINT zinnia_category_slug_uniq UNIQUE (slug);


--
-- Name: zinnia_entry_authors_entry_id_4c997fb82fe99b1_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_authors
    ADD CONSTRAINT zinnia_entry_authors_entry_id_4c997fb82fe99b1_uniq UNIQUE (entry_id, author_id);


--
-- Name: zinnia_entry_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_authors
    ADD CONSTRAINT zinnia_entry_authors_pkey PRIMARY KEY (id);


--
-- Name: zinnia_entry_categories_entry_id_4e673c6a4d789b1d_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_categories
    ADD CONSTRAINT zinnia_entry_categories_entry_id_4e673c6a4d789b1d_uniq UNIQUE (entry_id, category_id);


--
-- Name: zinnia_entry_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_categories
    ADD CONSTRAINT zinnia_entry_categories_pkey PRIMARY KEY (id);


--
-- Name: zinnia_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry
    ADD CONSTRAINT zinnia_entry_pkey PRIMARY KEY (id);


--
-- Name: zinnia_entry_related_from_entry_id_1c6f37570b9f8939_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_related
    ADD CONSTRAINT zinnia_entry_related_from_entry_id_1c6f37570b9f8939_uniq UNIQUE (from_entry_id, to_entry_id);


--
-- Name: zinnia_entry_related_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_related
    ADD CONSTRAINT zinnia_entry_related_pkey PRIMARY KEY (id);


--
-- Name: zinnia_entry_sites_entry_id_7b0ddc9a2bc8a31b_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_sites
    ADD CONSTRAINT zinnia_entry_sites_entry_id_7b0ddc9a2bc8a31b_uniq UNIQUE (entry_id, site_id);


--
-- Name: zinnia_entry_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY zinnia_entry_sites
    ADD CONSTRAINT zinnia_entry_sites_pkey PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: cms_cmsplugin_language; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language ON cms_cmsplugin USING btree (language);


--
-- Name: cms_cmsplugin_language_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_language_like ON cms_cmsplugin USING btree (language varchar_pattern_ops);


--
-- Name: cms_cmsplugin_level; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_level ON cms_cmsplugin USING btree (level);


--
-- Name: cms_cmsplugin_lft; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_lft ON cms_cmsplugin USING btree (lft);


--
-- Name: cms_cmsplugin_parent_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_parent_id ON cms_cmsplugin USING btree (parent_id);


--
-- Name: cms_cmsplugin_placeholder_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_placeholder_id ON cms_cmsplugin USING btree (placeholder_id);


--
-- Name: cms_cmsplugin_plugin_type; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type ON cms_cmsplugin USING btree (plugin_type);


--
-- Name: cms_cmsplugin_plugin_type_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_plugin_type_like ON cms_cmsplugin USING btree (plugin_type varchar_pattern_ops);


--
-- Name: cms_cmsplugin_rght; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_rght ON cms_cmsplugin USING btree (rght);


--
-- Name: cms_cmsplugin_tree_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_cmsplugin_tree_id ON cms_cmsplugin USING btree (tree_id);


--
-- Name: cms_globalpagepermission_group_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_group_id ON cms_globalpagepermission USING btree (group_id);


--
-- Name: cms_globalpagepermission_sites_globalpagepermission_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_globalpagepermission_id ON cms_globalpagepermission_sites USING btree (globalpagepermission_id);


--
-- Name: cms_globalpagepermission_sites_site_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_sites_site_id ON cms_globalpagepermission_sites USING btree (site_id);


--
-- Name: cms_globalpagepermission_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_globalpagepermission_user_id ON cms_globalpagepermission USING btree (user_id);


--
-- Name: cms_page_in_navigation; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_in_navigation ON cms_page USING btree (in_navigation);


--
-- Name: cms_page_level; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_level ON cms_page USING btree (level);


--
-- Name: cms_page_lft; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_lft ON cms_page USING btree (lft);


--
-- Name: cms_page_limit_visibility_in_menu; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_limit_visibility_in_menu ON cms_page USING btree (limit_visibility_in_menu);


--
-- Name: cms_page_navigation_extenders; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders ON cms_page USING btree (navigation_extenders);


--
-- Name: cms_page_navigation_extenders_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_navigation_extenders_like ON cms_page USING btree (navigation_extenders varchar_pattern_ops);


--
-- Name: cms_page_parent_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_parent_id ON cms_page USING btree (parent_id);


--
-- Name: cms_page_placeholders_page_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_placeholders_page_id ON cms_page_placeholders USING btree (page_id);


--
-- Name: cms_page_placeholders_placeholder_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_placeholders_placeholder_id ON cms_page_placeholders USING btree (placeholder_id);


--
-- Name: cms_page_publication_date; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_publication_date ON cms_page USING btree (publication_date);


--
-- Name: cms_page_publication_end_date; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_publication_end_date ON cms_page USING btree (publication_end_date);


--
-- Name: cms_page_publisher_is_draft; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_publisher_is_draft ON cms_page USING btree (publisher_is_draft);


--
-- Name: cms_page_publisher_state; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_publisher_state ON cms_page USING btree (publisher_state);


--
-- Name: cms_page_reverse_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_reverse_id ON cms_page USING btree (reverse_id);


--
-- Name: cms_page_reverse_id_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_reverse_id_like ON cms_page USING btree (reverse_id varchar_pattern_ops);


--
-- Name: cms_page_rght; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_rght ON cms_page USING btree (rght);


--
-- Name: cms_page_site_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_site_id ON cms_page USING btree (site_id);


--
-- Name: cms_page_soft_root; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_soft_root ON cms_page USING btree (soft_root);


--
-- Name: cms_page_tree_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_page_tree_id ON cms_page USING btree (tree_id);


--
-- Name: cms_pagemoderator_page_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagemoderator_page_id ON cms_pagemoderator USING btree (page_id);


--
-- Name: cms_pagemoderator_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagemoderator_user_id ON cms_pagemoderator USING btree (user_id);


--
-- Name: cms_pagemoderatorstate_page_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_page_id ON cms_pagemoderatorstate USING btree (page_id);


--
-- Name: cms_pagemoderatorstate_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagemoderatorstate_user_id ON cms_pagemoderatorstate USING btree (user_id);


--
-- Name: cms_pagepermission_group_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagepermission_group_id ON cms_pagepermission USING btree (group_id);


--
-- Name: cms_pagepermission_page_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagepermission_page_id ON cms_pagepermission USING btree (page_id);


--
-- Name: cms_pagepermission_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pagepermission_user_id ON cms_pagepermission USING btree (user_id);


--
-- Name: cms_pageuser_created_by_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pageuser_created_by_id ON cms_pageuser USING btree (created_by_id);


--
-- Name: cms_pageusergroup_created_by_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_pageusergroup_created_by_id ON cms_pageusergroup USING btree (created_by_id);


--
-- Name: cms_placeholder_slot; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_placeholder_slot ON cms_placeholder USING btree (slot);


--
-- Name: cms_placeholder_slot_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_placeholder_slot_like ON cms_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: cms_title_application_urls; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_application_urls ON cms_title USING btree (application_urls);


--
-- Name: cms_title_application_urls_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_application_urls_like ON cms_title USING btree (application_urls varchar_pattern_ops);


--
-- Name: cms_title_has_url_overwrite; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_has_url_overwrite ON cms_title USING btree (has_url_overwrite);


--
-- Name: cms_title_language; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_language ON cms_title USING btree (language);


--
-- Name: cms_title_language_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_language_like ON cms_title USING btree (language varchar_pattern_ops);


--
-- Name: cms_title_page_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_page_id ON cms_title USING btree (page_id);


--
-- Name: cms_title_path; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_path ON cms_title USING btree (path);


--
-- Name: cms_title_path_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_path_like ON cms_title USING btree (path varchar_pattern_ops);


--
-- Name: cms_title_slug; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_slug ON cms_title USING btree (slug);


--
-- Name: cms_title_slug_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cms_title_slug_like ON cms_title USING btree (slug varchar_pattern_ops);


--
-- Name: cmsplugin_link_page_link_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_link_page_link_id ON cmsplugin_link USING btree (page_link_id);


--
-- Name: cmsplugin_picture_page_link_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_picture_page_link_id ON cmsplugin_picture USING btree (page_link_id);


--
-- Name: cmsplugin_snippetptr_snippet_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_snippetptr_snippet_id ON cmsplugin_snippetptr USING btree (snippet_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_latestentriesp61b2; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_authors_latestentriesp61b2 ON cmsplugin_zinnia_latestentriesplugin_authors USING btree (latestentriesplugin_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_authors_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_authors_user_id ON cmsplugin_zinnia_latestentriesplugin_authors USING btree (user_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_category_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_categories_category_id ON cmsplugin_zinnia_latestentriesplugin_categories USING btree (category_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_categories_latestentri1d11; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_categories_latestentri1d11 ON cmsplugin_zinnia_latestentriesplugin_categories USING btree (latestentriesplugin_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_latestentriesplug2872; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_tags_latestentriesplug2872 ON cmsplugin_zinnia_latestentriesplugin_tags USING btree (latestentriesplugin_id);


--
-- Name: cmsplugin_zinnia_latestentriesplugin_tags_tag_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_latestentriesplugin_tags_tag_id ON cmsplugin_zinnia_latestentriesplugin_tags USING btree (tag_id);


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_selectedentriesplugin_entries_entry_id ON cmsplugin_zinnia_selectedentriesplugin_entries USING btree (entry_id);


--
-- Name: cmsplugin_zinnia_selectedentriesplugin_entries_selectedentr6604; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_zinnia_selectedentriesplugin_entries_selectedentr6604 ON cmsplugin_zinnia_selectedentriesplugin_entries USING btree (selectedentriesplugin_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_comment_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comment_flags_comment_id ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_flag; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comment_flags_flag ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_flag_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comment_flags_flag_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comment_flags_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comment_flags_user_id ON django_comment_flags USING btree (user_id);


--
-- Name: django_comments_content_type_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comments_content_type_id ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_site_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comments_site_id ON django_comments USING btree (site_id);


--
-- Name: django_comments_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_comments_user_id ON django_comments USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: tagging_taggeditem_content_type_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX tagging_taggeditem_content_type_id ON tagging_taggeditem USING btree (content_type_id);


--
-- Name: tagging_taggeditem_object_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX tagging_taggeditem_object_id ON tagging_taggeditem USING btree (object_id);


--
-- Name: tagging_taggeditem_tag_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX tagging_taggeditem_tag_id ON tagging_taggeditem USING btree (tag_id);


--
-- Name: zinnia_category_level; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_level ON zinnia_category USING btree (level);


--
-- Name: zinnia_category_lft; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_lft ON zinnia_category USING btree (lft);


--
-- Name: zinnia_category_parent_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_parent_id ON zinnia_category USING btree (parent_id);


--
-- Name: zinnia_category_rght; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_rght ON zinnia_category USING btree (rght);


--
-- Name: zinnia_category_slug; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_slug ON zinnia_category USING btree (slug);


--
-- Name: zinnia_category_slug_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_slug_like ON zinnia_category USING btree (slug varchar_pattern_ops);


--
-- Name: zinnia_category_tree_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_category_tree_id ON zinnia_category USING btree (tree_id);


--
-- Name: zinnia_entry_authors_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_authors_entry_id ON zinnia_entry_authors USING btree (entry_id);


--
-- Name: zinnia_entry_authors_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_authors_user_id ON zinnia_entry_authors USING btree (author_id);


--
-- Name: zinnia_entry_categories_category_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_categories_category_id ON zinnia_entry_categories USING btree (category_id);


--
-- Name: zinnia_entry_categories_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_categories_entry_id ON zinnia_entry_categories USING btree (entry_id);


--
-- Name: zinnia_entry_related_from_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_related_from_entry_id ON zinnia_entry_related USING btree (from_entry_id);


--
-- Name: zinnia_entry_related_to_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_related_to_entry_id ON zinnia_entry_related USING btree (to_entry_id);


--
-- Name: zinnia_entry_sites_entry_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_sites_entry_id ON zinnia_entry_sites USING btree (entry_id);


--
-- Name: zinnia_entry_sites_site_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_sites_site_id ON zinnia_entry_sites USING btree (site_id);


--
-- Name: zinnia_entry_slug; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_slug ON zinnia_entry USING btree (slug);


--
-- Name: zinnia_entry_slug_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX zinnia_entry_slug_like ON zinnia_entry USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_7361f4dc8306a95d; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_categories
    ADD CONSTRAINT category_id_refs_id_7361f4dc8306a95d FOREIGN KEY (category_id) REFERENCES zinnia_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_7e6ce045459f8216; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_categories
    ADD CONSTRAINT category_id_refs_id_7e6ce045459f8216 FOREIGN KEY (category_id) REFERENCES zinnia_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_cmsplugin_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT cms_cmsplugin_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_sites_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT cms_globalpagepermission_sites_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_globalpagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission
    ADD CONSTRAINT cms_globalpagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_placeholders_placeholder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT cms_page_placeholders_placeholder_id_fkey FOREIGN KEY (placeholder_id) REFERENCES cms_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_page_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT cms_page_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderator_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT cms_pagemoderator_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderator_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderator
    ADD CONSTRAINT cms_pagemoderator_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagemoderatorstate_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagemoderatorstate
    ADD CONSTRAINT cms_pagemoderatorstate_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pagepermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pagepermission
    ADD CONSTRAINT cms_pagepermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageuser_user_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pageuser
    ADD CONSTRAINT cms_pageuser_user_ptr_id_fkey FOREIGN KEY (user_ptr_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_pageusergroup_group_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_pageusergroup
    ADD CONSTRAINT cms_pageusergroup_group_ptr_id_fkey FOREIGN KEY (group_ptr_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_title_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_title
    ADD CONSTRAINT cms_title_page_id_fkey FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_file_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_file_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_googlemap_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_googlemap
    ADD CONSTRAINT cmsplugin_googlemap_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_link_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_link_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_link
    ADD CONSTRAINT cmsplugin_link_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_picture_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_picture_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_picture_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_picture
    ADD CONSTRAINT cmsplugin_picture_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_3301bd8419e4c2ec; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_queryentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_3301bd8419e4c2ec FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_360f0e33209e77c; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_randomentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_360f0e33209e77c FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_4c030ec612cc9f9c; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_selectedentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_4c030ec612cc9f9c FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_5b5bb680225ec8c8; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_latestentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_5b5bb680225ec8c8 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_a939976eb84ffa7; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_calendarentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_a939976eb84ffa7 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_snippetptr_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_snippetptr_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_snippetptr_snippet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_snippetptr
    ADD CONSTRAINT cmsplugin_snippetptr_snippet_id_fkey FOREIGN KEY (snippet_id) REFERENCES snippet_snippet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_text_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_text
    ADD CONSTRAINT cmsplugin_text_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entry_id_refs_id_2ca8c253350895b0; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_sites
    ADD CONSTRAINT entry_id_refs_id_2ca8c253350895b0 FOREIGN KEY (entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entry_id_refs_id_2e8e58e6fb6ebd9; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_categories
    ADD CONSTRAINT entry_id_refs_id_2e8e58e6fb6ebd9 FOREIGN KEY (entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entry_id_refs_id_456b2b7ada51dea2; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_authors
    ADD CONSTRAINT entry_id_refs_id_456b2b7ada51dea2 FOREIGN KEY (entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entry_id_refs_id_7026db9978eac1ff; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_selectedentriesplugin_entries
    ADD CONSTRAINT entry_id_refs_id_7026db9978eac1ff FOREIGN KEY (entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: from_entry_id_refs_id_233a09ab4d833995; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_related
    ADD CONSTRAINT from_entry_id_refs_id_233a09ab4d833995 FOREIGN KEY (from_entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globalpagepermission_id_refs_id_2c730e06; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_globalpagepermission_sites
    ADD CONSTRAINT globalpagepermission_id_refs_id_2c730e06 FOREIGN KEY (globalpagepermission_id) REFERENCES cms_globalpagepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: latestentriesplugin_id_refs_cmsplugin_ptr_id_5d2b51b3278967ab; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_authors
    ADD CONSTRAINT latestentriesplugin_id_refs_cmsplugin_ptr_id_5d2b51b3278967ab FOREIGN KEY (latestentriesplugin_id) REFERENCES cmsplugin_latestentriesplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: latestentriesplugin_id_refs_cmsplugin_ptr_id_6efb0c12672935a2; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_categories
    ADD CONSTRAINT latestentriesplugin_id_refs_cmsplugin_ptr_id_6efb0c12672935a2 FOREIGN KEY (latestentriesplugin_id) REFERENCES cmsplugin_latestentriesplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: latestentriesplugin_id_refs_cmsplugin_ptr_id_6f912a9095869a39; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_tags
    ADD CONSTRAINT latestentriesplugin_id_refs_cmsplugin_ptr_id_6f912a9095869a39 FOREIGN KEY (latestentriesplugin_id) REFERENCES cmsplugin_latestentriesplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_b22baae5; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_b22baae5 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_1fffa484ce18ab03; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_category
    ADD CONSTRAINT parent_id_refs_id_1fffa484ce18ab03 FOREIGN KEY (parent_id) REFERENCES zinnia_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT parent_id_refs_id_653a773 FOREIGN KEY (parent_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_e0b32a03; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_cmsplugin
    ADD CONSTRAINT parent_id_refs_id_e0b32a03 FOREIGN KEY (parent_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: publisher_public_id_refs_id_653a773; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page
    ADD CONSTRAINT publisher_public_id_refs_id_653a773 FOREIGN KEY (publisher_public_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: selectedentriesplugin_id_refs_cmsplugin_ptr_id_2bb045ee250f1f05; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_selectedentriesplugin_entries
    ADD CONSTRAINT selectedentriesplugin_id_refs_cmsplugin_ptr_id_2bb045ee250f1f05 FOREIGN KEY (selectedentriesplugin_id) REFERENCES cmsplugin_selectedentriesplugin(cmsplugin_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_250ed0b2ebd96f36; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_sites
    ADD CONSTRAINT site_id_refs_id_250ed0b2ebd96f36 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_id_refs_id_77c431e0c66ec49e; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_tags
    ADD CONSTRAINT tag_id_refs_id_77c431e0c66ec49e FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagging_taggeditem_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY tagging_taggeditem
    ADD CONSTRAINT tagging_taggeditem_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tagging_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: to_entry_id_refs_id_233a09ab4d833995; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_related
    ADD CONSTRAINT to_entry_id_refs_id_233a09ab4d833995 FOREIGN KEY (to_entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_2805f1124cc96fc2; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_zinnia_latestentriesplugin_authors
    ADD CONSTRAINT user_id_refs_id_2805f1124cc96fc2 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_410656e2874b02ff; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_authors
    ADD CONSTRAINT user_id_refs_id_410656e2874b02ff FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

