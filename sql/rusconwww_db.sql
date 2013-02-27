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
-- Name: cmsplugin_contact; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_contact (
    cmsplugin_ptr_id integer NOT NULL,
    site_email character varying(75) NOT NULL,
    email_label character varying(100) NOT NULL,
    subject_label character varying(200) NOT NULL,
    content_label character varying(100) NOT NULL,
    thanks text NOT NULL,
    submit character varying(30) NOT NULL,
    spam_protection_method smallint NOT NULL,
    akismet_api_key character varying(255) NOT NULL,
    recaptcha_public_key character varying(255) NOT NULL,
    recaptcha_private_key character varying(255) NOT NULL,
    recaptcha_theme character varying(20) NOT NULL
);


ALTER TABLE public.cmsplugin_contact OWNER TO django_login;

--
-- Name: cmsplugin_customcontact; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_customcontact (
    cmsplugin_ptr_id integer NOT NULL,
    site_email character varying(75) NOT NULL,
    email_label character varying(100) NOT NULL,
    subject_label character varying(200) NOT NULL,
    content_label character varying(100) NOT NULL,
    thanks text NOT NULL,
    submit character varying(30) NOT NULL,
    spam_protection_method smallint NOT NULL,
    akismet_api_key character varying(255) NOT NULL,
    recaptcha_public_key character varying(255) NOT NULL,
    recaptcha_private_key character varying(255) NOT NULL,
    recaptcha_theme character varying(20) NOT NULL,
    name_label character varying(100) NOT NULL,
    phone_label character varying(30) NOT NULL,
    town_label character varying(30) NOT NULL
);


ALTER TABLE public.cmsplugin_customcontact OWNER TO django_login;

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
-- Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_filer_image_thumbnailoption (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    crop boolean NOT NULL,
    upscale boolean NOT NULL
);


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption OWNER TO django_login;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmsplugin_filer_image_thumbnailoption_id_seq OWNER TO django_login;

--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE cmsplugin_filer_image_thumbnailoption_id_seq OWNED BY cmsplugin_filer_image_thumbnailoption.id;


--
-- Name: cmsplugin_filerfolder; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_filerfolder (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255),
    view_option character varying(10) NOT NULL,
    folder_id integer NOT NULL
);


ALTER TABLE public.cmsplugin_filerfolder OWNER TO django_login;

--
-- Name: cmsplugin_filerimage; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_filerimage (
    cmsplugin_ptr_id integer NOT NULL,
    image_id integer,
    alt_text character varying(255),
    caption_text character varying(255),
    use_autoscale boolean NOT NULL,
    width integer,
    height integer,
    alignment character varying(10),
    free_link character varying(255),
    page_link_id integer,
    description text,
    image_url character varying(200),
    thumbnail_option_id integer,
    crop boolean NOT NULL,
    upscale boolean NOT NULL,
    original_link boolean NOT NULL,
    file_link_id integer,
    use_original_image boolean NOT NULL,
    target_blank boolean NOT NULL,
    CONSTRAINT cmsplugin_filerimage_height_check CHECK ((height >= 0)),
    CONSTRAINT cmsplugin_filerimage_width_check CHECK ((width >= 0))
);


ALTER TABLE public.cmsplugin_filerimage OWNER TO django_login;

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
-- Name: cmsplugin_teaser; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE cmsplugin_teaser (
    cmsplugin_ptr_id integer NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(100),
    page_link_id integer,
    url character varying(255),
    description text
);


ALTER TABLE public.cmsplugin_teaser OWNER TO django_login;

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
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE public.django_redirect OWNER TO django_login;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_redirect_id_seq OWNER TO django_login;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


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
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO django_login;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO django_login;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL,
    storage_hash character varying(40) NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO django_login;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO django_login;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: filer_clipboard; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_clipboard (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.filer_clipboard OWNER TO django_login;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE filer_clipboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboard_id_seq OWNER TO django_login;

--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE filer_clipboard_id_seq OWNED BY filer_clipboard.id;


--
-- Name: filer_clipboarditem; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_clipboarditem (
    id integer NOT NULL,
    file_id integer NOT NULL,
    clipboard_id integer NOT NULL
);


ALTER TABLE public.filer_clipboarditem OWNER TO django_login;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE filer_clipboarditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_clipboarditem_id_seq OWNER TO django_login;

--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE filer_clipboarditem_id_seq OWNED BY filer_clipboarditem.id;


--
-- Name: filer_file; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_file (
    id integer NOT NULL,
    folder_id integer,
    file character varying(255),
    _file_size integer,
    has_all_mandatory_data boolean NOT NULL,
    original_filename character varying(255),
    name character varying(255) NOT NULL,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    description text,
    is_public boolean NOT NULL,
    sha1 character varying(40) NOT NULL,
    polymorphic_ctype_id integer
);


ALTER TABLE public.filer_file OWNER TO django_login;

--
-- Name: filer_file_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE filer_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_file_id_seq OWNER TO django_login;

--
-- Name: filer_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE filer_file_id_seq OWNED BY filer_file.id;


--
-- Name: filer_folder; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_folder (
    id integer NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL,
    owner_id integer,
    uploaded_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    CONSTRAINT filer_folder_level_check CHECK ((level >= 0)),
    CONSTRAINT filer_folder_lft_check CHECK ((lft >= 0)),
    CONSTRAINT filer_folder_rght_check CHECK ((rght >= 0)),
    CONSTRAINT filer_folder_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.filer_folder OWNER TO django_login;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE filer_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folder_id_seq OWNER TO django_login;

--
-- Name: filer_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE filer_folder_id_seq OWNED BY filer_folder.id;


--
-- Name: filer_folderpermission; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_folderpermission (
    id integer NOT NULL,
    folder_id integer,
    type smallint NOT NULL,
    user_id integer,
    group_id integer,
    everybody boolean NOT NULL,
    can_edit smallint,
    can_read smallint,
    can_add_children smallint
);


ALTER TABLE public.filer_folderpermission OWNER TO django_login;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: django_login
--

CREATE SEQUENCE filer_folderpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filer_folderpermission_id_seq OWNER TO django_login;

--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django_login
--

ALTER SEQUENCE filer_folderpermission_id_seq OWNED BY filer_folderpermission.id;


--
-- Name: filer_image; Type: TABLE; Schema: public; Owner: django_login; Tablespace: 
--

CREATE TABLE filer_image (
    file_ptr_id integer NOT NULL,
    _height integer,
    _width integer,
    date_taken timestamp with time zone,
    default_alt_text character varying(255),
    default_caption character varying(255),
    author character varying(255),
    must_always_publish_author_credit boolean NOT NULL,
    must_always_publish_copyright boolean NOT NULL,
    subject_location character varying(64)
);


ALTER TABLE public.filer_image OWNER TO django_login;

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

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption ALTER COLUMN id SET DEFAULT nextval('cmsplugin_filer_image_thumbnailoption_id_seq'::regclass);


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

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_clipboard ALTER COLUMN id SET DEFAULT nextval('filer_clipboard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_clipboarditem ALTER COLUMN id SET DEFAULT nextval('filer_clipboarditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_file ALTER COLUMN id SET DEFAULT nextval('filer_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folder ALTER COLUMN id SET DEFAULT nextval('filer_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folderpermission ALTER COLUMN id SET DEFAULT nextval('filer_folderpermission_id_seq'::regclass);


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
126	Can add contact	41	add_contact
127	Can change contact	41	change_contact
128	Can delete contact	41	delete_contact
129	Can add source	42	add_source
130	Can change source	42	change_source
131	Can delete source	42	delete_source
132	Can add thumbnail	43	add_thumbnail
133	Can change thumbnail	43	change_thumbnail
134	Can delete thumbnail	43	delete_thumbnail
135	Can add custom contact	44	add_customcontact
136	Can change custom contact	44	change_customcontact
137	Can delete custom contact	44	delete_customcontact
138	Can add Folder	45	add_folder
139	Can change Folder	45	change_folder
140	Can delete Folder	45	delete_folder
141	Can use directory listing	45	can_use_directory_listing
142	Can add folder permission	46	add_folderpermission
143	Can change folder permission	46	change_folderpermission
144	Can delete folder permission	46	delete_folderpermission
145	Can add file	47	add_file
146	Can change file	47	change_file
147	Can delete file	47	delete_file
148	Can add clipboard	48	add_clipboard
149	Can change clipboard	48	change_clipboard
150	Can delete clipboard	48	delete_clipboard
151	Can add clipboard item	49	add_clipboarditem
152	Can change clipboard item	49	change_clipboarditem
153	Can delete clipboard item	49	delete_clipboarditem
154	Can add image	50	add_image
155	Can change image	50	change_image
156	Can delete image	50	delete_image
157	Can add filer folder	51	add_filerfolder
158	Can change filer folder	51	change_filerfolder
159	Can delete filer folder	51	delete_filerfolder
160	Can add filer image	52	add_filerimage
161	Can change filer image	52	change_filerimage
162	Can delete filer image	52	delete_filerimage
163	Can add thumbnail option	53	add_thumbnailoption
164	Can change thumbnail option	53	change_thumbnailoption
165	Can delete thumbnail option	53	delete_thumbnailoption
166	Can add teaser	54	add_teaser
167	Can change teaser	54	change_teaser
168	Can delete teaser	54	delete_teaser
169	Can add redirect	55	add_redirect
170	Can change redirect	55	change_redirect
171	Can delete redirect	55	delete_redirect
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('auth_permission_id_seq', 171, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	picasso	Павел	Саввин	it-support2@ruscon.gcs-group.ru	pbkdf2_sha256$10000$Vc4m0P0zmaeh$K7KjNdnSmJBQbBvLCQDCCEYbzjm39PpFhN+nVZ8gOQk=	t	t	t	2013-02-23 19:14:59.878944+04	2013-02-11 08:59:46+04
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
34	25	\N	0	ru	TextPlugin	2013-02-23 23:32:32.235755+04	2013-02-23 23:34:55.671876+04	0	1	2	29
32	25	\N	0	en	TextPlugin	2013-02-23 23:32:32.235755+04	2013-02-23 23:35:18.308068+04	0	1	2	27
36	25	\N	2	ru	CustomContactPlugin	2013-02-24 12:58:50.856891+04	2013-02-24 13:24:37.03875+04	0	1	2	30
37	25	\N	1	en	CustomContactPlugin	2013-02-24 14:18:34.279943+04	2013-02-24 14:19:21.020444+04	0	1	2	31
43	31	\N	1	ru	FilerGalleryPlugin	2013-02-24 22:17:51.709368+04	2013-02-24 22:23:11.769689+04	0	1	2	36
45	23	\N	1	ru	FilerImagePlugin	2013-02-27 10:08:10.300811+04	2013-02-27 10:09:32.0021+04	0	1	2	37
47	23	\N	1	en	FilerImagePlugin	2013-02-27 10:08:10.300811+04	2013-02-27 10:09:49.888993+04	0	1	2	39
48	34	\N	0	ru	CMSCategoryEntriesPlugin	2013-02-27 10:23:34.408615+04	2013-02-27 10:57:38.243293+04	0	1	2	40
49	35	\N	0	ru	CMSCategoryEntriesPlugin	2013-02-27 11:28:52.433137+04	2013-02-27 11:29:41.73888+04	0	1	2	41
50	41	\N	0	ru	TextPlugin	2013-02-27 13:54:39.356641+04	2013-02-27 13:55:10.222713+04	0	1	2	42
51	41	\N	1	ru	FilerImagePlugin	2013-02-27 13:55:43.772937+04	2013-02-27 13:57:00.09811+04	0	1	2	43
53	41	\N	1	en	FilerImagePlugin	2013-02-27 13:55:43.772937+04	2013-02-27 13:57:12.495267+04	0	1	2	45
52	41	\N	0	en	TextPlugin	2013-02-27 13:54:39.356641+04	2013-02-27 13:58:26.507586+04	0	1	2	44
54	43	\N	0	ru	TextPlugin	2013-02-27 14:01:27.803396+04	2013-02-27 14:01:34.851163+04	0	1	2	46
65	46	\N	0	ru	TextPlugin	2013-02-27 16:09:44.562937+04	2013-02-27 16:10:39.978942+04	0	1	2	56
64	37	\N	0	ru	TextPlugin	2013-02-27 15:58:26.570414+04	2013-02-27 16:10:44.437223+04	0	1	2	55
55	43	\N	0	en	TextPlugin	2013-02-27 14:01:27.803396+04	2013-02-27 14:03:52.79047+04	0	1	2	47
57	45	\N	0	ru	FilerImagePlugin	2013-02-27 14:34:24.824293+04	2013-02-27 14:37:57.328324+04	0	1	2	49
56	45	\N	1	ru	TextPlugin	2013-02-27 14:33:51.165988+04	2013-02-27 14:37:57.333991+04	0	1	2	48
59	45	\N	2	ru	FilerGalleryPlugin	2013-02-27 14:52:47.157282+04	2013-02-27 14:53:59.167166+04	0	1	2	50
61	45	\N	0	en	FilerImagePlugin	2013-02-27 14:34:24.824293+04	2013-02-27 14:54:44.27314+04	0	1	2	52
62	45	\N	2	en	FilerGalleryPlugin	2013-02-27 14:52:47.157282+04	2013-02-27 14:54:44.281917+04	0	1	2	53
66	37	\N	0	en	TextPlugin	2013-02-27 15:58:26.570414+04	2013-02-27 16:30:28.471913+04	0	1	2	57
60	45	\N	1	en	TextPlugin	2013-02-27 14:33:51.165988+04	2013-02-27 14:55:25.090741+04	0	1	2	51
67	46	\N	0	en	TextPlugin	2013-02-27 16:09:44.562937+04	2013-02-27 16:30:54.372211+04	0	1	2	58
68	34	\N	0	en	CMSCategoryEntriesPlugin	2013-02-27 10:23:34.408615+04	2013-02-27 16:33:34.085346+04	0	1	2	59
69	35	\N	0	en	CMSCategoryEntriesPlugin	2013-02-27 11:28:52.433137+04	2013-02-27 16:33:38.545332+04	0	1	2	60
70	29	\N	0	ru	FilerImagePlugin	2013-02-27 16:47:41.435036+04	2013-02-27 16:49:57.100128+04	0	1	2	61
\.


--
-- Name: cms_cmsplugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_cmsplugin_id_seq', 71, true);


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
17	picasso	picasso	2	2013-02-27 14:06:03.444308+04	2013-02-27 14:57:58.434217+04	2013-02-27 14:06:25.540786+04	\N	t	f	\N		t	INHERIT	1	0	1	8	9	2	f	\N	t	\N	1
13	picasso	picasso	\N	2013-02-27 11:41:00.677368+04	2013-02-27 16:30:56.030548+04	2013-02-27 11:41:16.466796+04	\N	t	f	logistic		t	page.html	1	0	0	1	2	3	f	\N	t	\N	1
1	picasso	picasso	\N	2013-02-11 09:28:39.70025+04	2013-02-27 16:33:41.69234+04	2013-02-11 09:32:25.525471+04	\N	t	f	\N		t	home.html	1	0	0	1	2	1	f	\N	t	\N	1
14	picasso	picasso	\N	2013-02-27 13:30:20.739314+04	2013-02-27 13:32:05.746079+04	2013-02-27 13:30:49.919374+04	\N	f	f	customs		t	page.html	1	0	0	1	2	7	f	\N	t	\N	1
10	picasso	picasso	2	2013-02-24 17:08:22.593049+04	2013-02-27 16:48:59.305245+04	2013-02-24 17:10:51.798718+04	\N	t	f	\N		t	INHERIT	1	0	1	14	17	2	f	\N	t	\N	1
8	picasso	picasso	2	2013-02-21 13:07:27.706385+04	2013-02-27 11:50:08.413541+04	2013-02-21 13:10:03.275317+04	\N	t	f	press-releases		t	INHERIT	1	0	1	10	11	2	f	\N	t	\N	1
11	picasso	picasso	10	2013-02-24 22:00:28.667304+04	2013-02-24 23:05:19.306493+04	2013-02-24 22:00:51.491762+04	\N	f	f	\N		t	INHERIT	1	0	2	15	16	2	f	\N	t	\N	1
3	picasso	picasso	\N	2013-02-15 11:42:24.135752+04	2013-02-22 08:47:00.19695+04	\N	\N	t	f	global_placeholder		f	global_placeholder.html	1	0	0	1	2	4	f	\N	t	\N	1
9	picasso	picasso	\N	2013-02-23 22:41:19.300663+04	2013-02-24 00:38:25.658768+04	2013-02-23 22:42:40.341665+04	\N	t	f	feedback		t	page.html	1	0	0	1	2	6	f	\N	t	\N	1
4	picasso	picasso	\N	2013-02-20 12:08:38.401493+04	2013-02-25 10:04:26.487+04	2013-02-20 12:20:50.227565+04	\N	f	f	zinnia		f	base.html	1	0	0	1	2	5	f	\N	t	\N	1
7	picasso	picasso	2	2013-02-21 12:29:49.894086+04	2013-02-27 10:09:58.09222+04	2013-02-21 12:30:05.301344+04	\N	t	f	\N		t	INHERIT	1	0	1	2	3	2	f	\N	t	\N	1
12	picasso	picasso	2	2013-02-27 08:48:37.419034+04	2013-02-27 11:26:33.729504+04	2013-02-27 08:50:49.4135+04	\N	t	f	news		t	INHERIT	1	0	1	12	13	2	f	\N	t	\N	1
15	picasso	picasso	2	2013-02-27 13:53:30.324192+04	2013-02-27 13:58:57.388663+04	2013-02-27 13:55:15.183469+04	\N	t	f	\N		t	INHERIT	1	0	1	4	5	2	f	\N	t	\N	1
2	picasso	picasso	\N	2013-02-12 11:34:09.471682+04	2013-02-25 09:58:12.301245+04	2013-02-12 11:34:24.973068+04	\N	t	f	company		t	page.html	1	0	0	1	18	2	f	\N	t	\N	1
16	picasso	picasso	2	2013-02-27 14:00:38.420569+04	2013-02-27 14:06:39.300884+04	2013-02-27 14:01:40.913849+04	\N	t	f	\N		t	INHERIT	1	0	1	6	7	2	f	\N	t	\N	1
\.


--
-- Name: cms_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_page_id_seq', 17, true);


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
24	9	24
25	9	25
26	8	26
27	8	27
28	10	28
29	10	29
30	11	30
31	11	31
32	12	32
33	12	33
34	1	34
35	1	35
36	13	36
37	13	37
38	14	38
39	14	39
40	15	40
41	15	41
42	16	42
43	16	43
44	17	44
45	17	45
46	13	46
47	10	47
\.


--
-- Name: cms_page_placeholders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_page_placeholders_id_seq', 47, true);


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
24	bigpromo-title	\N
25	page-content	\N
26	bigpromo-title	\N
27	page-content	\N
28	bigpromo-title	\N
29	page-content	\N
30	bigpromo-title	\N
31	page-content	\N
32	bigpromo-title	\N
33	page-content	\N
34	press-releases	\N
35	news	\N
36	bigpromo-title	\N
37	page-content	\N
38	bigpromo-title	\N
39	page-content	\N
40	bigpromo-title	\N
41	page-content	\N
42	bigpromo-title	\N
43	page-content	\N
44	bigpromo-title	\N
45	page-content	\N
46	custom-title	\N
47	custom-title	\N
\.


--
-- Name: cms_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_placeholder_id_seq', 47, true);


--
-- Data for Name: cms_title; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cms_title (id, language, title, menu_title, slug, path, has_url_overwrite, application_urls, redirect, meta_description, meta_keywords, page_title, page_id, creation_date) FROM stdin;
1	ru	Главная		home		f				Оля	Логис	1	2013-02-11 09:28:39.751702+04
5	ru	Global Placeholder		base	base	f						3	2013-02-15 11:42:24.19937+04
29	en	Liability		responsibility	about/responsibility	f	\N	\N				17	2013-02-27 14:55:51.80613+04
6	en	Global Placeholder		base	base	f						3	2013-02-15 11:43:09.520358+04
28	ru	Ответственность		responsibility	about/responsibility	f						17	2013-02-27 14:06:03.465353+04
17	en	Feedback		feedback	feedback	f						9	2013-02-23 22:42:14.56851+04
16	ru	Обратная связь		feedback	feedback	f						9	2013-02-23 22:41:19.333124+04
14	en	Press-Releases		press	about/press	f		/blog/categories/press-releases/				8	2013-02-21 13:09:27.786581+04
2	ru	Компания		about	about	f						2	2013-02-12 11:34:09.504639+04
12	ru	История		history	about/history	f						7	2013-02-21 12:29:49.904681+04
22	ru	Логистика		logistic	logistic	f						13	2013-02-27 11:41:00.697509+04
15	en	Background		history	about/history	f						7	2013-02-22 14:15:19.460375+04
4	en	Company		about	about	f						2	2013-02-12 12:21:31.564438+04
7	ru	Блог		blog	blog	f	ZinniaApphook					4	2013-02-20 12:08:38.62098+04
8	en	Zinnia		blog	blog	f	ZinniaApphook					4	2013-02-20 12:28:21.347387+04
30	en	Logistic		logistic	logistic	f						13	2013-02-27 15:21:01.319548+04
3	en	Home		home		f			123	logistic	123	1	2013-02-12 12:21:18.650103+04
20	ru	Новости рынка		news	about/news	f		/blog/categories/news/				12	2013-02-27 08:48:37.478702+04
21	en	Market news		news	about/news	f		/blog/categories/news/				12	2013-02-27 08:48:46.588626+04
19	ru	Припортовый терминал Новороссийск		terminal	about/gallery/terminal	f						11	2013-02-24 22:00:28.70162+04
18	ru	Фотогалерея		gallery	about/gallery	f						10	2013-02-24 17:08:22.629059+04
13	ru	Пресс-релизы		press	about/press	f		/blog/categories/press-releases/				8	2013-02-21 13:07:27.7157+04
23	ru	Таможенное оформление		customs	customs	f						14	2013-02-27 13:30:20.760957+04
24	ru	Офисы		offices	about/offices	f						15	2013-02-27 13:53:30.348733+04
25	en	Network		offices	about/offices	f						15	2013-02-27 13:54:14.69277+04
26	ru	Инновации		innovations	about/innovations	f						16	2013-02-27 14:00:38.444448+04
27	en	Innovation		innovations	about/innovations	f	\N	\N				16	2013-02-27 14:04:06.463909+04
\.


--
-- Name: cms_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cms_title_id_seq', 30, true);


--
-- Data for Name: cmsplugin_calendarentriesplugin; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_calendarentriesplugin (cmsplugin_ptr_id, year, month) FROM stdin;
\.


--
-- Data for Name: cmsplugin_contact; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_contact (cmsplugin_ptr_id, site_email, email_label, subject_label, content_label, thanks, submit, spam_protection_method, akismet_api_key, recaptcha_public_key, recaptcha_private_key, recaptcha_theme) FROM stdin;
\.


--
-- Data for Name: cmsplugin_customcontact; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_customcontact (cmsplugin_ptr_id, site_email, email_label, subject_label, content_label, thanks, submit, spam_protection_method, akismet_api_key, recaptcha_public_key, recaptcha_private_key, recaptcha_theme, name_label, phone_label, town_label) FROM stdin;
36	picasso75@yandex.ru	Еmail *	Тема	Вопрос *	<p>Спасибо за вопрос!</p>	Отправить	0				clean	Ваше имя *	Телефон	Город
37	picasso75@yandex.ru	Email *	Subject *	Question *	<p>Thank you!</p>	Submit	0				clean	Your name *	Phone	Town
\.


--
-- Data for Name: cmsplugin_file; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_file (cmsplugin_ptr_id, file, title) FROM stdin;
\.


--
-- Data for Name: cmsplugin_filer_image_thumbnailoption; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_filer_image_thumbnailoption (id, name, width, height, crop, upscale) FROM stdin;
\.


--
-- Name: cmsplugin_filer_image_thumbnailoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('cmsplugin_filer_image_thumbnailoption_id_seq', 1, false);


--
-- Data for Name: cmsplugin_filerfolder; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_filerfolder (cmsplugin_ptr_id, title, view_option, folder_id) FROM stdin;
43	Припортовый терминал Новороссийск	list	2
59		list	5
62		list	5
\.


--
-- Data for Name: cmsplugin_filerimage; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_filerimage (cmsplugin_ptr_id, image_id, alt_text, caption_text, use_autoscale, width, height, alignment, free_link, page_link_id, description, image_url, thumbnail_option_id, crop, upscale, original_link, file_link_id, use_original_image, target_blank) FROM stdin;
45	3			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f
47	3			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f
51	4			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f
53	4			f	\N	\N	\N		\N			\N	t	t	f	\N	f	f
57	5			f	\N	\N	left		\N			\N	t	t	f	\N	f	f
61	5			f	\N	\N	left		\N			\N	t	t	f	\N	f	f
70	12		Припортовый терминал Новороссийск	f	100	70	\N		11			\N	t	t	f	\N	f	f
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
48	2	5	includes/news_style.html
49	3	10	includes/news_style.html
68	2	5	includes/news_style.html
69	3	10	includes/news_style.html
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
-- Data for Name: cmsplugin_teaser; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY cmsplugin_teaser (cmsplugin_ptr_id, title, image, page_link_id, url, description) FROM stdin;
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
32	
34	<p>Нам очень важно Ваше мнение о нашей компании и предлагаемых ей услугах. Оставьте Ваши отклики и предложения в окне внизу – мы обязательно учтем их в нашей работе!</p>
50	<p>Сеть офисов Рускон охватывает основные порты и регионы России и ближнего зарубежья.</p>
52	<p>The network of Ruscon’s own offices today covers the main ports and inland regions of Russian and the FSU. More than 20 sub-agencies provide us with representation in the more remote parts of the country.</p>\n<p>Ruscon has had its own office in China since 2008 and is now developing sub-agencies in the main ports of the PRC and SE Asia.</p>
54	<p>\nРускон является признанным в России пионером внедрения современных технологий контейнеризации насыпных и наливных грузов.</p>\n<p>\nНачиная с 2004 года мы первыми в стране осуществляем затарку и отправку на экспорт зерна в контейнерах. Сегодня на базе собственного припортового комплекса в Новороссийске Рускон предлагает широкие возможности для загрузки в контейнеры практически всей номенклатуры российских экспортных грузов.</p>\n
66	<p>Ruscon today is a professional logistics operator dedicated to the care  of your goods. We offer quality services for containerised cargo including a wide network of offices, local logistics support and customs clearance. We pride ourselves on allowing you to create optimal supply chain solutions designed for your specific requirements.</p>
55	<p>\nRuscon is a noted pioneer and leader in the implementation of advanced containerisation technology for all kinds of bulk commodities in Russia.\n</p>\n<p>\nStarting in 2004, we introduced into Russia the technique of stuffing and shipping grains in containers. Our dedicated off-dock terminals in the port of Novorossiysk enable virtually all goods exported and imported to Russia to be containerised.\n</p>
56	<p>Ответственность Рускона, как транспортного оператора, а также оператора собственного авто и жд парка ,а также терминальных комплексов, застрахована ведущим клубом взаимного страхования международных перевозок TT Club.</p>
60	<p>Ruscon’s liability insurance and its risks as a transport operator as well as an operator of its own terminal facilities, trucks and railway wagons is provided by the TT Club - the London-based insurance mutual, which is the market leader in the provision of insurance and related risk management services.</p>
64	<p>Компания «Рускон» сегодня – это профессиональная логистика ваших товаров. Мы предлагаем качественный сервис по контейнеризации и международной доставке грузов. Выгодные условия по морским перевозкам, широкая сеть офисов, таможенное оформление и собственный автопарк позволяют создавать оптимальные схемы логистики для ваших грузов.</p>
65	Международные контейнерные перевозки
67	International container shipping
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
240	2013-02-26 11:07:25.2431+04	1	31	68	: draft	3	
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
123	2013-02-23 22:41:19.35412+04	1	10	9	Обратная связь	1	
124	2013-02-23 22:42:14.587903+04	1	10	9	Обратная связь	2	Изменен title,slug,language и moderator_state.
125	2013-02-23 22:42:20.537241+04	1	10	9	Обратная связь	2	Изменен slug и moderator_state.
126	2013-02-23 23:32:56.787566+04	1	10	9	Feedback	2	Изменен language и moderator_state.
127	2013-02-24 00:38:25.689256+04	1	10	9	Обратная связь	2	Изменен reverse_id и moderator_state.
128	2013-02-24 11:21:27.919232+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен image.
129	2013-02-24 14:22:05.493239+04	1	10	8	Редирект	2	Изменен title,slug и moderator_state.
130	2013-02-24 14:22:16.304998+04	1	10	8	Redirect	2	Изменен title,slug,language и moderator_state.
131	2013-02-24 15:01:18.253842+04	1	10	8	Пресс-релизы	2	Изменен overwrite_url,redirect и moderator_state.
132	2013-02-24 15:01:34.932197+04	1	10	8	Press-Releases	2	Изменен language и moderator_state.
133	2013-02-24 15:02:32.757965+04	1	10	8	Пресс-релизы	2	Изменен redirect и moderator_state.
134	2013-02-24 15:09:05.836518+04	1	10	8	Пресс-релизы	2	Изменен overwrite_url и moderator_state.
135	2013-02-24 15:09:36.487727+04	1	10	8	Press-Releases	2	Изменен overwrite_url,language и moderator_state.
136	2013-02-24 17:08:22.643323+04	1	10	10	Фотогалерея	1	
137	2013-02-24 17:10:27.093003+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
138	2013-02-24 17:19:47.820211+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
139	2013-02-24 19:30:10.778737+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
140	2013-02-24 21:52:54.98417+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
141	2013-02-24 22:00:28.714579+04	1	10	11	Припортовый терминал Новороссийск	1	
142	2013-02-24 22:01:19.075945+04	1	10	11	Припортовый терминал Новороссийск	2	Изменен moderator_state.
143	2013-02-24 22:18:12.005389+04	1	10	11	Припортовый терминал Новороссийск	2	Изменен moderator_state.
144	2013-02-24 23:05:19.342638+04	1	10	11	Припортовый терминал Новороссийск	2	Изменен moderator_state.
145	2013-02-25 09:24:56.390034+04	1	10	4	Zinnia	2	Изменен title и moderator_state.
146	2013-02-25 09:39:56.784588+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен tags.
147	2013-02-25 09:41:08.614749+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен tags.
148	2013-02-25 09:58:06.013544+04	1	10	2	Компания	2	Изменен slug и moderator_state.
149	2013-02-25 09:58:12.382673+04	1	10	2	Company	2	Изменен slug,language и moderator_state.
150	2013-02-25 10:04:21.078595+04	1	10	4	Блог	2	Изменен slug и moderator_state.
151	2013-02-25 10:04:26.508698+04	1	10	4	Zinnia	2	Изменен slug,language и moderator_state.
152	2013-02-25 10:11:39.182383+04	1	10	8	Пресс-релизы	2	Изменен overwrite_url,redirect и moderator_state.
153	2013-02-25 10:11:50.869994+04	1	10	8	Press-Releases	2	Изменен overwrite_url,redirect,language и moderator_state.
154	2013-02-25 10:18:18.933107+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
155	2013-02-25 10:18:47.251129+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
156	2013-02-25 10:19:17.936684+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
157	2013-02-25 10:20:32.710625+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен excerpt_ru.
158	2013-02-25 10:21:41.659235+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен excerpt_ru.
159	2013-02-25 10:22:28.690172+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен excerpt_en.
160	2013-02-25 10:24:06.879596+04	1	31	1	First: published	2	Changed excerpt_ru.
161	2013-02-25 10:29:53.550415+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
162	2013-02-25 10:30:54.925577+04	1	31	4	555: draft	1	
163	2013-02-25 10:31:19.002955+04	1	31	4	555: draft	2	Изменен excerpt_ru.
164	2013-02-25 10:32:00.890395+04	1	31	4	555: draft	3	
165	2013-02-25 10:32:20.281241+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: draft	2	Изменен status.
166	2013-02-25 10:32:50.023081+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: draft	2	Изменен excerpt_ru.
167	2013-02-25 10:32:59.305452+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен status.
168	2013-02-25 10:33:33.238884+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
169	2013-02-25 10:33:53.09368+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: draft	2	Изменен status.
170	2013-02-25 10:34:03.817083+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: draft	2	Изменен excerpt_ru.
171	2013-02-25 10:34:11.986403+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: draft	2	Ни одно поле не изменено.
241	2013-02-26 11:07:25.247871+04	1	31	67	: draft	3	
242	2013-02-26 11:07:25.250315+04	1	31	66	: draft	3	
172	2013-02-25 10:34:28.681266+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен status.
173	2013-02-25 10:34:51.132259+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_en.
174	2013-02-25 10:56:39.668306+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
175	2013-02-25 11:08:13.234064+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен tags.
176	2013-02-25 11:10:00.243998+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен tags.
177	2013-02-25 13:04:34.580081+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен content_ru.
178	2013-02-25 13:07:57.357815+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен content_en.
179	2013-02-25 13:16:16.607193+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Ни одно поле не изменено.
180	2013-02-25 13:48:09.569025+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен image.
181	2013-02-25 14:18:45.314128+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
182	2013-02-25 14:19:02.485474+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен excerpt_ru.
183	2013-02-25 14:34:13.759359+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	2	Изменен content_en.
184	2013-02-25 15:36:43.497945+04	1	55	1	/blog/categories/press-releases/ ---> /	1	
185	2013-02-25 15:37:18.754597+04	1	55	1	/blog/categories/press-releases/ ---> /	3	
186	2013-02-25 15:59:21.725443+04	1	31	2	Rus: published	2	Changed content_en.
187	2013-02-26 08:47:03.056365+04	1	10	8	Пресс-релизы	2	Изменен redirect и moderator_state.
188	2013-02-26 11:07:25.097445+04	1	31	2	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea: опубликован	3	
189	2013-02-26 11:07:25.134287+04	1	31	130	: draft	3	
190	2013-02-26 11:07:25.141137+04	1	31	1	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	3	
191	2013-02-26 11:07:25.143182+04	1	31	129	: draft	3	
192	2013-02-26 11:07:25.144598+04	1	31	128	: draft	3	
193	2013-02-26 11:07:25.146375+04	1	31	127	: draft	3	
194	2013-02-26 11:07:25.148211+04	1	31	126	: draft	3	
195	2013-02-26 11:07:25.149978+04	1	31	123	: draft	3	
196	2013-02-26 11:07:25.151832+04	1	31	125	: draft	3	
197	2013-02-26 11:07:25.154108+04	1	31	124	: draft	3	
198	2013-02-26 11:07:25.155858+04	1	31	122	: draft	3	
199	2013-02-26 11:07:25.157541+04	1	31	121	: draft	3	
200	2013-02-26 11:07:25.159373+04	1	31	120	: draft	3	
201	2013-02-26 11:07:25.161178+04	1	31	119	: draft	3	
202	2013-02-26 11:07:25.163536+04	1	31	118	: draft	3	
203	2013-02-26 11:07:25.165082+04	1	31	117	: draft	3	
204	2013-02-26 11:07:25.166784+04	1	31	116	: draft	3	
205	2013-02-26 11:07:25.168415+04	1	31	115	: draft	3	
206	2013-02-26 11:07:25.170494+04	1	31	114	: draft	3	
207	2013-02-26 11:07:25.173163+04	1	31	101	: draft	3	
208	2013-02-26 11:07:25.175414+04	1	31	100	: draft	3	
209	2013-02-26 11:07:25.177305+04	1	31	99	: draft	3	
210	2013-02-26 11:07:25.179032+04	1	31	98	: draft	3	
211	2013-02-26 11:07:25.180779+04	1	31	97	: draft	3	
212	2013-02-26 11:07:25.182677+04	1	31	96	: draft	3	
213	2013-02-26 11:07:25.184623+04	1	31	94	: draft	3	
214	2013-02-26 11:07:25.186292+04	1	31	93	: draft	3	
215	2013-02-26 11:07:25.188175+04	1	31	95	: draft	3	
216	2013-02-26 11:07:25.190049+04	1	31	92	: draft	3	
217	2013-02-26 11:07:25.191821+04	1	31	91	: draft	3	
218	2013-02-26 11:07:25.19348+04	1	31	90	: draft	3	
219	2013-02-26 11:07:25.195362+04	1	31	89	: draft	3	
220	2013-02-26 11:07:25.197792+04	1	31	88	: draft	3	
221	2013-02-26 11:07:25.199497+04	1	31	87	: draft	3	
222	2013-02-26 11:07:25.201089+04	1	31	86	: draft	3	
223	2013-02-26 11:07:25.203365+04	1	31	85	: draft	3	
224	2013-02-26 11:07:25.204907+04	1	31	84	: draft	3	
225	2013-02-26 11:07:25.210297+04	1	31	83	: draft	3	
226	2013-02-26 11:07:25.212697+04	1	31	77	: draft	3	
227	2013-02-26 11:07:25.21432+04	1	31	80	: draft	3	
228	2013-02-26 11:07:25.215967+04	1	31	81	: draft	3	
229	2013-02-26 11:07:25.218246+04	1	31	79	: draft	3	
230	2013-02-26 11:07:25.220301+04	1	31	78	: draft	3	
231	2013-02-26 11:07:25.2219+04	1	31	75	: draft	3	
232	2013-02-26 11:07:25.223504+04	1	31	82	: draft	3	
233	2013-02-26 11:07:25.226285+04	1	31	76	: draft	3	
234	2013-02-26 11:07:25.228082+04	1	31	74	: draft	3	
235	2013-02-26 11:07:25.229505+04	1	31	73	: draft	3	
236	2013-02-26 11:07:25.232275+04	1	31	72	: draft	3	
237	2013-02-26 11:07:25.234054+04	1	31	71	: draft	3	
238	2013-02-26 11:07:25.235664+04	1	31	70	: draft	3	
239	2013-02-26 11:07:25.241238+04	1	31	69	: draft	3	
243	2013-02-26 11:07:25.252104+04	1	31	65	: draft	3	
244	2013-02-26 11:07:25.253748+04	1	31	64	: draft	3	
245	2013-02-26 11:07:25.255806+04	1	31	63	: draft	3	
246	2013-02-26 11:07:25.257634+04	1	31	62	: draft	3	
247	2013-02-26 11:07:25.259257+04	1	31	13	: draft	3	
248	2013-02-26 11:07:25.262264+04	1	31	61	: draft	3	
249	2013-02-26 11:07:25.264225+04	1	31	60	: draft	3	
250	2013-02-26 11:07:25.265941+04	1	31	59	: draft	3	
251	2013-02-26 11:07:25.269268+04	1	31	58	: draft	3	
252	2013-02-26 11:07:25.270991+04	1	31	57	: draft	3	
253	2013-02-26 11:07:25.272666+04	1	31	55	: draft	3	
254	2013-02-26 11:07:25.274678+04	1	31	54	: draft	3	
255	2013-02-26 11:07:25.276422+04	1	31	53	: draft	3	
256	2013-02-26 11:07:25.278273+04	1	31	56	: draft	3	
257	2013-02-26 11:07:25.280007+04	1	31	52	: draft	3	
258	2013-02-26 11:07:25.28179+04	1	31	51	: draft	3	
259	2013-02-26 11:07:25.283536+04	1	31	50	: draft	3	
260	2013-02-26 11:07:25.285879+04	1	31	49	: draft	3	
261	2013-02-26 11:07:25.287791+04	1	31	48	: draft	3	
262	2013-02-26 11:07:25.28969+04	1	31	47	: draft	3	
263	2013-02-26 11:07:25.291234+04	1	31	46	: draft	3	
264	2013-02-26 11:07:25.293043+04	1	31	45	: draft	3	
265	2013-02-26 11:07:25.295222+04	1	31	40	: draft	3	
266	2013-02-26 11:07:25.296655+04	1	31	43	: draft	3	
267	2013-02-26 11:07:25.29901+04	1	31	41	: draft	3	
268	2013-02-26 11:07:25.300684+04	1	31	39	: draft	3	
269	2013-02-26 11:07:25.302291+04	1	31	42	: draft	3	
270	2013-02-26 11:07:25.303809+04	1	31	37	: draft	3	
271	2013-02-26 11:07:25.305427+04	1	31	38	: draft	3	
272	2013-02-26 11:07:25.307114+04	1	31	44	: draft	3	
273	2013-02-26 11:07:25.310392+04	1	31	36	: draft	3	
274	2013-02-26 11:07:25.312797+04	1	31	35	: draft	3	
275	2013-02-26 11:07:25.314838+04	1	31	34	: draft	3	
276	2013-02-26 11:07:25.316652+04	1	31	33	: draft	3	
277	2013-02-26 11:07:25.318818+04	1	31	32	: draft	3	
278	2013-02-26 11:07:25.32081+04	1	31	31	: draft	3	
279	2013-02-26 11:07:25.322464+04	1	31	29	: draft	3	
280	2013-02-26 11:07:25.32417+04	1	31	30	: draft	3	
281	2013-02-26 11:07:25.325923+04	1	31	27	: draft	3	
282	2013-02-26 11:07:25.327639+04	1	31	28	: draft	3	
283	2013-02-26 11:07:25.329352+04	1	31	24	: draft	3	
284	2013-02-26 11:07:25.331419+04	1	31	23	: draft	3	
285	2013-02-26 11:07:25.333991+04	1	31	21	: draft	3	
286	2013-02-26 11:07:25.335622+04	1	31	26	: draft	3	
287	2013-02-26 11:07:25.337201+04	1	31	25	: draft	3	
288	2013-02-26 11:07:35.490025+04	1	31	22	: draft	3	
289	2013-02-26 11:07:35.496423+04	1	31	113	: draft	3	
290	2013-02-26 11:07:35.500691+04	1	31	112	: draft	3	
291	2013-02-26 11:07:35.506221+04	1	31	111	: draft	3	
292	2013-02-26 11:07:35.50977+04	1	31	110	: draft	3	
293	2013-02-26 11:07:35.514058+04	1	31	109	: draft	3	
294	2013-02-26 11:07:35.517474+04	1	31	108	: draft	3	
295	2013-02-26 11:07:35.523631+04	1	31	107	: draft	3	
296	2013-02-26 11:07:35.527866+04	1	31	106	: draft	3	
297	2013-02-26 11:07:35.532892+04	1	31	105	: draft	3	
298	2013-02-26 11:07:35.53672+04	1	31	104	: draft	3	
299	2013-02-26 11:07:35.557807+04	1	31	103	: draft	3	
300	2013-02-26 11:07:35.559824+04	1	31	102	: draft	3	
301	2013-02-26 11:07:35.56111+04	1	31	20	: draft	3	
302	2013-02-26 11:07:35.563559+04	1	31	19	: draft	3	
303	2013-02-26 11:07:35.565083+04	1	31	18	: draft	3	
304	2013-02-26 11:07:35.566746+04	1	31	17	: draft	3	
305	2013-02-26 11:07:35.568211+04	1	31	16	: draft	3	
306	2013-02-26 11:07:35.569813+04	1	31	15	: draft	3	
307	2013-02-26 11:07:35.572662+04	1	31	14	: draft	3	
308	2013-02-26 11:07:35.574746+04	1	31	12	: draft	3	
309	2013-02-26 11:07:35.576255+04	1	31	11	: draft	3	
310	2013-02-26 11:07:35.578456+04	1	31	10	: draft	3	
311	2013-02-26 11:07:35.579863+04	1	31	9	: draft	3	
312	2013-02-26 11:07:35.581463+04	1	31	8	: draft	3	
313	2013-02-26 11:07:35.583075+04	1	31	7	: draft	3	
314	2013-02-26 11:07:35.584767+04	1	31	6	: draft	3	
315	2013-02-26 11:07:35.586835+04	1	31	5	: опубликован	3	
316	2013-02-26 11:15:25.581434+04	1	31	237	Контейнеризация в металлургии: опубликован	2	Изменен content_ru,excerpt_ru,sites и slug.
317	2013-02-26 15:16:11.876889+04	1	10	8	Press-Releases	2	Изменен redirect,language и moderator_state.
318	2013-02-26 15:18:18.904482+04	1	10	8	Пресс-релизы	2	Изменен overwrite_url и moderator_state.
319	2013-02-26 15:18:33.322104+04	1	10	8	Press-Releases	2	Изменен overwrite_url,language и moderator_state.
320	2013-02-26 16:31:31.710268+04	1	32	3	Новости	1	
321	2013-02-26 16:33:23.544234+04	1	10	8	Пресс-релизы	2	Изменен overwrite_url,redirect и moderator_state.
322	2013-02-26 16:33:39.738188+04	1	10	8	Press-Releases	2	Изменен overwrite_url,redirect,language и moderator_state.
323	2013-02-26 16:37:29.939745+04	1	31	1808	Hapag-Lloyd запускает новый фидер на Финский залив: опубликован	2	Изменен content_ru,content_en,excerpt_ru и excerpt_en.
324	2013-02-26 16:39:04.800726+04	1	31	1809	Проба: draft	1	
325	2013-02-26 16:39:29.547898+04	1	31	1809	Проба: опубликован	2	Изменен status.
326	2013-02-26 16:47:37.422825+04	1	10	8	Пресс-релизы	2	Изменен redirect и moderator_state.
327	2013-02-27 08:47:48.431921+04	1	31	1809	Проба: опубликован	3	
328	2013-02-27 08:48:37.491986+04	1	10	12	Новости	1	
329	2013-02-27 08:48:46.597157+04	1	10	12	Новости	2	Изменен title,slug,language и moderator_state.
330	2013-02-27 08:50:49.441207+04	1	10	12	Новости	2	Изменен published,in_navigation и moderator_state.
331	2013-02-27 08:54:52.748221+04	1	10	12	Новости	2	Изменен reverse_id и moderator_state.
332	2013-02-27 09:03:10.207154+04	1	10	12	Новости	2	Изменен redirect и moderator_state.
333	2013-02-27 09:52:48.867936+04	1	31	1815	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве: опубликован	2	Изменен content_ru,status и excerpt_ru.
334	2013-02-27 09:55:12.101953+04	1	10	8	Press-Releases	2	Изменен redirect,language и moderator_state.
335	2013-02-27 09:55:29.018715+04	1	10	12	News	2	Изменен redirect,language и moderator_state.
336	2013-02-27 10:05:11.874472+04	1	10	7	History	2	Изменен title,language и moderator_state.
337	2013-02-27 10:09:58.11797+04	1	10	7	Background	2	Изменен language и moderator_state.
338	2013-02-27 11:16:04.66285+04	1	10	8	Пресс-релизы	2	Изменен reverse_id и moderator_state.
339	2013-02-27 11:26:04.540385+04	1	10	12	Новости	2	Изменен title и moderator_state.
340	2013-02-27 11:26:33.75534+04	1	10	12	News	2	Изменен title,language и moderator_state.
341	2013-02-27 11:41:00.70756+04	1	10	13	Логистика	1	
342	2013-02-27 11:50:08.43848+04	1	10	8	Пресс-релизы	2	Изменен reverse_id и moderator_state.
343	2013-02-27 13:23:18.257054+04	1	10	13	Логистика	2	Изменен reverse_id и moderator_state.
344	2013-02-27 13:30:20.771866+04	1	10	14	Таможенное оформление	1	
345	2013-02-27 13:30:49.949018+04	1	10	14	Таможенное оформление	2	Изменен published и moderator_state.
346	2013-02-27 13:32:05.771891+04	1	10	14	Таможенное оформление	2	Изменен slug,reverse_id и moderator_state.
347	2013-02-27 13:53:30.355582+04	1	10	15	Офисы	1	
348	2013-02-27 13:54:14.700904+04	1	10	15	Офисы	2	Изменен title,slug,language и moderator_state.
349	2013-02-27 13:55:15.211491+04	1	10	15	Офисы	2	Изменен published,in_navigation и moderator_state.
350	2013-02-27 13:58:29.417365+04	1	10	15	Offices	2	Изменен language и moderator_state.
351	2013-02-27 13:58:57.421242+04	1	10	15	Offices	2	Изменен title,language и moderator_state.
352	2013-02-27 14:00:38.451236+04	1	10	16	innovations	1	
353	2013-02-27 14:00:47.006635+04	1	10	16	innovations	2	Изменен title и moderator_state.
354	2013-02-27 14:01:40.947197+04	1	10	16	Инновации	2	Изменен published,in_navigation и moderator_state.
355	2013-02-27 14:04:06.471309+04	1	10	16	Инновации	2	Изменен title,slug,language и moderator_state.
356	2013-02-27 14:06:03.472831+04	1	10	17	responsibility	1	
357	2013-02-27 14:06:17.791079+04	1	10	17	responsibility	2	Изменен title и moderator_state.
358	2013-02-27 14:06:25.573708+04	1	10	17	Ответственность	2	Изменен published,in_navigation и moderator_state.
359	2013-02-27 14:37:59.866302+04	1	10	17	Ответственность	2	Изменен moderator_state.
360	2013-02-27 14:55:51.813458+04	1	10	17	Ответственность	2	Изменен title,slug,language и moderator_state.
361	2013-02-27 14:57:58.459803+04	1	10	17	Ответственность	2	Изменен moderator_state.
362	2013-02-27 15:21:01.330631+04	1	10	13	Логистика	2	Изменен title,slug,language и moderator_state.
363	2013-02-27 15:48:49.656219+04	1	10	13	Логистика	2	Изменен moderator_state.
364	2013-02-27 15:59:07.794113+04	1	10	13	Логистика	2	Изменен moderator_state.
365	2013-02-27 16:09:59.703232+04	1	10	13	Логистика	2	Изменен moderator_state.
366	2013-02-27 16:10:45.924+04	1	10	13	Логистика	2	Изменен moderator_state.
367	2013-02-27 16:30:56.060267+04	1	10	13	Logistic	2	Изменен language и moderator_state.
368	2013-02-27 16:33:41.736001+04	1	10	1	Home	2	Изменен language и moderator_state.
369	2013-02-27 16:43:05.242442+04	1	47	2	21012012103.jpg	3	
370	2013-02-27 16:43:07.303502+04	1	47	1	ёлки.jpg	3	
371	2013-02-27 16:46:26.314555+04	1	50	12	4.jpg	2	Изменен subject_location.
372	2013-02-27 16:48:03.493957+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
373	2013-02-27 16:48:59.344214+04	1	10	10	Фотогалерея	2	Изменен moderator_state.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 373, true);


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
41	contact	cmsplugin_contact	contact
42	source	easy_thumbnails	source
43	thumbnail	easy_thumbnails	thumbnail
44	custom contact	cms_helper	customcontact
45	Folder	filer	folder
46	folder permission	filer	folderpermission
47	file	filer	file
48	clipboard	filer	clipboard
49	clipboard item	filer	clipboarditem
50	image	filer	image
51	filer folder	cmsplugin_filer_folder	filerfolder
52	filer image	cmsplugin_filer_image	filerimage
53	thumbnail option	cmsplugin_filer_image	thumbnailoption
54	teaser	teaser	teaser
55	redirect	redirects	redirect
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_content_type_id_seq', 55, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
19830519c5fcbf5a6bab7b52baf16846	NzE1ZmYxN2Q2MzE2M2JhOTgxZjhhOTNhZjcyZjdkMzA1NmMwZDllNDqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlSwFVDV9hdXRoX3VzZXJfaWRLAVUUZmlsZXJfbGFzdF9mb2xkZXJfaWRYAQAAADJVEl9h\ndXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tl\nbmRVCV9tZXNzYWdlc11xAihjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1l\nc3NhZ2UKcQMpgXEEfXEFKFUKZXh0cmFfdGFnc3EGWAAAAABVB21lc3NhZ2VxB1ifAAAAdGV4dCAi\n0J3QsNC8INC+0YfQtdC90Ywg0LLQsNC20L3QviAuLi4uLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCw\nINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuVQVsZXZlbHEISxR1YmgDKYFx\nCX1xCihoBlgAAAAAaAdYQQAAANGB0YLRgNCw0L3QuNGG0LAgIkZlZWRiYWNrIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXELfXEMKGgGWAAAAABoB1idAAAA\ndGV4dCAi0J3QsNC8INC+0YfQtdC90Ywg0LLQsNC20L3QviAuLi4uLi4iINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+\n0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxDX1x\nDihoBlgAAAAAaAdYfQAAAHRleHQgIi4uLiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC1\n0L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC\n0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEPfXEQKGgGWAAAAABoB1hUAAAA\n0YHRgtGA0LDQvdC40YbQsCAi0J7QsdGA0LDRgtC90LDRjyDRgdCy0Y/Qt9GMIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXERfXESKGgGWAAAAABoB1gVAQAA\n0LfQsNC/0LjRgdGMICLQk9Ca0KEv0KDRg9GB0LrQvtC9INC30LDQv9GD0YHRgtC40Lsg0YDQtdCz\n0YPQu9GP0YDQvdGL0Lkg0LrQvtC90YLQtdC50L3QtdGA0L3Ri9C5INC/0L7QtdC30LQg0LzQtdC2\n0LTRgyDQv9C+0YDRgtC+0Lwg0KPRgdGC0Ywt0JvRg9Cz0LAg0Lgg0J3QuNC20L3QuNC8INCd0L7Q\nstCz0L7RgNC+0LTQvtC8INC00LvRjyBHZW5lcmFsIE1vdG9ycyBLb3JlYTog0L7Qv9GD0LHQu9C4\n0LrQvtCy0LDQvSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgD\nKYFxE31xFChoBlgAAAAAaAdYmQAAAGN1c3RvbSBjb250YWN0ICJwaWNhc3NvNzVAeWFuZGV4LnJ1\nIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQ\nvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDR\ngtGMLmgISxR1YmgDKYFxFX1xFihoBlgAAAAAaAdYlwAAAGN1c3RvbSBjb250YWN0ICJwaWNhc3Nv\nNzVAeWFuZGV4LnJ1IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQ\nuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcRd9cRgoaAZYAAAAAGgHWJcAAABjdXN0b20gY29udGFj\ndCAicGljYXNzbzc1QHlhbmRleC5ydSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3Q\ntdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQ\ntdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEZfXEaKGgGWAAAAABoB1iZAAAAY3Vz\ndG9tIGNvbnRhY3QgInBpY2Fzc283NUB5YW5kZXgucnUiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQ\ntNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC1\n0LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEbfXEcKGgGWAAA\nAABoB1hJAAAA0YHRgtGA0LDQvdC40YbQsCAi0KDQtdC00LjRgNC10LrRgiIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxHX1xHihoBlgAAAAAaAdYQQAAANGB\n0YLRgNCw0L3QuNGG0LAgIlJlZGlyZWN0IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQ\nvdC10L0uaAhLFHViaAMpgXEffXEgKGgGWAAAAABoB1hQAAAA0YHRgtGA0LDQvdC40YbQsCAi0J/R\ngNC10YHRgS3RgNC10LvQuNC30YsiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQ\nvS5oCEsUdWJoAymBcSF9cSIoaAZYAAAAAGgHWEcAAADRgdGC0YDQsNC90LjRhtCwICJQcmVzcy1S\nZWxlYXNlcyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFx\nI31xJChoBlgAAAAAaAdYUAAAANGB0YLRgNCw0L3QuNGG0LAgItCf0YDQtdGB0YEt0YDQtdC70LjQ\nt9GLIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXElfXEm\nKGgGWAAAAABoB1hQAAAA0YHRgtGA0LDQvdC40YbQsCAi0J/RgNC10YHRgS3RgNC10LvQuNC30Ysi\nINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5oCEsUdWJoAymBcSd9cSgoaAZY\nAAAAAGgHWEcAAADRgdGC0YDQsNC90LjRhtCwICJQcmVzcy1SZWxlYXNlcyIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxKX1xKihoBlgAAAAAaAdYngAAANGB\n0YLRgNCw0L3QuNGG0LAgItCk0L7RgtC+0LPQsNC70LXRgNC10Y8iINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7Q\nstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXErfXEs\nKGgGWAAAAABoB1jEAAAAZmlsZXIgZm9sZGVyICLQn9GA0LjQv9C+0YDRgtC+0LLRi9C5INGC0LXR\ngNC80LjQvdCw0Lsg0J3QvtCy0L7RgNC+0YHRgdC40LnRgdC6IiDQsdGL0Lsg0YPRgdC/0LXRiNC9\n0L4g0LTQvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQ\nsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxLX1xLiho\nBlgAAAAAaAdYxAAAAGZpbGVyIGZvbGRlciAi0J/RgNC40L/QvtGA0YLQvtCy0YvQuSDRgtC10YDQ\nvNC40L3QsNC7INCd0L7QstC+0YDQvtGB0YHQuNC50YHQuiIg0LHRi9C7INGD0YHQv9C10YjQvdC+\nINC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg\n0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcS99cTAoaAZY\nAAAAAGgHWE8AAADRgdGC0YDQsNC90LjRhtCwICLQpNC+0YLQvtCz0LDQu9C10YDQtdGPIiDQsdGL\n0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXExfXEyKGgGWAAAAABo\nB1iOAAAAcGljdHVyZSAiMjEwMTIwMTIxMDMuanBnIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQ\nvtCx0LDQstC70LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz\n0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxM31xNChoBlgAAAAA\naAdYTwAAANGB0YLRgNCw0L3QuNGG0LAgItCk0L7RgtC+0LPQsNC70LXRgNC10Y8iINCx0YvQuyDR\ng9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS5oCEsUdWJoAymBcTV9cTYoaAZYAAAAAGgHWKUA\nAADQuNC30L7QsdGA0LDQttC10L3QuNC1IChmaWxlcikgIjIxMDEyMDEyMTAzLmpwZyIg0LHRi9C7\nINGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXR\ngtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5oCEsU\ndWJoAymBcTd9cTgoaAZYAAAAAGgHWE8AAADRgdGC0YDQsNC90LjRhtCwICLQpNC+0YLQvtCz0LDQ\nu9C10YDQtdGPIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhLFHViaAMp\ngXE5fXE6KGgGWAAAAABoB1ijAAAA0LjQt9C+0LHRgNCw0LbQtdC90LjQtSAoZmlsZXIpICIyMTAx\nMjAxMjEwMy5qcGciINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC2\n0LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC4\n0YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxO31xPChoBlgAAAAAaAdYTwAAANGB0YLRgNCw0L3QuNGG\n0LAgItCk0L7RgtC+0LPQsNC70LXRgNC10Y8iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQ\ntdC90LXQvS5oCEsUdWJoAymBcT19cT4oaAZYAAAAAGgHWHsAAADRgdGC0YDQsNC90LjRhtCwICLQ\nn9GA0LjQv9C+0YDRgtC+0LLRi9C5INGC0LXRgNC80LjQvdCw0Lsg0J3QvtCy0L7RgNC+0YHRgdC4\n0LnRgdC6IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LTQvtCx0LDQstC70LXQvS5oCEsUdWJoAymB\ncT99cUAoaAZYAAAAAGgHWMQAAABmaWxlciBmb2xkZXIgItCf0YDQuNC/0L7RgNGC0L7QstGL0Lkg\n0YLQtdGA0LzQuNC90LDQuyDQndC+0LLQvtGA0L7RgdGB0LjQudGB0LoiINCx0YvQuyDRg9GB0L/Q\ntdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC9\n0L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXFB\nfXFCKGgGWAAAAABoB1h5AAAA0YHRgtGA0LDQvdC40YbQsCAi0J/RgNC40L/QvtGA0YLQvtCy0YvQ\nuSDRgtC10YDQvNC40L3QsNC7INCd0L7QstC+0YDQvtGB0YHQuNC50YHQuiIg0LHRi9C7INGD0YHQ\nv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxQ31xRChoBlgAAAAAaAdYowAAANC4\n0LfQvtCx0YDQsNC20LXQvdC40LUgKGZpbGVyKSAiMjEwMTIwMTIxMDMuanBnIiDQsdGL0Lsg0YPR\ngdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB\n0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymB\ncUV9cUYoaAZYAAAAAGgHWIgAAABmaWxlciBmb2xkZXIgIk9MT0wiINCx0YvQuyDRg9GB0L/QtdGI\n0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7Q\nstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXFHfXFI\nKGgGWAAAAABoB1h5AAAA0YHRgtGA0LDQvdC40YbQsCAi0J/RgNC40L/QvtGA0YLQvtCy0YvQuSDR\ngtC10YDQvNC40L3QsNC7INCd0L7QstC+0YDQvtGB0YHQuNC50YHQuiIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxSX1xSihoBlgAAAAAaAdYwgAAAGZpbGVy\nIGZvbGRlciAi0J/RgNC40L/QvtGA0YLQvtCy0YvQuSDRgtC10YDQvNC40L3QsNC7INCd0L7QstC+\n0YDQvtGB0YHQuNC50YHQuiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQ\nndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQ\nutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXFLfXFMKGgGWAAAAABoB1jCAAAAZmlsZXIgZm9s\nZGVyICLQn9GA0LjQv9C+0YDRgtC+0LLRi9C5INGC0LXRgNC80LjQvdCw0Lsg0J3QvtCy0L7RgNC+\n0YHRgdC40LnRgdC6IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uINCd0LjQ\nttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQ\nuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcU19cU4oaAZYAAAAAGgHWMIAAABmaWxlciBmb2xkZXIg\nItCf0YDQuNC/0L7RgNGC0L7QstGL0Lkg0YLQtdGA0LzQuNC90LDQuyDQndC+0LLQvtGA0L7RgdGB\n0LjQudGB0LoiINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQuNC30LzQtdC90LXQvS4g0J3QuNC20LUg\n0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQ\nvtCy0LDRgtGMLmgISxR1YmgDKYFxT31xUChoBlgAAAAAaAdYlAAAAHRlYXNlciAi0J3QvtCy0YvQ\nuSDRgtC40LfQtdGAISIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd\n0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC6\n0YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcVF9cVIoaAZYAAAAAGgHWHkAAADRgdGC0YDQsNC9\n0LjRhtCwICLQn9GA0LjQv9C+0YDRgtC+0LLRi9C5INGC0LXRgNC80LjQvdCw0Lsg0J3QvtCy0L7R\ngNC+0YHRgdC40LnRgdC6IiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0uaAhL\nFHViZVUPZGphbmdvX2xhbmd1YWdlWAIAAABydXFTdS4=\n	2013-03-10 22:38:03.237975+04
975982c067e4336e05b61f4ff15a55a5	MjgzM2M5MzVjN2ZmNDViYjYwZDRiNmYwMDUyN2YzM2QwMzE5MzNlNDqAAn1xAShVDmNtc19hZG1p\nbl9zaXRlSwFVDV9hdXRoX3VzZXJfaWRLAVUUZmlsZXJfbGFzdF9mb2xkZXJfaWRYAQAAADJVEl9h\ndXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tl\nbmRVCV9tZXNzYWdlc11xAihjZGphbmdvLmNvbnRyaWIubWVzc2FnZXMuc3RvcmFnZS5iYXNlCk1l\nc3NhZ2UKcQMpgXEEfXEFKFUKZXh0cmFfdGFnc3EGWAAAAABVB21lc3NhZ2VxB1i5AAAAdGV4dCAi\n0JzQtdC20LTRg9C90LDRgNC+0LTQvdGL0LUg0LrQvtC90YLQtdC50L3QtdGA0L3Ri9C1INC/0LXR\ngC4uLiIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC00L7QsdCw0LLQu9C10L0uINCd0LjQttC1INCy\n0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQsNC60YLQuNGA0L7Q\nstCw0YLRjC5VBWxldmVscQhLFHViaAMpgXEJfXEKKGgGWAAAAABoB1iYAAAA0YHRgtGA0LDQvdC4\n0YbQsCAi0JvQvtCz0LjRgdGC0LjQutCwIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQ\nvdC10L0uINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLR\ngNC10LTQsNC60YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcQt9cQwoaAZYAAAAAGgHWEsAAADR\ngdGC0YDQsNC90LjRhtCwICLQm9C+0LPQuNGB0YLQuNC60LAiINCx0YvQuyDRg9GB0L/QtdGI0L3Q\nviDQuNC30LzQtdC90LXQvS5oCEsUdWJoAymBcQ19cQ4oaAZYAAAAAGgHWJAAAAB0ZXh0ICJSdXNj\nb24gdG9kYXkgaXMgLi4uLi4uIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g0LjQt9C80LXQvdC10L0u\nINCd0LjQttC1INCy0Ysg0LzQvtC20LXRgtC1INGB0L3QvtCy0LAg0LXQs9C+INC+0YLRgNC10LTQ\nsNC60YLQuNGA0L7QstCw0YLRjC5oCEsUdWJoAymBcQ99cRAoaAZYAAAAAGgHWJsAAAB0ZXh0ICJJ\nbnRlcm5hdGlvbmFsIGNvbnRhaW5lciBzaGlwcGkuLi4iINCx0YvQuyDRg9GB0L/QtdGI0L3QviDQ\nuNC30LzQtdC90LXQvS4g0J3QuNC20LUg0LLRiyDQvNC+0LbQtdGC0LUg0YHQvdC+0LLQsCDQtdCz\n0L4g0L7RgtGA0LXQtNCw0LrRgtC40YDQvtCy0LDRgtGMLmgISxR1YmgDKYFxEX1xEihoBlgAAAAA\naAdYQQAAANGB0YLRgNCw0L3QuNGG0LAgIkxvZ2lzdGljIiDQsdGL0Lsg0YPRgdC/0LXRiNC90L4g\n0LjQt9C80LXQvdC10L0uaAhLFHViaAMpgXETfXEUKGgGWAAAAABoB1g9AAAA0YHRgtGA0LDQvdC4\n0YbQsCAiSG9tZSIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgD\nKYFxFX1xFihoBlgAAAAAaAdYPgAAANGE0LDQudC7ICIyMTAxMjAxMjEwMy5qcGciINCx0YvQuyDR\ng9GB0L/QtdGI0L3QviDRg9C00LDQu9C10L0uaAhLFHViaAMpgXEXfXEYKGgGWAAAAABoB1g7AAAA\n0YTQsNC50LsgItGR0LvQutC4LmpwZyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INGD0LTQsNC70LXQ\nvS5oCEsUdWJoAymBcRl9cRooaAZYAAAAAGgHWEQAAADQuNC30L7QsdGA0LDQttC10L3QuNC1ICI0\nLmpwZyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LmgISxR1YmgDKYFxG31x\nHChoBlgAAAAAaAdYmwAAANC40LfQvtCx0YDQsNC20LXQvdC40LUgKGZpbGVyKSAiNC5qcGciINCx\n0YvQuyDRg9GB0L/QtdGI0L3QviDQtNC+0LHQsNCy0LvQtdC9LiDQndC40LbQtSDQstGLINC80L7Q\nttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0Ywu\naAhLFHViaAMpgXEdfXEeKGgGWAAAAABoB1icAAAA0YHRgtGA0LDQvdC40YbQsCAi0KTQvtGC0L7Q\ns9Cw0LvQtdGA0LXRjyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC4\n0LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC\n0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEffXEgKGgGWAAAAABoB1iZAAAA0LjQt9C+0LHRgNCw\n0LbQtdC90LjQtSAoZmlsZXIpICI0LmpwZyIg0LHRi9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC1\n0L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC\n0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEhfXEiKGgGWAAAAABoB1icAAAA\n0YHRgtGA0LDQvdC40YbQsCAi0KTQvtGC0L7Qs9Cw0LvQtdGA0LXRjyIg0LHRi9C7INGD0YHQv9C1\n0YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC10YLQtSDRgdC90L7Q\nstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhLFHViaAMpgXEjfXEk\nKGgGWAAAAABoB1iZAAAA0LjQt9C+0LHRgNCw0LbQtdC90LjQtSAoZmlsZXIpICI0LmpwZyIg0LHR\ni9C7INGD0YHQv9C10YjQvdC+INC40LfQvNC10L3QtdC9LiDQndC40LbQtSDQstGLINC80L7QttC1\n0YLQtSDRgdC90L7QstCwINC10LPQviDQvtGC0YDQtdC00LDQutGC0LjRgNC+0LLQsNGC0YwuaAhL\nFHViZVUPZGphbmdvX2xhbmd1YWdlWAIAAABydXEldS4=\n	2013-03-13 15:51:15.439732+04
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
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY easy_thumbnails_source (id, name, modified, storage_hash) FROM stdin;
1	uploads/zinnia/stars_near_cho_la_LJ.jpg	2013-02-23 18:36:43.482936+04	f9bde26a1556cd667f742bd34ec7c55e
2	uploads/zinnia/ёлки.jpg	2013-02-24 11:21:27.818397+04	f9bde26a1556cd667f742bd34ec7c55e
5	filer_public/2013/02/27/graph.gif	2013-02-27 10:09:19.300094+04	f9bde26a1556cd667f742bd34ec7c55e
6	filer_public/2013/02/27/map.gif	2013-02-27 13:56:20.108554+04	f9bde26a1556cd667f742bd34ec7c55e
7	filer_public/2013/02/27/ttclub.jpg	2013-02-27 14:35:52.597384+04	f9bde26a1556cd667f742bd34ec7c55e
8	filer_public/2013/02/27/tt-1.jpg	2013-02-27 14:53:23.52615+04	f9bde26a1556cd667f742bd34ec7c55e
9	filer_public/2013/02/27/tt-2.jpg	2013-02-27 14:53:36.50615+04	f9bde26a1556cd667f742bd34ec7c55e
10	filer_public/2013/02/27/tt-3.jpg	2013-02-27 14:53:36.514151+04	f9bde26a1556cd667f742bd34ec7c55e
11	filer_public/2013/02/27/tt-4.jpg	2013-02-27 14:53:36.522151+04	f9bde26a1556cd667f742bd34ec7c55e
12	filer_public/2013/02/27/tt-5.jpg	2013-02-27 14:53:37.702151+04	f9bde26a1556cd667f742bd34ec7c55e
13	filer_public/2013/02/27/tt-6.jpg	2013-02-27 14:53:37.770151+04	f9bde26a1556cd667f742bd34ec7c55e
14	filer_public/2013/02/27/4.jpg	2013-02-27 16:45:35.923639+04	f9bde26a1556cd667f742bd34ec7c55e
15	filer_public/2013/02/27/5.jpg	2013-02-27 16:45:35.927639+04	f9bde26a1556cd667f742bd34ec7c55e
16	filer_public/2013/02/27/7.jpg	2013-02-27 16:45:35.927639+04	f9bde26a1556cd667f742bd34ec7c55e
17	filer_public/2013/02/27/8.jpg	2013-02-27 16:45:37.103639+04	f9bde26a1556cd667f742bd34ec7c55e
18	filer_public/2013/02/27/9.jpg	2013-02-27 16:45:37.239639+04	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 18, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY easy_thumbnails_thumbnail (id, name, modified, source_id, storage_hash) FROM stdin;
1	uploads/zinnia/stars_near_cho_la_LJ.jpg.160x120_q85_crop-smart.jpg	2013-02-24 11:17:47.506395+04	1	d26becbf46ac48eda79c7a39a13a02dd
2	uploads/zinnia/stars_near_cho_la_LJ.jpg.330x220_q85_crop-smart.jpg	2013-02-24 11:17:56.674395+04	1	d26becbf46ac48eda79c7a39a13a02dd
3	uploads/zinnia/ёлки.jpg.160x120_q85_crop-smart.jpg	2013-02-24 11:21:31.614398+04	2	d26becbf46ac48eda79c7a39a13a02dd
4	uploads/zinnia/ёлки.jpg.330x220_q85_crop-smart.jpg	2013-02-24 11:21:34.674397+04	2	d26becbf46ac48eda79c7a39a13a02dd
5	uploads/zinnia/ёлки.jpg.800x600_q85.jpg	2013-02-24 11:22:11.794398+04	2	d26becbf46ac48eda79c7a39a13a02dd
24	uploads/zinnia/stars_near_cho_la_LJ.jpg.800x600_q85.jpg	2013-02-24 23:06:20.314814+04	1	d26becbf46ac48eda79c7a39a13a02dd
25	filer_public_thumbnails/filer_public/2013/02/27/graph.gif__16x16_q85_crop_upscale.png	2013-02-27 10:09:19.400094+04	5	f9bde26a1556cd667f742bd34ec7c55e
26	filer_public_thumbnails/filer_public/2013/02/27/graph.gif__32x32_q85_crop_upscale.png	2013-02-27 10:09:19.452094+04	5	f9bde26a1556cd667f742bd34ec7c55e
27	filer_public_thumbnails/filer_public/2013/02/27/graph.gif__48x48_q85_crop_upscale.png	2013-02-27 10:09:19.476094+04	5	f9bde26a1556cd667f742bd34ec7c55e
28	filer_public_thumbnails/filer_public/2013/02/27/graph.gif__64x64_q85_crop_upscale.png	2013-02-27 10:09:19.504094+04	5	f9bde26a1556cd667f742bd34ec7c55e
29	filer_public_thumbnails/filer_public/2013/02/27/graph.gif__620x319_q85_crop_upscale.png	2013-02-27 10:09:32.040095+04	5	f9bde26a1556cd667f742bd34ec7c55e
30	filer_public_thumbnails/filer_public/2013/02/27/map.gif__16x16_q85_crop_upscale.png	2013-02-27 13:56:20.172554+04	6	f9bde26a1556cd667f742bd34ec7c55e
31	filer_public_thumbnails/filer_public/2013/02/27/map.gif__32x32_q85_crop_upscale.png	2013-02-27 13:56:20.200554+04	6	f9bde26a1556cd667f742bd34ec7c55e
32	filer_public_thumbnails/filer_public/2013/02/27/map.gif__48x48_q85_crop_upscale.png	2013-02-27 13:56:20.228554+04	6	f9bde26a1556cd667f742bd34ec7c55e
33	filer_public_thumbnails/filer_public/2013/02/27/map.gif__64x64_q85_crop_upscale.png	2013-02-27 13:56:20.252554+04	6	f9bde26a1556cd667f742bd34ec7c55e
34	filer_public_thumbnails/filer_public/2013/02/27/map.gif__620x319_q85_crop_upscale.png	2013-02-27 13:57:00.124555+04	6	f9bde26a1556cd667f742bd34ec7c55e
35	filer_public_thumbnails/filer_public/2013/02/27/ttclub.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:35:52.64941+04	7	f9bde26a1556cd667f742bd34ec7c55e
36	filer_public_thumbnails/filer_public/2013/02/27/ttclub.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:35:52.66942+04	7	f9bde26a1556cd667f742bd34ec7c55e
37	filer_public_thumbnails/filer_public/2013/02/27/ttclub.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:35:52.677424+04	7	f9bde26a1556cd667f742bd34ec7c55e
38	filer_public_thumbnails/filer_public/2013/02/27/ttclub.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:35:52.68943+04	7	f9bde26a1556cd667f742bd34ec7c55e
39	filer_public_thumbnails/filer_public/2013/02/27/ttclub.jpg__92x83_q85_crop_upscale.jpg	2013-02-27 14:36:30.692423+04	7	f9bde26a1556cd667f742bd34ec7c55e
40	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:23.64215+04	8	f9bde26a1556cd667f742bd34ec7c55e
41	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:23.71815+04	8	f9bde26a1556cd667f742bd34ec7c55e
42	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:23.80615+04	8	f9bde26a1556cd667f742bd34ec7c55e
43	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:23.88215+04	8	f9bde26a1556cd667f742bd34ec7c55e
44	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:36.814151+04	11	f9bde26a1556cd667f742bd34ec7c55e
45	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:36.810151+04	10	f9bde26a1556cd667f742bd34ec7c55e
46	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:36.826151+04	9	f9bde26a1556cd667f742bd34ec7c55e
47	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:37.034151+04	11	f9bde26a1556cd667f742bd34ec7c55e
48	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:37.054151+04	10	f9bde26a1556cd667f742bd34ec7c55e
49	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:37.070151+04	9	f9bde26a1556cd667f742bd34ec7c55e
52	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:37.334151+04	9	f9bde26a1556cd667f742bd34ec7c55e
55	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:37.622151+04	9	f9bde26a1556cd667f742bd34ec7c55e
50	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:37.32215+04	11	f9bde26a1556cd667f742bd34ec7c55e
53	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:37.558151+04	11	f9bde26a1556cd667f742bd34ec7c55e
51	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:37.326151+04	10	f9bde26a1556cd667f742bd34ec7c55e
54	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:37.586151+04	10	f9bde26a1556cd667f742bd34ec7c55e
56	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:37.958151+04	12	f9bde26a1556cd667f742bd34ec7c55e
57	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 14:53:37.966151+04	13	f9bde26a1556cd667f742bd34ec7c55e
58	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:38.146151+04	12	f9bde26a1556cd667f742bd34ec7c55e
59	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 14:53:38.15415+04	13	f9bde26a1556cd667f742bd34ec7c55e
60	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:38.326151+04	12	f9bde26a1556cd667f742bd34ec7c55e
61	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 14:53:38.330151+04	13	f9bde26a1556cd667f742bd34ec7c55e
62	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:38.474151+04	12	f9bde26a1556cd667f742bd34ec7c55e
63	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 14:53:38.478151+04	13	f9bde26a1556cd667f742bd34ec7c55e
64	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__800x600_q85.jpg	2013-02-27 14:54:05.002151+04	8	f9bde26a1556cd667f742bd34ec7c55e
65	filer_public_thumbnails/filer_public/2013/02/27/tt-1.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:05.146151+04	8	f9bde26a1556cd667f742bd34ec7c55e
66	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__800x600_q85.jpg	2013-02-27 14:54:05.274151+04	9	f9bde26a1556cd667f742bd34ec7c55e
67	filer_public_thumbnails/filer_public/2013/02/27/tt-2.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:05.378151+04	9	f9bde26a1556cd667f742bd34ec7c55e
68	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__800x600_q85.jpg	2013-02-27 14:54:05.486151+04	10	f9bde26a1556cd667f742bd34ec7c55e
69	filer_public_thumbnails/filer_public/2013/02/27/tt-3.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:05.578151+04	10	f9bde26a1556cd667f742bd34ec7c55e
70	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__800x600_q85.jpg	2013-02-27 14:54:05.690151+04	11	f9bde26a1556cd667f742bd34ec7c55e
71	filer_public_thumbnails/filer_public/2013/02/27/tt-4.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:05.790151+04	11	f9bde26a1556cd667f742bd34ec7c55e
72	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__800x600_q85.jpg	2013-02-27 14:54:05.902151+04	12	f9bde26a1556cd667f742bd34ec7c55e
73	filer_public_thumbnails/filer_public/2013/02/27/tt-5.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:06.002151+04	12	f9bde26a1556cd667f742bd34ec7c55e
74	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__800x600_q85.jpg	2013-02-27 14:54:06.134151+04	13	f9bde26a1556cd667f742bd34ec7c55e
75	filer_public_thumbnails/filer_public/2013/02/27/tt-6.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 14:54:06.250151+04	13	f9bde26a1556cd667f742bd34ec7c55e
76	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 16:45:36.647639+04	14	f9bde26a1556cd667f742bd34ec7c55e
77	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 16:45:36.691639+04	15	f9bde26a1556cd667f742bd34ec7c55e
78	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 16:45:36.679639+04	16	f9bde26a1556cd667f742bd34ec7c55e
79	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 16:45:36.799639+04	14	f9bde26a1556cd667f742bd34ec7c55e
80	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 16:45:36.843639+04	15	f9bde26a1556cd667f742bd34ec7c55e
81	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 16:45:36.843639+04	16	f9bde26a1556cd667f742bd34ec7c55e
82	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 16:45:36.911639+04	14	f9bde26a1556cd667f742bd34ec7c55e
83	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 16:45:36.939639+04	15	f9bde26a1556cd667f742bd34ec7c55e
84	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 16:45:36.943639+04	16	f9bde26a1556cd667f742bd34ec7c55e
85	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 16:45:36.995639+04	14	f9bde26a1556cd667f742bd34ec7c55e
86	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 16:45:37.043639+04	15	f9bde26a1556cd667f742bd34ec7c55e
87	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 16:45:37.063639+04	16	f9bde26a1556cd667f742bd34ec7c55e
88	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 16:45:37.307639+04	17	f9bde26a1556cd667f742bd34ec7c55e
89	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__16x16_q85_crop_upscale.jpg	2013-02-27 16:45:37.339639+04	18	f9bde26a1556cd667f742bd34ec7c55e
90	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 16:45:37.411639+04	17	f9bde26a1556cd667f742bd34ec7c55e
91	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__32x32_q85_crop_upscale.jpg	2013-02-27 16:45:37.423639+04	18	f9bde26a1556cd667f742bd34ec7c55e
92	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 16:45:37.511639+04	18	f9bde26a1556cd667f742bd34ec7c55e
93	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__48x48_q85_crop_upscale.jpg	2013-02-27 16:45:37.511639+04	17	f9bde26a1556cd667f742bd34ec7c55e
94	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 16:45:37.587639+04	17	f9bde26a1556cd667f742bd34ec7c55e
95	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__64x64_q85_crop_upscale.jpg	2013-02-27 16:45:37.591639+04	18	f9bde26a1556cd667f742bd34ec7c55e
96	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__210x10000_q85.jpg	2013-02-27 16:46:15.36364+04	14	f9bde26a1556cd667f742bd34ec7c55e
97	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__16x16_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:46:26.47164+04	14	f9bde26a1556cd667f742bd34ec7c55e
98	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__32x32_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:46:26.49964+04	14	f9bde26a1556cd667f742bd34ec7c55e
99	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__48x48_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:46:26.52764+04	14	f9bde26a1556cd667f742bd34ec7c55e
100	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__64x64_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:46:26.55964+04	14	f9bde26a1556cd667f742bd34ec7c55e
101	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__640x480_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:48:00.155643+04	14	f9bde26a1556cd667f742bd34ec7c55e
102	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__800x600_q85.jpg	2013-02-27 16:48:24.767643+04	14	f9bde26a1556cd667f742bd34ec7c55e
103	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 16:48:24.799643+04	14	f9bde26a1556cd667f742bd34ec7c55e
104	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__800x600_q85.jpg	2013-02-27 16:48:24.819643+04	15	f9bde26a1556cd667f742bd34ec7c55e
105	filer_public_thumbnails/filer_public/2013/02/27/5.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 16:48:24.855643+04	15	f9bde26a1556cd667f742bd34ec7c55e
106	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__800x600_q85.jpg	2013-02-27 16:48:24.875643+04	16	f9bde26a1556cd667f742bd34ec7c55e
107	filer_public_thumbnails/filer_public/2013/02/27/7.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 16:48:24.903643+04	16	f9bde26a1556cd667f742bd34ec7c55e
108	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__800x600_q85.jpg	2013-02-27 16:48:24.927643+04	17	f9bde26a1556cd667f742bd34ec7c55e
109	filer_public_thumbnails/filer_public/2013/02/27/8.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 16:48:24.951643+04	17	f9bde26a1556cd667f742bd34ec7c55e
110	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__800x600_q85.jpg	2013-02-27 16:48:24.975643+04	18	f9bde26a1556cd667f742bd34ec7c55e
111	filer_public_thumbnails/filer_public/2013/02/27/9.jpg__100x75_q85_crop-True_upscale-True.jpg	2013-02-27 16:48:25.007643+04	18	f9bde26a1556cd667f742bd34ec7c55e
112	filer_public_thumbnails/filer_public/2013/02/27/4.jpg__100x70_q85_crop_subject_location-219,176_upscale.jpg	2013-02-27 16:48:56.411644+04	14	f9bde26a1556cd667f742bd34ec7c55e
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 112, true);


--
-- Data for Name: filer_clipboard; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_clipboard (id, user_id) FROM stdin;
1	1
\.


--
-- Name: filer_clipboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('filer_clipboard_id_seq', 1, true);


--
-- Data for Name: filer_clipboarditem; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_clipboarditem (id, file_id, clipboard_id) FROM stdin;
\.


--
-- Name: filer_clipboarditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('filer_clipboarditem_id_seq', 16, true);


--
-- Data for Name: filer_file; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_file (id, folder_id, file, _file_size, has_all_mandatory_data, original_filename, name, owner_id, uploaded_at, modified_at, description, is_public, sha1, polymorphic_ctype_id) FROM stdin;
3	3	filer_public/2013/02/27/graph.gif	8764	f	graph.gif		1	2013-02-27 10:09:19.352627+04	2013-02-27 10:09:22.653764+04	\N	t	0b2db0d011c7148555d576374b02ecdfc00c722b	50
4	3	filer_public/2013/02/27/map.gif	17722	f	map.gif		1	2013-02-27 13:56:20.118028+04	2013-02-27 13:56:24.709855+04	\N	t	1101fcccc030d41a54b6627b3c1773e29cb11fe0	50
5	4	filer_public/2013/02/27/ttclub.jpg	2187	f	ttclub.jpg		1	2013-02-27 14:35:52.60893+04	2013-02-27 14:36:17.547039+04	\N	t	5d4d590ceea4912becc2fdf1b256a117e399d199	50
6	5	filer_public/2013/02/27/tt-1.jpg	139873	f	tt-1.jpg		1	2013-02-27 14:53:23.537211+04	2013-02-27 14:53:43.842017+04	\N	t	a0b0dcf5cdba1f5dfd8a41d35bb8383738c5654b	50
9	5	filer_public/2013/02/27/tt-3.jpg	71018	f	tt-3.jpg		1	2013-02-27 14:53:36.550184+04	2013-02-27 14:53:43.852522+04	\N	t	9d09cd6e9c2fdb6673595a739d402312fad0ec63	50
8	5	filer_public/2013/02/27/tt-4.jpg	139529	f	tt-4.jpg		1	2013-02-27 14:53:36.550442+04	2013-02-27 14:53:43.860706+04	\N	t	26d4f5b72af31dc4b95afa346e0057be3fedcd37	50
7	5	filer_public/2013/02/27/tt-2.jpg	107077	f	tt-2.jpg		1	2013-02-27 14:53:36.549516+04	2013-02-27 14:53:43.8689+04	\N	t	7d59dfbb1e8ee593a839d1438adeed9cc2eb530d	50
10	5	filer_public/2013/02/27/tt-5.jpg	180417	f	tt-5.jpg		1	2013-02-27 14:53:37.743214+04	2013-02-27 14:53:43.877415+04	\N	t	0590471dc6fe1d73f77c5e7d94792c691c73baa5	50
11	5	filer_public/2013/02/27/tt-6.jpg	139200	f	tt-6.jpg		1	2013-02-27 14:53:37.789438+04	2013-02-27 14:53:43.889251+04	\N	t	8a61959560a1ce42a85d28543ed3c30b814fffb7	50
13	2	filer_public/2013/02/27/7.jpg	141889	f	7.jpg		1	2013-02-27 16:45:36.09774+04	2013-02-27 16:45:40.312452+04	\N	t	af5c058048539b8140210a22bcd89239fa503869	50
14	2	filer_public/2013/02/27/5.jpg	142365	f	5.jpg		1	2013-02-27 16:45:36.097247+04	2013-02-27 16:45:40.320143+04	\N	t	18aca8602c646c90765bfe4c28e718b9842954ba	50
15	2	filer_public/2013/02/27/8.jpg	69555	f	8.jpg		1	2013-02-27 16:45:37.154137+04	2013-02-27 16:45:40.328478+04	\N	t	a888ae0342ff055d19fd7e794d8eda905194c97d	50
16	2	filer_public/2013/02/27/9.jpg	142588	f	9.jpg		1	2013-02-27 16:45:37.268057+04	2013-02-27 16:45:40.340404+04	\N	t	e296da84c852170663d9cf4413c5b5c07c77d940	50
12	2	filer_public/2013/02/27/4.jpg	143700	f	4.jpg		1	2013-02-27 16:45:35.992361+04	2013-02-27 16:46:26.309627+04		t	7df4daadcc8457dd63f16076f793c457f1bff933	50
\.


--
-- Name: filer_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('filer_file_id_seq', 16, true);


--
-- Data for Name: filer_folder; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_folder (id, parent_id, name, owner_id, uploaded_at, created_at, modified_at, lft, rght, tree_id, level) FROM stdin;
1	\N	galleries	1	2013-02-24 17:03:32.749603+04	2013-02-24 17:03:32.749644+04	2013-02-24 17:03:32.749667+04	1	4	1	0
2	1	terminal	1	2013-02-24 17:04:06.712128+04	2013-02-24 17:04:06.712166+04	2013-02-24 17:04:06.712188+04	2	3	1	1
3	\N	info	1	2013-02-27 10:08:55.274195+04	2013-02-27 10:08:55.274216+04	2013-02-27 10:08:55.274227+04	1	6	2	0
4	3	resposibility	1	2013-02-27 14:36:13.348866+04	2013-02-27 14:36:13.34889+04	2013-02-27 14:36:13.3489+04	2	5	2	1
5	4	certificate	1	2013-02-27 14:53:16.398879+04	2013-02-27 14:53:16.398901+04	2013-02-27 14:53:16.398912+04	3	4	2	2
\.


--
-- Name: filer_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('filer_folder_id_seq', 5, true);


--
-- Data for Name: filer_folderpermission; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_folderpermission (id, folder_id, type, user_id, group_id, everybody, can_edit, can_read, can_add_children) FROM stdin;
\.


--
-- Name: filer_folderpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('filer_folderpermission_id_seq', 1, false);


--
-- Data for Name: filer_image; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY filer_image (file_ptr_id, _height, _width, date_taken, default_alt_text, default_caption, author, must_always_publish_author_credit, must_always_publish_copyright, subject_location) FROM stdin;
3	319	620	2013-02-27 10:09:19.29149+04	\N	\N	\N	f	f	\N
4	319	620	2013-02-27 13:56:20.102805+04	\N	\N	\N	f	f	\N
5	83	92	2013-02-27 14:35:52.601104+04	\N	\N	\N	f	f	\N
6	1200	857	2013-02-27 14:53:23.530179+04	\N	\N	\N	f	f	\N
9	1200	857	2013-02-27 14:53:36.513903+04	\N	\N	\N	f	f	\N
8	1200	857	2013-02-27 14:53:36.527711+04	\N	\N	\N	f	f	\N
7	1200	857	2013-02-27 14:53:36.509706+04	\N	\N	\N	f	f	\N
10	1200	857	2013-02-27 14:53:37.707399+04	\N	\N	\N	f	f	\N
11	1200	857	2013-02-27 14:53:37.763255+04	\N	\N	\N	f	f	\N
13	480	640	2013-02-27 16:45:35.886996+04	\N	\N	\N	f	f	\N
14	480	640	2013-02-27 16:45:35.889293+04	\N	\N	\N	f	f	\N
15	480	640	2013-02-27 16:45:37.10632+04	\N	\N	\N	f	f	\N
16	480	640	2013-02-27 16:45:37.243163+04	\N	\N	\N	f	f	\N
12	480	640	2013-02-27 16:45:35.876028+04			\N	f	f	219,176
\.


--
-- Data for Name: menus_cachekey; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY menus_cachekey (id, language, site, key) FROM stdin;
219	ru	1	cms-menu_nodes_ru_1_1_user
\.


--
-- Name: menus_cachekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('menus_cachekey_id_seq', 219, true);


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
101	cms_helper	0002_auto__add_clocktown	2013-02-14 16:49:22.476375+04
102	cms_helper	0003_auto__add_field_clocktown_town_en__add_field_clocktown_town_ru	2013-02-14 16:52:42.681967+04
103	cms_helper	0004_auto__add_field_clocktown_order	2013-02-15 09:31:35.566253+04
104	cmsplugin_zinnia	0001_initial	2013-02-19 11:48:30.595993+04
105	cmsplugin_zinnia	0002_query_entries_plugin	2013-02-19 11:48:30.65348+04
106	cmsplugin_zinnia	0003_calendar_entries_plugin	2013-02-19 11:48:30.715929+04
108	thumbnail	0001_initial	2013-02-19 14:06:04.124207+04
109	cmsplugin_contact	0001_initial	2013-02-23 22:39:36.596323+04
110	cmsplugin_contact	0002_auto__chg_field_contact_thanks	2013-02-23 22:39:36.654365+04
111	easy_thumbnails	0001_initial	2013-02-24 11:09:52.800021+04
112	easy_thumbnails	0002_filename_indexes	2013-02-24 11:09:52.916279+04
113	easy_thumbnails	0003_auto__add_storagenew	2013-02-24 11:09:53.074882+04
114	easy_thumbnails	0004_auto__add_field_source_storage_new__add_field_thumbnail_storage_new	2013-02-24 11:09:53.183156+04
115	easy_thumbnails	0005_storage_fks_null	2013-02-24 11:09:53.429894+04
116	easy_thumbnails	0006_copy_storage	2013-02-24 11:09:53.458153+04
117	easy_thumbnails	0007_storagenew_fks_not_null	2013-02-24 11:09:53.584846+04
118	easy_thumbnails	0008_auto__del_field_source_storage__del_field_thumbnail_storage	2013-02-24 11:09:53.612795+04
119	easy_thumbnails	0009_auto__del_storage	2013-02-24 11:09:53.648123+04
120	easy_thumbnails	0010_rename_storage	2013-02-24 11:09:53.691597+04
121	easy_thumbnails	0011_auto__add_field_source_storage_hash__add_field_thumbnail_storage_hash	2013-02-24 11:09:54.002351+04
122	easy_thumbnails	0012_build_storage_hashes	2013-02-24 11:09:54.016548+04
123	easy_thumbnails	0013_auto__del_storage__del_field_source_storage__del_field_thumbnail_stora	2013-02-24 11:09:54.122506+04
124	easy_thumbnails	0014_auto__add_unique_source_name_storage_hash__add_unique_thumbnail_name_s	2013-02-24 11:09:54.200262+04
125	easy_thumbnails	0015_auto__del_unique_thumbnail_name_storage_hash__add_unique_thumbnail_sou	2013-02-24 11:09:54.27637+04
126	cms_helper	0005_auto__add_customcontact	2013-02-24 12:57:32.950377+04
127	filer	0001_initial	2013-02-24 17:01:32.324211+04
128	filer	0002_rename_file_field	2013-02-24 17:01:32.388882+04
129	filer	0003_add_description_field	2013-02-24 17:01:32.422144+04
130	filer	0004_auto__del_field_file__file__add_field_file_file__add_field_file_is_pub	2013-02-24 17:01:32.630921+04
131	filer	0005_auto__add_field_file_sha1__chg_field_file_file	2013-02-24 17:01:32.844946+04
132	filer	0006_polymorphic__add_field_file_polymorphic_ctype	2013-02-24 17:01:32.923608+04
133	filer	0007_polymorphic__content_type_data	2013-02-24 17:01:32.956019+04
134	filer	0008_polymorphic__del_field_file__file_type_plugin_name	2013-02-24 17:01:32.998531+04
135	filer	0009_auto__add_field_folderpermission_can_edit_new__add_field_folderpermiss	2013-02-24 17:01:33.031503+04
136	filer	0010_folderpermissions	2013-02-24 17:01:33.061467+04
137	filer	0011_auto__del_field_folderpermission_can_add_children__del_field_folderper	2013-02-24 17:01:33.097882+04
138	filer	0012_renaming_folderpermissions	2013-02-24 17:01:33.147277+04
139	filer	0013_remove_null_file_name	2013-02-24 17:01:33.173386+04
140	filer	0014_auto__add_field_image_related_url__chg_field_file_name	2013-02-24 17:01:33.239436+04
141	cmsplugin_filer_folder	0001_initial	2013-02-24 17:07:18.326435+04
142	cmsplugin_filer_image	0001_initial	2013-02-24 19:25:16.423798+04
143	cmsplugin_filer_image	0002_auto__add_field_filerimage_image_url__chg_field_filerimage_image	2013-02-24 19:25:16.540887+04
144	cmsplugin_filer_image	0003_auto__add_thumbnailoption__add_field_filerimage_thumbnail_option	2013-02-24 19:25:16.640192+04
145	cmsplugin_filer_image	0004_auto__del_field_thumbnailoption_is_scaled__del_field_thumbnailoption_i	2013-02-24 19:25:17.110311+04
146	cmsplugin_filer_image	0005_rename_float_to_alignment	2013-02-24 19:25:17.16441+04
147	cmsplugin_filer_image	0006_auto__add_field_filerimage_original_link	2013-02-24 19:25:17.33645+04
148	cmsplugin_filer_image	0007_rename_caption_to_caption_text	2013-02-24 19:25:17.389375+04
149	cmsplugin_filer_image	0008_auto__add_field_filerimage_file_link	2013-02-24 19:25:17.465742+04
150	cmsplugin_filer_image	0009_auto__add_field_filerimage_use_original_image	2013-02-24 19:25:17.707867+04
151	cmsplugin_filer_image	0010_auto__add_field_filerimage_target_blank	2013-02-24 19:25:17.984206+04
152	teaser	0001_initial	2013-02-24 23:04:04.102989+04
153	teaser	0002_publisher2	2013-02-24 23:04:04.119583+04
154	zinnia	0017_auto__add_field_category_title_en__add_field_category_title_ru__add_fi	2013-02-25 10:28:19.566655+04
155	redirects	0001_initial	2013-02-25 15:35:07.717414+04
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 155, true);


--
-- Data for Name: tagging_tag; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY tagging_tag (id, name) FROM stdin;
1	логистика
2	logistic
3	General
4	Korea
5	Motors
6	козловой
7	контейнерный
8	кран
\.


--
-- Name: tagging_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('tagging_tag_id_seq', 8, true);


--
-- Data for Name: tagging_taggeditem; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY tagging_taggeditem (id, tag_id, content_type_id, object_id) FROM stdin;
3	3	31	2
4	4	31	2
5	5	31	2
6	6	31	1
7	7	31	1
8	8	31	1
\.


--
-- Name: tagging_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('tagging_taggeditem_id_seq', 8, true);


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
press-releases		2	Пресс-релизы	\N	1	2	2	0	Press releases	Пресс-релизы		
news		3	Новости	\N	1	2	1	0	News	Новости		
\.


--
-- Name: zinnia_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_category_id_seq', 3, true);


--
-- Data for Name: zinnia_entry; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry (status, last_update, comment_enabled, tags, image, title, excerpt, slug, content, end_publication, start_publication, creation_date, id, pingback_enabled, login_required, password, detail_template, featured, comment_count, pingback_count, trackback_count, trackback_enabled, content_template, title_en, title_ru, content_en, content_ru, excerpt_en, excerpt_ru) FROM stdin;
2	2011-08-24 17:03:52+04	t			Мощность Петролеспорта увеличится на 40%	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании</p>\n	moschnost-petrolesporta-uvelichitsya-na-2011-08-24-080352	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании. Наращивания мощности является частью инвестиционной программы стоимостью $890 млн, которую холдинг реализует c 2007 г. Мощность &laquo;Петролеспорта&raquo; выросла с 650 000 до 1 млн TEU в 2008 году. К 2015 г. Global Ports хочет довести ее до 2,3 млн TEU в год, предполагается намыв 15 га новой территории.</p>\n<p align="justify">\n\tПредставители Global Ports не раскрывают загрузку &laquo;Петролеспорта&raquo;. В прошлом году терминал перевалил 541 120 TEU, что на 179% больше, чем в 2009 г. Global Ports управляет также контейнерным терминалом &laquo;Моби Дик&raquo; с мощностью 400 000 TEU в год, который, по словам представителей Global Ports, пока не будет расширяться. Его развитие зависит от ситуации на рынке.</p>\n<p align="justify">\n\tЗа первое полугодие 2011 г. стивидоры Большого порта Санкт-Петербург нарастили число переваленных контейнеров почти до 1,2 млн &mdash; на 35% по сравнению с тем же периодом 2010 г. Самый крупный терминал &mdash; Первый контейнерный (ПКТ) &mdash; увеличил грузооборот на 8% до 597 844 TEU, свидетельствуют данные пресс-службы Национальной контейнерной компании (НКК) (владеет ПКТ). Также НКК планирует осенью запустить первую очередь терминала мощностью 300 000 TEU в Усть-Луге. При этом в презентации для инвесторов, опубликованной на сайте Global Ports, сказано, что российские терминалы компании, расположенные на Балтике, загружены на 64%.</p>\n<p align="justify">\n\tПо прогнозам InfraNews, в этом году поток контейнеров в Петербурге вырастет на 25%. Если не будет радикальных изменений в экономике, в 2013 г. контейнерный оборот в петербургском порту составит около 3 млн TEU, и тогда почти все существующие мощности будут заняты.</p>\n<p align="justify">\n\tИсточник - <a href="http://www.infranews.ru/?object=news&amp;id=11797&amp;catid=3" target="_blank">Infranews</a></p>\n	\N	\N	2011-08-24 09:00:00+04	1721	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Мощность Петролеспорта увеличится на 40%	Мощность Петролеспорта увеличится на 40%	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании. Наращивания мощности является частью инвестиционной программы стоимостью $890 млн, которую холдинг реализует c 2007 г. Мощность &laquo;Петролеспорта&raquo; выросла с 650 000 до 1 млн TEU в 2008 году. К 2015 г. Global Ports хочет довести ее до 2,3 млн TEU в год, предполагается намыв 15 га новой территории.</p>\n<p align="justify">\n\tПредставители Global Ports не раскрывают загрузку &laquo;Петролеспорта&raquo;. В прошлом году терминал перевалил 541 120 TEU, что на 179% больше, чем в 2009 г. Global Ports управляет также контейнерным терминалом &laquo;Моби Дик&raquo; с мощностью 400 000 TEU в год, который, по словам представителей Global Ports, пока не будет расширяться. Его развитие зависит от ситуации на рынке.</p>\n<p align="justify">\n\tЗа первое полугодие 2011 г. стивидоры Большого порта Санкт-Петербург нарастили число переваленных контейнеров почти до 1,2 млн &mdash; на 35% по сравнению с тем же периодом 2010 г. Самый крупный терминал &mdash; Первый контейнерный (ПКТ) &mdash; увеличил грузооборот на 8% до 597 844 TEU, свидетельствуют данные пресс-службы Национальной контейнерной компании (НКК) (владеет ПКТ). Также НКК планирует осенью запустить первую очередь терминала мощностью 300 000 TEU в Усть-Луге. При этом в презентации для инвесторов, опубликованной на сайте Global Ports, сказано, что российские терминалы компании, расположенные на Балтике, загружены на 64%.</p>\n<p align="justify">\n\tПо прогнозам InfraNews, в этом году поток контейнеров в Петербурге вырастет на 25%. Если не будет радикальных изменений в экономике, в 2013 г. контейнерный оборот в петербургском порту составит около 3 млн TEU, и тогда почти все существующие мощности будут заняты.</p>\n<p align="justify">\n\tИсточник - <a href="http://www.infranews.ru/?object=news&amp;id=11797&amp;catid=3" target="_blank">Infranews</a></p>\n	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании. Наращивания мощности является частью инвестиционной программы стоимостью $890 млн, которую холдинг реализует c 2007 г. Мощность &laquo;Петролеспорта&raquo; выросла с 650 000 до 1 млн TEU в 2008 году. К 2015 г. Global Ports хочет довести ее до 2,3 млн TEU в год, предполагается намыв 15 га новой территории.</p>\n<p align="justify">\n\tПредставители Global Ports не раскрывают загрузку &laquo;Петролеспорта&raquo;. В прошлом году терминал перевалил 541 120 TEU, что на 179% больше, чем в 2009 г. Global Ports управляет также контейнерным терминалом &laquo;Моби Дик&raquo; с мощностью 400 000 TEU в год, который, по словам представителей Global Ports, пока не будет расширяться. Его развитие зависит от ситуации на рынке.</p>\n<p align="justify">\n\tЗа первое полугодие 2011 г. стивидоры Большого порта Санкт-Петербург нарастили число переваленных контейнеров почти до 1,2 млн &mdash; на 35% по сравнению с тем же периодом 2010 г. Самый крупный терминал &mdash; Первый контейнерный (ПКТ) &mdash; увеличил грузооборот на 8% до 597 844 TEU, свидетельствуют данные пресс-службы Национальной контейнерной компании (НКК) (владеет ПКТ). Также НКК планирует осенью запустить первую очередь терминала мощностью 300 000 TEU в Усть-Луге. При этом в презентации для инвесторов, опубликованной на сайте Global Ports, сказано, что российские терминалы компании, расположенные на Балтике, загружены на 64%.</p>\n<p align="justify">\n\tПо прогнозам InfraNews, в этом году поток контейнеров в Петербурге вырастет на 25%. Если не будет радикальных изменений в экономике, в 2013 г. контейнерный оборот в петербургском порту составит около 3 млн TEU, и тогда почти все существующие мощности будут заняты.</p>\n<p align="justify">\n\tИсточник - <a href="http://www.infranews.ru/?object=news&amp;id=11797&amp;catid=3" target="_blank">Infranews</a></p>\n	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании</p>\n	<p>\n\tК 2013 г. Global Ports планирует потратить $163 млн на увеличение мощности контейнерного терминала &laquo;Петролеспорта&raquo; на 400 000 TEU, сообщил &quot;Ведомостям&quot; представитель компании</p>\n
2	2011-08-24 19:27:14+04	t			Containerships реструктуризирует сервисы на Россию	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.</p>\n	containerships-restrukturiziruet-servisyi-na-2011-08-24-102714	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.<br />\n\t<br />\n\tКак рассказали SeaNews в Containerships, c начала сентября в Северной Европе и на Балтике будут работать 9 судов. Частоту обслуживания планируется увеличить, а время транзита сократить.<br />\n\t<br />\n\tВ частности, частота сервиса из Великобритании и стран Бенилюкса на Россию и Финляндию будет доведена до 4 раз в неделю.<br />\n\t<br />\n\tКак пояснили SeaNews в Containerships, применительно к Санкт-Петербургу будет сокращено время транзита и увеличена частота отправлений между Питером и портами Тизпорт и Роттердам.<br />\n\t<br />\n\tРешение закрыть сервис Северная Европа &ndash; Средиземноморье было принято в связи с сокращением объемов перевозок на этом направлении из-за сложной экономической ситуации. В этих условиях линия намерена сконцентрироваться на своих основных рынках в Северной Европе и на Балтике.<br />\n\t<br />\n\tПри этом Containerships продолжит работать на внутрисредиземноморском сервисе между портами Турции, Египта, Ливии и Туниса.&nbsp;</p>\n<p>\n\tSeanews</p>\n	\N	\N	2011-08-23 09:00:00+04	1722	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Containerships реструктуризирует сервисы на Россию	Containerships реструктуризирует сервисы на Россию	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.<br />\n\t<br />\n\tКак рассказали SeaNews в Containerships, c начала сентября в Северной Европе и на Балтике будут работать 9 судов. Частоту обслуживания планируется увеличить, а время транзита сократить.<br />\n\t<br />\n\tВ частности, частота сервиса из Великобритании и стран Бенилюкса на Россию и Финляндию будет доведена до 4 раз в неделю.<br />\n\t<br />\n\tКак пояснили SeaNews в Containerships, применительно к Санкт-Петербургу будет сокращено время транзита и увеличена частота отправлений между Питером и портами Тизпорт и Роттердам.<br />\n\t<br />\n\tРешение закрыть сервис Северная Европа &ndash; Средиземноморье было принято в связи с сокращением объемов перевозок на этом направлении из-за сложной экономической ситуации. В этих условиях линия намерена сконцентрироваться на своих основных рынках в Северной Европе и на Балтике.<br />\n\t<br />\n\tПри этом Containerships продолжит работать на внутрисредиземноморском сервисе между портами Турции, Египта, Ливии и Туниса.&nbsp;</p>\n<p>\n\tSeanews</p>\n	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.<br />\n\t<br />\n\tКак рассказали SeaNews в Containerships, c начала сентября в Северной Европе и на Балтике будут работать 9 судов. Частоту обслуживания планируется увеличить, а время транзита сократить.<br />\n\t<br />\n\tВ частности, частота сервиса из Великобритании и стран Бенилюкса на Россию и Финляндию будет доведена до 4 раз в неделю.<br />\n\t<br />\n\tКак пояснили SeaNews в Containerships, применительно к Санкт-Петербургу будет сокращено время транзита и увеличена частота отправлений между Питером и портами Тизпорт и Роттердам.<br />\n\t<br />\n\tРешение закрыть сервис Северная Европа &ndash; Средиземноморье было принято в связи с сокращением объемов перевозок на этом направлении из-за сложной экономической ситуации. В этих условиях линия намерена сконцентрироваться на своих основных рынках в Северной Европе и на Балтике.<br />\n\t<br />\n\tПри этом Containerships продолжит работать на внутрисредиземноморском сервисе между портами Турции, Египта, Ливии и Туниса.&nbsp;</p>\n<p>\n\tSeanews</p>\n	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.</p>\n	<p>\n\tContainerships проводит реструктуризацию своих балтийских сервисов на Россию, Финляндию и Прибалтику. Одновременно компания закрывает сервис Северная Европа &ndash; Средиземноморье.</p>\n
2	2011-08-24 19:29:00+04	t			НКК переставляет краны	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске</p>\n	nkk-perestavlyaet-kranyi-2011-08-24-102900	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске. Как объяснили SeaNews в &laquo;Национальной контейнерной компании&raquo;, речь не идет о полной эвакуации всего оборудования УТК. НКК сохраняет надежду вернуть себе терминал, однако решила перевести краны, которые там простаивают, туда, где они нужнее. (Ильичевский морской торговый порт не может использовать технику в собственности НКК и задействует только оборудование, находящееся в совместной деятельности).<br />\n\t<br />\n\tС учетом дополнительных кранов и другого поставленного в этом году оборудования, запуска &laquo;сухого порта&raquo; в Шушарах и расширения тыловой зоны, обрабатываемой по RTG-технологии, пропускная способность ПКТ теперь составляет 1,35 млн TEU против 1,1 млн TEU, озвучивавшихся в 2010г. (+ 22,7%). В НКК рассчитывают, что по итогам 2011г. контейнерооборот ПКТ будет близок к новому показателю пропускной способности.<br />\n\t<br />\n\tВместе с вновь прибывшими на ПКТ будут работать 16 RTG. Дополнительные краны позволят повысить пропускную способность терминала за счет увеличения емкости склада. &laquo;Это своего рода подготовка к зимней навигации, когда нагрузка на склад увеличивается. Именно мощность склада была главным сдерживающим моментом прошлой зимой&raquo;, &ndash; напомнил источник SeaNews на терминале.&nbsp;<br />\n\t<br />\n\tКраны прибыли на ПКТ на специализированном судне &laquo;Grietje&raquo; практически в собранном состоянии, разбирались только отдельные узлы. Погрузка в Ильичевске осуществлялась судовыми кранами. Судно с кранами прошло маршрут через Босфор &ndash; Бискай &ndash; Ла-Манш &ndash; Датские проливы за 12 суток. Сейчас краны проходят таможенное оформление. Планируется, что приступить к работе они смогут во второй половине сентября.</p>\n<p>\n\tSeaNews</p>\n	\N	\N	2011-08-23 09:00:00+04	1723	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	НКК переставляет краны	НКК переставляет краны	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске. Как объяснили SeaNews в &laquo;Национальной контейнерной компании&raquo;, речь не идет о полной эвакуации всего оборудования УТК. НКК сохраняет надежду вернуть себе терминал, однако решила перевести краны, которые там простаивают, туда, где они нужнее. (Ильичевский морской торговый порт не может использовать технику в собственности НКК и задействует только оборудование, находящееся в совместной деятельности).<br />\n\t<br />\n\tС учетом дополнительных кранов и другого поставленного в этом году оборудования, запуска &laquo;сухого порта&raquo; в Шушарах и расширения тыловой зоны, обрабатываемой по RTG-технологии, пропускная способность ПКТ теперь составляет 1,35 млн TEU против 1,1 млн TEU, озвучивавшихся в 2010г. (+ 22,7%). В НКК рассчитывают, что по итогам 2011г. контейнерооборот ПКТ будет близок к новому показателю пропускной способности.<br />\n\t<br />\n\tВместе с вновь прибывшими на ПКТ будут работать 16 RTG. Дополнительные краны позволят повысить пропускную способность терминала за счет увеличения емкости склада. &laquo;Это своего рода подготовка к зимней навигации, когда нагрузка на склад увеличивается. Именно мощность склада была главным сдерживающим моментом прошлой зимой&raquo;, &ndash; напомнил источник SeaNews на терминале.&nbsp;<br />\n\t<br />\n\tКраны прибыли на ПКТ на специализированном судне &laquo;Grietje&raquo; практически в собранном состоянии, разбирались только отдельные узлы. Погрузка в Ильичевске осуществлялась судовыми кранами. Судно с кранами прошло маршрут через Босфор &ndash; Бискай &ndash; Ла-Манш &ndash; Датские проливы за 12 суток. Сейчас краны проходят таможенное оформление. Планируется, что приступить к работе они смогут во второй половине сентября.</p>\n<p>\n\tSeaNews</p>\n	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске. Как объяснили SeaNews в &laquo;Национальной контейнерной компании&raquo;, речь не идет о полной эвакуации всего оборудования УТК. НКК сохраняет надежду вернуть себе терминал, однако решила перевести краны, которые там простаивают, туда, где они нужнее. (Ильичевский морской торговый порт не может использовать технику в собственности НКК и задействует только оборудование, находящееся в совместной деятельности).<br />\n\t<br />\n\tС учетом дополнительных кранов и другого поставленного в этом году оборудования, запуска &laquo;сухого порта&raquo; в Шушарах и расширения тыловой зоны, обрабатываемой по RTG-технологии, пропускная способность ПКТ теперь составляет 1,35 млн TEU против 1,1 млн TEU, озвучивавшихся в 2010г. (+ 22,7%). В НКК рассчитывают, что по итогам 2011г. контейнерооборот ПКТ будет близок к новому показателю пропускной способности.<br />\n\t<br />\n\tВместе с вновь прибывшими на ПКТ будут работать 16 RTG. Дополнительные краны позволят повысить пропускную способность терминала за счет увеличения емкости склада. &laquo;Это своего рода подготовка к зимней навигации, когда нагрузка на склад увеличивается. Именно мощность склада была главным сдерживающим моментом прошлой зимой&raquo;, &ndash; напомнил источник SeaNews на терминале.&nbsp;<br />\n\t<br />\n\tКраны прибыли на ПКТ на специализированном судне &laquo;Grietje&raquo; практически в собранном состоянии, разбирались только отдельные узлы. Погрузка в Ильичевске осуществлялась судовыми кранами. Судно с кранами прошло маршрут через Босфор &ndash; Бискай &ndash; Ла-Манш &ndash; Датские проливы за 12 суток. Сейчас краны проходят таможенное оформление. Планируется, что приступить к работе они смогут во второй половине сентября.</p>\n<p>\n\tSeaNews</p>\n	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске</p>\n	<p>\n\t23 августа на ПКТ были доставлены 4 крана RTG, ранее работавшие на терминале &laquo;Укртрансконтейнер&raquo; в Ильичевске</p>\n
2	2011-09-07 07:48:19+04	t			Новый сервис Maersk на Черном море	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n	novyij-servis-maersk-na-2011-09-06-224819	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n<p>\n\tСервис специализирован на доставке рефгрузов, прежде всего, бананов. Расписание восьми судов вместимостью 2500 TEU с большим числом рефподключений следующее: Guayaquil, Balboa, Colon, Algeciras, Izmit (Korfuz), Istanbul (Ambarli), Novorossisk, Odessa, Istanbul (Ambarli), Izmit (Korfuz), Algeciras, Balboa, Guayaquil.</p>\n<p>\n\tВ Новороссийске заходы сервиса будут осуществляться на терминал НУТЭП.</p>\n	\N	\N	2011-09-02 09:00:00+04	1724	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Новый сервис Maersk на Черном море	Новый сервис Maersk на Черном море	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n<p>\n\tСервис специализирован на доставке рефгрузов, прежде всего, бананов. Расписание восьми судов вместимостью 2500 TEU с большим числом рефподключений следующее: Guayaquil, Balboa, Colon, Algeciras, Izmit (Korfuz), Istanbul (Ambarli), Novorossisk, Odessa, Istanbul (Ambarli), Izmit (Korfuz), Algeciras, Balboa, Guayaquil.</p>\n<p>\n\tВ Новороссийске заходы сервиса будут осуществляться на терминал НУТЭП.</p>\n	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n<p>\n\tСервис специализирован на доставке рефгрузов, прежде всего, бананов. Расписание восьми судов вместимостью 2500 TEU с большим числом рефподключений следующее: Guayaquil, Balboa, Colon, Algeciras, Izmit (Korfuz), Istanbul (Ambarli), Novorossisk, Odessa, Istanbul (Ambarli), Izmit (Korfuz), Algeciras, Balboa, Guayaquil.</p>\n<p>\n\tВ Новороссийске заходы сервиса будут осуществляться на терминал НУТЭП.</p>\n	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n	<p>\n\tЛиния Maersk открыла новый линейный сервис Ecumed на направлении Эквадор &ndash; Панама &ndash; Вост.Средиземноморье/ Черное море.</p>\n
2	2011-12-08 02:40:03+04	t			Far Eastern Shipping Company (FESCo) will receive a USD 100 million loan from the European Bank	Far Eastern Shipping Company (FESCo) will receive\na USD 100 million loan from the European\nBank for Reconstruction and Development (EBRD)\nto upgrade the container terminal at Vladivostok.	kreditnoe-soglashenie-fesco-i-2011-12-07-164003	Far Eastern Shipping Company (FESCo) will receive\na USD 100 million loan from the European\nBank for Reconstruction and Development (EBRD)\nto upgrade the container terminal at Vladivostok.\nDuring the first nine months of this year, this 2-\nberth, 360-metre facility handled 314.000 TEU, an\nincrease of 28% year-on-year and more than its\ndesign capacity.	\N	\N	2011-12-07 10:00:00+04	1727	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Far Eastern Shipping Company (FESCo) will receive a USD 100 million loan from the European Bank	Кредитное соглашение FESCO и ЕБРР	Far Eastern Shipping Company (FESCo) will receive\na USD 100 million loan from the European\nBank for Reconstruction and Development (EBRD)\nto upgrade the container terminal at Vladivostok.\nDuring the first nine months of this year, this 2-\nberth, 360-metre facility handled 314.000 TEU, an\nincrease of 28% year-on-year and more than its\ndesign capacity.	<p>FESCO и ЕБРР подписали кредитное соглашение на 100 млн долл. По соглашению средства могут быть направлены на финансирование инфраструктурных проектов. Их у FESCO два – порт Владивосток (модернизация с переориентацией на контейнеры и другие чистые грузы с высокой добавленной стоимостью) и сухой терминал «Усады» под Москвой (новое строительство).<p>\nЗа первые 9 месяцев этого года, контейнерный терминал Владивостокского порта обработал 314 000 TEU – рост на 28% по сравнению с прошлым годом - , что уже превышает проектную мощность терминала.	Far Eastern Shipping Company (FESCo) will receive\na USD 100 million loan from the European\nBank for Reconstruction and Development (EBRD)\nto upgrade the container terminal at Vladivostok.	<p>\n\tFESCO и ЕБРР подписали кредитное соглашение на 100 млн долл. По соглашению средства могут быть направлены на финансирование инфраструктурных проектов.</p>\n
2	2011-12-08 02:41:36+04	t			Hamburg Sued and Seago Line (Maersk Line) will enhance their cooperation	Effective next month, Hamburg Sued and Seago\nLine (Maersk Line) will enhance their cooperation\nbetween North Europe and the East\nMediterranean.	hamburg-sued-i-seago-2011-12-07-164136	<p>\n\tEffective next month, Hamburg Sued and Seago Line (Maersk Line) will enhance their cooperation between North Europe and the East Mediterranean. In addition to the Aegean Sea service of Seago Line, on which Hamburg Sьd already hires space, the two carriers will start North Sea (Seago) and Levant sea (Hamburg Sьd), replacing Eurolev, Euromed and NESM, respectively.</p>\n<p>\n\tAs the new services will deploy larger ships (4,200 TEU instead of 2,600 TEU average) combined capacity will remain more or less unchanged. The revised network reads: - Levant Sea - Hamburg Sьd - 5x 4,200 TEU - Felixstowe, Antwerp, Hamburg, Algeciras, Tangier, Limassol, Alexandria, Port Said, Beirut, Lattakia, Mersin, Port Said, Algeciras and back to Felixstowe - North Sea - Seago - 4x 4,200 TEU - Rotterdam, Felixstowe, Bremerhaven, Antwerp, Haifa, Alexandria, Ashdod and back to Rotterdam - Aegean Sea - Seago - 4x 2,500 TEU - Felixstowe, Bremerhaven, Antwerp, Piraeus, Gebze, Istanbul, Gemlik, Izmir, Valencia, Felixstowe</p>\n	\N	\N	2011-12-07 10:00:00+04	1729	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hamburg Sued and Seago Line (Maersk Line) will enhance their cooperation	Hamburg Sued и Seago (Maersk Line) расширяют свое сотрудничество	<p>\n\tEffective next month, Hamburg Sued and Seago Line (Maersk Line) will enhance their cooperation between North Europe and the East Mediterranean. In addition to the Aegean Sea service of Seago Line, on which Hamburg Sьd already hires space, the two carriers will start North Sea (Seago) and Levant sea (Hamburg Sьd), replacing Eurolev, Euromed and NESM, respectively.</p>\n<p>\n\tAs the new services will deploy larger ships (4,200 TEU instead of 2,600 TEU average) combined capacity will remain more or less unchanged. The revised network reads: - Levant Sea - Hamburg Sьd - 5x 4,200 TEU - Felixstowe, Antwerp, Hamburg, Algeciras, Tangier, Limassol, Alexandria, Port Said, Beirut, Lattakia, Mersin, Port Said, Algeciras and back to Felixstowe - North Sea - Seago - 4x 4,200 TEU - Rotterdam, Felixstowe, Bremerhaven, Antwerp, Haifa, Alexandria, Ashdod and back to Rotterdam - Aegean Sea - Seago - 4x 2,500 TEU - Felixstowe, Bremerhaven, Antwerp, Piraeus, Gebze, Istanbul, Gemlik, Izmir, Valencia, Felixstowe</p>\n	<p>\n\tС декабря 2011 линии Hamburg Sued и Seago (Maersk Line) расширяют свое сотрудничество на направлении перевозок между Северной Европой и Восточным Средиземноморьем.</p>\n<p>\n\tВ дополнение к сервису Seago в Эгейском море, где Hamburg Sued уже имеет слоты, две линии запустят сервисы North Sea (Seago) и Levant (Hamburg Sued), заменяющие ранее существовавшие Eurolev, Euromed и NESM. Поскольку новые сервисы задействуют более крупные суда (4200 TEU вместо 2600 TEU), общая провозная мощность сервисов останется почти без изменений.</p>\n<p>\n\tНовая ротация совместных сервис выглядит следующим образом. - Levant Sea - Hamburg Sued - 5x 4,200 TEU - Феликстоу &ndash; Антверпен &ndash; Гамбург &ndash; Альхесирас &ndash; Тажир &ndash; Лимассол &ndash; Александрия &ndash; Порт Саид &ndash; Бейрут &ndash; Латтакия &ndash; Мерсин &ndash; Порт Саид &ndash; Альхесирас и обратно в Феликстоу. - North Sea - Seago - 4x 4,200 TEU &ndash; Роттердам &ndash; Феликстоу &ndash; Бремерхафн &ndash; Антверпен &ndash; Хайфа &ndash; Александрия &ndash; Ашдод и обратно в Роттердам - Aegean Sea - Seago - 4x 2,500 TEU &ndash; Феликстоу &ndash; Бремерхафн &ndash; Антверпен &ndash; Пирей &ndash; Гебзе &ndash; Стамбул &ndash; Гемлик &ndash; Измир &ndash; Валенсия &ndash; Феликстоу</p>\n	Effective next month, Hamburg Sued and Seago\nLine (Maersk Line) will enhance their cooperation\nbetween North Europe and the East\nMediterranean.	С декабря 2011 линии Hamburg Sued и Seago (Maersk Line) расширяют свое сотрудничество на направлении перевозок между Северной Европой и Восточным Средиземноморьем.\n
2	2011-12-08 02:40:50+04	t			MISC Berhad decided to exit the container liner business	\n\tMISC Berhad decided to exit the container liner business effective June 2012. 	misc-berhad-pokidaet-kontejnernyij-2011-12-07-164050	<p>\n\tMISC Berhad decided to exit the container liner business effective June 2012. The company was founded in November 1968 as Malaysia International Shipping Corporation Berhad to encourage the development of Malaysia&#39;s shipping industry and foreign trade. MISC&#39;s main deepsea trade was traditionally the Europe-Far East as a partner of consecutive consortia, such as ScanDutch, the Global Alliance and the Grand Alliance.</p>\n<p>\n\tIt resigned from the latter grouping effective January 2010 to focus on the wider intra-Asia routes (Middle East-Australia and all areas in between) thereby specialising in the carriage of Halal products. It currently operates a fleet of 20 units of between 700 TEU and 4,500 TEU, total 45,000 TEU.</p>\n	\N	\N	2011-12-07 10:00:00+04	1728	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MISC Berhad decided to exit the container liner business	MISC Berhad покидает контейнерный бизнес	<p>\n\tMISC Berhad decided to exit the container liner business effective June 2012. The company was founded in November 1968 as Malaysia International Shipping Corporation Berhad to encourage the development of Malaysia&#39;s shipping industry and foreign trade. MISC&#39;s main deepsea trade was traditionally the Europe-Far East as a partner of consecutive consortia, such as ScanDutch, the Global Alliance and the Grand Alliance.</p>\n<p>\n\tIt resigned from the latter grouping effective January 2010 to focus on the wider intra-Asia routes (Middle East-Australia and all areas in between) thereby specialising in the carriage of Halal products. It currently operates a fleet of 20 units of between 700 TEU and 4,500 TEU, total 45,000 TEU.</p>\n	<p>Линейный оператор MISC Berhad принял решение покинуть контейнерный бизнес с июня 2012 года. Линия была основана в ноябре 1968 года, как Malaysia International Shipping Corporation Berhad в целях развития судоходства и международной торговли Малайзии. Основным направлением перевозок MISC до недавнего времени являлось Дальний Восток – Европа, последовательно в составе альянсов ScanDutch, Global Alliance и Grand Alliance.\n<p>Последний альянс компания покинула в январе, для концентрации на внутриазиатских перевозках (Ближний Восток – Австралия и тразитные регионы), специализируясь на доставке халяльных продуктов. В настоящий момент MISC оперирует флотом из 20 судов вместимостью от 700 до 4500 TEU, общей вместимостью около 45000 TEU. 	\n\tMISC Berhad decided to exit the container liner business effective June 2012. 	Линейный оператор MISC Berhad принял решение покинуть контейнерный бизнес с июня 2012 года. 
2	2011-12-27 22:08:00+04	t			Grand, New World Shipping Lines Create New Far East-Europe Alliance	<p>\n\tSix leading container shipping lines have agreed to create one of the largest vessel networks in the Far East-to-Europe trade lane.</p>\n	alyansyi-linejnyih-perevozchikov-grand-2011-12-27-120800	<p>\n\tSix leading container shipping lines have agreed to create one of the largest vessel networks in the Far East-to-Europe trade lane.</p>\n<p>\n\tThe comprehensive agreement will bring together members of The New World and Grand alliances to create The G6 Alliance. New World Alliance members are APL, Hyundai Merchant Marine, and Mitsui O.S.K Lines. Grand Alliance members are Hapag-Lloyd AG, Nippon Yusen Kaisha and Orient Overseas Container Line.</p>\n<p>\n\tThe new partnership will create one of the leading networks in the Far East-to-Europe and Far East-to-Mediterranean container shipping markets with more than 90 ships in nine services calling at more than 40 ports in Asia, Europe and the Mediterranean. The integrated cooperation of these six lines will enable product and service features to be easily adjusted to market requirements.</p>\n<p>\n\t&ldquo;This is a milestone agreement that significantly improves service coverage in the Asia-Europe market,&rdquo; member carriers said in a statement. &ldquo;We will offer sailing frequencies and direct coverage that compete with anyone in the market.&ldquo;<br />\n\t.<br />\n\tThe new alliance is scheduled to begin operation by April 2012 with seven joint services operating between Asia and Europe and two services to the Mediterranean. It includes a direct Far East-Baltic service with calls at Gdansk, Poland and Gothenburg, Sweden as well as transshipment in Singapore.</p>\n<p>\n\tMember carriers said the new alliance will be characterized by fast transit times, broad port coverage and the latest vessels, with capacities of up to 14,000 TEU. The new alliance will enable the most efficient integration of the largest ship sizes that will be introduced over the next 30 months.</p>\n<p>\n\tThe nine joint services will offer more frequent departures with daily sailings from the major Asian, European and Mediterranean ports. The schedule will include multiple weekly calls at Singapore, South China, Rotterdam, Hamburg, Hong Kong Shanghai and Southampton.</p>\n<p>\n\tThe ports of call also include Le Havre, Antwerp, Bremerhaven, Thamesport, the Bohai Bay ports of Dalian and Xingang, Ningbo, Qingdao, Xiamen, Kaohsiung, Cai Mep, Japanese ports, Colombo, Jeddah, and Port Said.</p>\n<p>\n\t&ldquo;The extensive port coverage, frequent sailings and very attractive transit times make the nine services a unique product with the best and most comprehensive set of connections on offer for all shippers in the Far East-Europe/Mediterranean trade,&rdquo; members of the new alliance said.</p>\n<p>\n\tThe base-plan port rotation of the nine loops is as follows.</p>\n<ul type="disc">\n\t<li>\n\t\tLoop 1: Japan &ndash; Hong Kong&nbsp;&ndash; Cai Mep &ndash; Singapore &ndash; Jeddah &ndash; Rotterdam &ndash; Hamburg &ndash; Southampton &ndash; Le Havre &ndash; Singapore &ndash; Hong Kong &ndash; Japan,</li>\n\t<li>\n\t\tLoop 2: Dalian &ndash; Xingang &ndash; Pusan &ndash; Qingdao &ndash; Singapore &ndash; Hamburg &ndash; Antwerp &ndash; Southampton &ndash; Salalah &ndash; Jebel Ali &ndash; Singapore &ndash; Pusan &ndash; Dalian,</li>\n\t<li>\n\t\tLoop 3: Shanghai &ndash; Ningbo &ndash; South China &ndash; Singapore &ndash; Tangier &ndash; Rotterdam &ndash; Bremerhaven &ndash; Gdansk &ndash; Gothenburg &ndash; Rotterdam &ndash; Jeddah &ndash; Singapore &ndash; South China &ndash; Hong Kong &ndash; Shanghai,</li>\n\t<li>\n\t\tLoop 4: Shanghai &ndash; Ningbo &ndash; South China &ndash; Singapore &ndash; Southampton &ndash; Hamburg &ndash; Rotterdam &ndash; Singapore &ndash;South China &ndash; Shanghai,</li>\n\t<li>\n\t\tLoop 5: Kwangyang &ndash; Pusan &ndash; Shanghai &ndash; South China &ndash; Singapore &ndash; Le Havre &ndash; Rotterdam &ndash; Hamburg &ndash; Thamesport &ndash; Singapore &ndash; Kwangyang,</li>\n\t<li>\n\t\tLoop 6: Kaohsiung &ndash; Xiamen &ndash; South China &ndash; Hong Kong &ndash; Singapore &ndash; Colombo &ndash; Southampton &ndash; Hamburg &ndash; Rotterdam &ndash; Singapore &ndash; South China &ndash; Kaohsiung,</li>\n\t<li>\n\t\tLoop 7: Qingdao &ndash; Shanghai &ndash; Ningbo &ndash; Hong Kong &ndash; South China &ndash; Singapore &ndash; Salalah &ndash; Rotterdam &ndash; Hamburg &ndash; Southampton &ndash; Tangier &ndash; Port Said &ndash; Singapore &ndash; South China &ndash; Qingdao,</li>\n\t<li>\n\t\tLoop 8 : Pusan &ndash; Shanghai &ndash; Ningbo &ndash; South China &ndash; Hong Kong &ndash; Singapore &ndash; Port Klang &ndash; Jeddah &ndash; Damietta &ndash; Genoa &ndash; FOS Sur Mer &ndash; Barcelona &ndash; Valencia &ndash; Damietta &ndash; Jeddah &ndash; Singapore &ndash; Hong Kong,</li>\n\t<li>\n\t\tLoop 9: (Asia / Black Sea) To be determined.</li>\n</ul>\n<p>\n\tPlans are subject to change based on changing market conditions.</p>\n<p>\n\tSource: The Journal of Commerce Online</p>\n	\N	\N	2011-12-20 10:00:00+04	1731	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Grand, New World Shipping Lines Create New Far East-Europe Alliance	Альянсы линейных перевозчиков Grand и New World создают мега-альянс на направлении Дальний Восток - Европа	<p>\n\tSix leading container shipping lines have agreed to create one of the largest vessel networks in the Far East-to-Europe trade lane.</p>\n<p>\n\tThe comprehensive agreement will bring together members of The New World and Grand alliances to create The G6 Alliance. New World Alliance members are APL, Hyundai Merchant Marine, and Mitsui O.S.K Lines. Grand Alliance members are Hapag-Lloyd AG, Nippon Yusen Kaisha and Orient Overseas Container Line.</p>\n<p>\n\tThe new partnership will create one of the leading networks in the Far East-to-Europe and Far East-to-Mediterranean container shipping markets with more than 90 ships in nine services calling at more than 40 ports in Asia, Europe and the Mediterranean. The integrated cooperation of these six lines will enable product and service features to be easily adjusted to market requirements.</p>\n<p>\n\t&ldquo;This is a milestone agreement that significantly improves service coverage in the Asia-Europe market,&rdquo; member carriers said in a statement. &ldquo;We will offer sailing frequencies and direct coverage that compete with anyone in the market.&ldquo;<br />\n\t.<br />\n\tThe new alliance is scheduled to begin operation by April 2012 with seven joint services operating between Asia and Europe and two services to the Mediterranean. It includes a direct Far East-Baltic service with calls at Gdansk, Poland and Gothenburg, Sweden as well as transshipment in Singapore.</p>\n<p>\n\tMember carriers said the new alliance will be characterized by fast transit times, broad port coverage and the latest vessels, with capacities of up to 14,000 TEU. The new alliance will enable the most efficient integration of the largest ship sizes that will be introduced over the next 30 months.</p>\n<p>\n\tThe nine joint services will offer more frequent departures with daily sailings from the major Asian, European and Mediterranean ports. The schedule will include multiple weekly calls at Singapore, South China, Rotterdam, Hamburg, Hong Kong Shanghai and Southampton.</p>\n<p>\n\tThe ports of call also include Le Havre, Antwerp, Bremerhaven, Thamesport, the Bohai Bay ports of Dalian and Xingang, Ningbo, Qingdao, Xiamen, Kaohsiung, Cai Mep, Japanese ports, Colombo, Jeddah, and Port Said.</p>\n<p>\n\t&ldquo;The extensive port coverage, frequent sailings and very attractive transit times make the nine services a unique product with the best and most comprehensive set of connections on offer for all shippers in the Far East-Europe/Mediterranean trade,&rdquo; members of the new alliance said.</p>\n<p>\n\tThe base-plan port rotation of the nine loops is as follows.</p>\n<ul type="disc">\n\t<li>\n\t\tLoop 1: Japan &ndash; Hong Kong&nbsp;&ndash; Cai Mep &ndash; Singapore &ndash; Jeddah &ndash; Rotterdam &ndash; Hamburg &ndash; Southampton &ndash; Le Havre &ndash; Singapore &ndash; Hong Kong &ndash; Japan,</li>\n\t<li>\n\t\tLoop 2: Dalian &ndash; Xingang &ndash; Pusan &ndash; Qingdao &ndash; Singapore &ndash; Hamburg &ndash; Antwerp &ndash; Southampton &ndash; Salalah &ndash; Jebel Ali &ndash; Singapore &ndash; Pusan &ndash; Dalian,</li>\n\t<li>\n\t\tLoop 3: Shanghai &ndash; Ningbo &ndash; South China &ndash; Singapore &ndash; Tangier &ndash; Rotterdam &ndash; Bremerhaven &ndash; Gdansk &ndash; Gothenburg &ndash; Rotterdam &ndash; Jeddah &ndash; Singapore &ndash; South China &ndash; Hong Kong &ndash; Shanghai,</li>\n\t<li>\n\t\tLoop 4: Shanghai &ndash; Ningbo &ndash; South China &ndash; Singapore &ndash; Southampton &ndash; Hamburg &ndash; Rotterdam &ndash; Singapore &ndash;South China &ndash; Shanghai,</li>\n\t<li>\n\t\tLoop 5: Kwangyang &ndash; Pusan &ndash; Shanghai &ndash; South China &ndash; Singapore &ndash; Le Havre &ndash; Rotterdam &ndash; Hamburg &ndash; Thamesport &ndash; Singapore &ndash; Kwangyang,</li>\n\t<li>\n\t\tLoop 6: Kaohsiung &ndash; Xiamen &ndash; South China &ndash; Hong Kong &ndash; Singapore &ndash; Colombo &ndash; Southampton &ndash; Hamburg &ndash; Rotterdam &ndash; Singapore &ndash; South China &ndash; Kaohsiung,</li>\n\t<li>\n\t\tLoop 7: Qingdao &ndash; Shanghai &ndash; Ningbo &ndash; Hong Kong &ndash; South China &ndash; Singapore &ndash; Salalah &ndash; Rotterdam &ndash; Hamburg &ndash; Southampton &ndash; Tangier &ndash; Port Said &ndash; Singapore &ndash; South China &ndash; Qingdao,</li>\n\t<li>\n\t\tLoop 8 : Pusan &ndash; Shanghai &ndash; Ningbo &ndash; South China &ndash; Hong Kong &ndash; Singapore &ndash; Port Klang &ndash; Jeddah &ndash; Damietta &ndash; Genoa &ndash; FOS Sur Mer &ndash; Barcelona &ndash; Valencia &ndash; Damietta &ndash; Jeddah &ndash; Singapore &ndash; Hong Kong,</li>\n\t<li>\n\t\tLoop 9: (Asia / Black Sea) To be determined.</li>\n</ul>\n<p>\n\tPlans are subject to change based on changing market conditions.</p>\n<p>\n\tSource: The Journal of Commerce Online</p>\n	<p>\n\tШесть контейнерных линий, работающих на направлении Дальний Восток &ndash; Европа, образовали новый альянс. В него вошли перевозчики, входящие в альянсы The New World (APL, Hyundai Merchant Marine и MOL) и Grand Alliance (Hapag-Lloyd, NYK и OOCL). Новый суперальянс получил название The G6 Alliance.</p>\n<p>\n\tВ распоряжении партнеров более 90 судов, занятых на 9 сервисах между более чем 40 портами Азии, Европы и Средиземноморья (для сравнения, на Daily Maersk занято 70 контейнеровозов). Задача сформулирована так: &laquo;Мы предложим частоту судозаходов и прямое покрытие портов, позволяющие конкурировать с любым другим игроком на рынке&raquo;.</p>\n<p>\n\tНовый альянс начнет операции совместные операции к апрелю 2012 года. Будет 7 сервисов на Европу и два на Средиземное море. В том числе планируются прямые deep sea на Балтику и на Черное море. На сервисах будут работать суда вместимостью до 14 тыс. TEU.</p>\n<p>\n\tРотации сервисов:</p>\n<ul type="disc">\n\t<li>\n\t\tLoop 1: Япония &ndash; Гонконг&nbsp;&ndash; Кай Меп &ndash; Сингапур &ndash; Джидда &ndash; Роттердам &ndash; Гамбург &ndash; Саутгемптон &ndash; Гавр &ndash; Сингапур &ndash; Гонконг &ndash; Япония,</li>\n\t<li>\n\t\tLoop 2: Далянь &ndash; Синган &ndash; Пусан &ndash; Циндао &ndash; Сингапур &ndash; Гамбург &ndash; Антверпен &ndash; Саутгемптон &ndash; Салала &ndash; Джебель-Али &ndash; Сингапур &ndash; Пусан &ndash; Далянь,</li>\n\t<li>\n\t\tLoop 3: Шанхай &ndash; Нинбо &ndash; Южный Китай &ndash; Сингапур &ndash; Танжер &ndash; Роттердам &ndash; Бремерхафен &ndash; Гданьск &ndash; Гетеборг &ndash; Роттердам &ndash; Джидда &ndash; Сингапур &ndash; Южный Китай &ndash; Гонконг &ndash; Шанхай,</li>\n\t<li>\n\t\tLoop 4: Шанхай &ndash; Нинбо &ndash; Южный Китай &ndash; Сингапур &ndash; Саутгемптон &ndash; Гамбург &ndash; Роттердам &ndash; Сингапур &ndash; Южный Китай &ndash; Шанхай,</li>\n\t<li>\n\t\tLoop 5: Кваньянг &ndash; Пусан &ndash; Шанхай &ndash; Южный Китай &ndash; Сингапур &ndash; Гавр &ndash; Роттердам &ndash; Гамбург &ndash; Темзпорт &ndash; Сингапур &ndash; Кваньянг,</li>\n\t<li>\n\t\tLoop 6: Гаосюн &ndash; Сямэнь &ndash; Южный Китай &ndash; Гонконг &ndash; Сингапур &ndash; Коломбо &ndash; Саутгемптон &ndash; Гамбург &ndash; Роттердам &ndash; Сингапур &ndash; Южный Китай &ndash; Гаосюн,</li>\n\t<li>\n\t\tLoop 7: Циндао &ndash; Шанхай &ndash; Нинбо &ndash; Гонконг &ndash; Южный Китай &ndash; Сингапур &ndash; Салала &ndash; Роттердам &ndash; Гамбург &ndash; Саутгемптон &ndash; Танжер &ndash; Порт-Саид &ndash; Сингапур &ndash; Южный Китай &ndash; Циндао,</li>\n\t<li>\n\t\tLoop 8: Пусан &ndash; Шанхай &ndash; Нинбо &ndash; Южный Китай &ndash; Гонконг &ndash; Сингапур &ndash; Порт-Кланг &ndash; Джидда &ndash; Дамьетта &ndash; Генуя &ndash; Фос-сюр-Мер &ndash; Барселона &ndash; Валенсия &ndash; Дамьетта &ndash; Джидда &ndash; Сингапур &ndash; Гонконг.</li>\n\t<li>\n\t\tLoop 9: Азия &ndash; Черное море (ротация будет определена позже).</li>\n</ul>\n<p>\n\tИсточник: Seanews</p>\n	<p>\n\tSix leading container shipping lines have agreed to create one of the largest vessel networks in the Far East-to-Europe trade lane.</p>\n	<p>\n\tШесть контейнерных линий, работающих на направлении Дальний Восток &ndash; Европа, образовали новый альянс. В него вошли перевозчики, входящие в альянсы The New World (APL, Hyundai Merchant Marine и MOL) и Grand Alliance (Hapag-Lloyd, NYK и OOCL). Новый суперальянс получил название The G6 Alliance.</p>\n
2	2012-01-19 03:03:32+04	t			ULCT goes live	<p>\n\t&ldquo;Ust-Luga Container Terminal&raquo; (ULCT), belonging to the National Container Company (NCC), accepted the first container vessel. M/v Emotion of Unifeeder, capacity 1440 TEU, arrived from Hamburg on Dec. 29th. It is expected that Unifeeder vessels will call the terminal on weekly basis.</p>\n	unifeeder-nachal-servis-na-2012-01-18-170332	<p>\n\t&ldquo;Ust-Luga Container Terminal&raquo; (ULCT), belonging to the National Container Company (NCC), accepted the first container vessel. M/v Emotion of Unifeeder, capacity 1440 TEU, arrived from Hamburg on Dec. 29th. It is expected that Unifeeder vessels will call the terminal on weekly basis.</p>\n<p>\n\tULCT will be developed in three phases. ULCT&rsquo;s first phase was completed at the end of November, 2011.Its full development will be completed till 2025 with the approximate capacity of 3M TEU per year. ULCT is the first Russian deep-water and easy-to-access container terminal in the Baltic Sea region.</p>\n<p>\n\tULCT is expected to provide the handling capacity essential for supporting the growth of Russian foreign trade.</p>\n<p>\n\tSource: NCC</p>\n	\N	\N	2011-12-29 10:00:00+04	1732	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	ULCT goes live	Unifeeder начал сервис на УЛКТ	<p>\n\t&ldquo;Ust-Luga Container Terminal&raquo; (ULCT), belonging to the National Container Company (NCC), accepted the first container vessel. M/v Emotion of Unifeeder, capacity 1440 TEU, arrived from Hamburg on Dec. 29th. It is expected that Unifeeder vessels will call the terminal on weekly basis.</p>\n<p>\n\tULCT will be developed in three phases. ULCT&rsquo;s first phase was completed at the end of November, 2011.Its full development will be completed till 2025 with the approximate capacity of 3M TEU per year. ULCT is the first Russian deep-water and easy-to-access container terminal in the Baltic Sea region.</p>\n<p>\n\tULCT is expected to provide the handling capacity essential for supporting the growth of Russian foreign trade.</p>\n<p>\n\tSource: NCC</p>\n	<p>\n\t&laquo;Усть-Лужский Контейнерный Терминал&raquo; (УЛКТ), входящий в группу &laquo;Национальная Контейнерная Компания&raquo; (НКК), обработал первое судно. Контейнеровоз Emotion компании Unifeeder вместимостью 1440 TEU прибыл из Гамбурга. Планируется, что судно будет заходить на терминал еженедельно.</p>\n<p>\n\tСтроительство УЛКТ реализуется в три стадии. Первая очередь завершена в конце ноября 2011 года. Полного развития терминал достигнет к 2025 году, когда его пропускная способность составит порядка 3 млн TEU. УЛКТ станет крупнейшим и наиболее современным контейнерным терминалом Балтийского региона. Ввод терминала в эксплуатацию позволит удовлетворить растущий спрос на перевалку российских контейнерных грузов.</p>\n<p>\n\tИсточник: НКК</p>\n	<p>\n\t&ldquo;Ust-Luga Container Terminal&raquo; (ULCT), belonging to the National Container Company (NCC), accepted the first container vessel. M/v Emotion of Unifeeder, capacity 1440 TEU, arrived from Hamburg on Dec. 29th. It is expected that Unifeeder vessels will call the terminal on weekly basis.</p>\n	<p>\n\t&laquo;Усть-Лужский Контейнерный Терминал&raquo; (УЛКТ), входящий в группу &laquo;Национальная Контейнерная Компания&raquo; (НКК), обработал первое судно. Контейнеровоз Emotion компании Unifeeder вместимостью 1440 TEU прибыл из Гамбурга. Планируется, что судно будет заходить на терминал еженедельно.</p>\n
2	2012-01-23 19:19:41+04	t			International turnover of containers in Russian ports in 2011	In 2011 Russian container ports handled 4 151 056 TEU (laden and empty containers), which is 30,4% than a year before.	vneshnetorgovyij-oborot-kontejnernyih-portov-2012-01-23-091941	<p>\n\tIn 2011 Russian container ports handled 4 151 056 TEU (laden and empty containers), which is 30,4% than a year before.</p>\n<p>\n\tRussia&rsquo;s largest container port remains St. Petersburg, it handled&nbsp;2 355 861&nbsp;TEU (+22,6%).</p>\n<p>\n\tThe second best results were achieved by Novorossiysk in Black Sea &ndash; 634 960 TEU (+48,3%)</p>\n<p>\n\tThe biggest in Russian Pacific port of Vladivostok handled 443 088 (excluding cabotage volumes) &ndash; the growth +50,2%</p>\n	\N	\N	2012-01-21 10:00:00+04	1735	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	International turnover of containers in Russian ports in 2011	Внешнеторговый оборот контейнерных портов РФ	<p>\n\tIn 2011 Russian container ports handled 4 151 056 TEU (laden and empty containers), which is 30,4% than a year before.</p>\n<p>\n\tRussia&rsquo;s largest container port remains St. Petersburg, it handled&nbsp;2 355 861&nbsp;TEU (+22,6%).</p>\n<p>\n\tThe second best results were achieved by Novorossiysk in Black Sea &ndash; 634 960 TEU (+48,3%)</p>\n<p>\n\tThe biggest in Russian Pacific port of Vladivostok handled 443 088 (excluding cabotage volumes) &ndash; the growth +50,2%</p>\n	<p>\n\tПо итогам 2011 года российские порты обработали во внешнеторговом обороте 4 151 056 TEU, что на 30,4% больше, чем в 2010.<br />\n\tКрупнейшим контейнерным портом РФ в 2011 оставался Санкт-Петербург, объем перевалки в Большом порту составил&nbsp;2 355 861&nbsp;TEU (+22,6%)<br />\n\tВторым по величине портом страны в 2011 был Новороссийск &ndash; 634 960 TEU (+48,3%)<br />\n\tВладивостокский порт переработал 443 088 TEU (без учёта каботажа) &ndash; рост +50,2%</p>\n	In 2011 Russian container ports handled 4 151 056 TEU (laden and empty containers), which is 30,4% than a year before.	По итогам 2011 года российские порты обработали во внешнеторговом обороте 4 151 056 TEU, что на 30,4% больше, чем в 2010.
2	2012-01-23 19:20:44+04	t			Maersk strengthens "Ecumed"	<p>\n\tMaersk Line is to boost the capacity of its reefer-oriented Ecuador- Panama-Black Sea &#39;Ecumed&#39; service. Launched in September 2011, the service has since been operated with a fleet of eight high reefer capacity ships of 2,500 teu.</p>\n	maersk-usilivaet-servis-ecumed-2012-01-23-092044	<p>\n\tMaersk Line is to boost the capacity of its reefer-oriented Ecuador-Panama-Black Sea &#39;Ecumed&#39; service. Launched in September 2011,&nbsp; the service has since been operated with a fleet of eight high reefer capacity ships of 2,500 teu. These vessels are currently being re-placed by ships of 2,800-3,200 teu. The &#39;Ecumed&#39; connects Guayaquil directly with Spain, Turkey and the Black Sea, focusing in particular on Ecuador&#39;s banana exports.</p>\n	\N	\N	2012-01-10 10:00:00+04	1737	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk strengthens "Ecumed"	Маерск усиливает сервис Ecumed	<p>\n\tMaersk Line is to boost the capacity of its reefer-oriented Ecuador-Panama-Black Sea &#39;Ecumed&#39; service. Launched in September 2011,&nbsp; the service has since been operated with a fleet of eight high reefer capacity ships of 2,500 teu. These vessels are currently being re-placed by ships of 2,800-3,200 teu. The &#39;Ecumed&#39; connects Guayaquil directly with Spain, Turkey and the Black Sea, focusing in particular on Ecuador&#39;s banana exports.</p>\n	<p>\n\tМаерск планирует увеличить мощность своего сервиса Ecumed, работающего на правлении Южная Америка &ndash; Черное море.<br />\n\tЗапущенный в сентябре 2011, сервис обслуживался флотом из восьми контейнеровозов вместимостью 2500 TEU. Сейчас эти суда замещаются более крупными, размером 2800-3200 TEU.<br />\n\tEcumed связывает порт Гуякиль в Эксвадоре с портами Испании, Турции и Черного моря (Новороссийск и Южный), специализируясь на перевозке бананов из Эквадора.</p>\n	<p>\n\tMaersk Line is to boost the capacity of its reefer-oriented Ecuador- Panama-Black Sea &#39;Ecumed&#39; service. Launched in September 2011, the service has since been operated with a fleet of eight high reefer capacity ships of 2,500 teu.</p>\n	Маерск планирует увеличить мощность своего сервиса Ecumed, работающего на правлении Южная Америка – Черное море.
2	2012-02-03 17:57:13+04	t			CMA CGM Raises Asia-Mediterranean-Europe Rates	CMA CGM announced a rate increase of $750 per 20 foot container on the Asia-Mediterranean-North Europe route effective March 1, mirroring recent rate hikes by close rivals Maersk Line and Hapag-Lloyd.	cma-cgm-povyishaet-stavki-2012-02-03-075713	<p>\n\tCMA CGM announced a rate increase of $750 per 20 foot container on the Asia-Mediterranean-North Europe route effective March 1, mirroring recent rate hikes by close rivals Maersk Line and Hapag-Lloyd.</p>\n<p>\n\tThe French carrier said the increase consists of a $200 per TEU rate restoration and a $550 per TEU interim fuel surcharge. The hikes are in response to an &ldquo;unprecedented&rdquo; decline in rates in 2011, a sharp increase in bunker prices and deteriorating operating conditions in Asian ports.</p>\n<p>\n\t&ldquo;The present level of freight rates is insufficient to cover ships costs including port and Suez Canal costs as well as bunkers,&rdquo;&nbsp;<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=65" target="_blank">CMA CGM said</a>.<br />\n\tThe tendency to quote &ldquo;all in&rdquo; rates, including surcharges such as bunker adjustment factor, currency adjustment factor, Aden Gulf surcharge, Suez surcharge, has left carriers without any proper coverage of the costs, the Marseilles-based carrier said.</p>\n<p>\n\tThe higher rates will apply to containers shipped from all Asian ports, including Japan, South East Asia Colombo and Bangladesh, to all northern European ports and to the Mediterranean, Adriatic Sea, Black Sea and North Africa. The higher rate applies to dry cargo, out of gauge cargo, paying empties, break bulk and refrigerated cargo.</p>\n	\N	\N	2012-02-01 10:00:00+04	1744	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	CMA CGM Raises Asia-Mediterranean-Europe Rates	CMA CGM повышает ставки на направлении Азия – Средиземное море - Европа	<p>\n\tCMA CGM announced a rate increase of $750 per 20 foot container on the Asia-Mediterranean-North Europe route effective March 1, mirroring recent rate hikes by close rivals Maersk Line and Hapag-Lloyd.</p>\n<p>\n\tThe French carrier said the increase consists of a $200 per TEU rate restoration and a $550 per TEU interim fuel surcharge. The hikes are in response to an &ldquo;unprecedented&rdquo; decline in rates in 2011, a sharp increase in bunker prices and deteriorating operating conditions in Asian ports.</p>\n<p>\n\t&ldquo;The present level of freight rates is insufficient to cover ships costs including port and Suez Canal costs as well as bunkers,&rdquo;&nbsp;<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=65" target="_blank">CMA CGM said</a>.<br />\n\tThe tendency to quote &ldquo;all in&rdquo; rates, including surcharges such as bunker adjustment factor, currency adjustment factor, Aden Gulf surcharge, Suez surcharge, has left carriers without any proper coverage of the costs, the Marseilles-based carrier said.</p>\n<p>\n\tThe higher rates will apply to containers shipped from all Asian ports, including Japan, South East Asia Colombo and Bangladesh, to all northern European ports and to the Mediterranean, Adriatic Sea, Black Sea and North Africa. The higher rate applies to dry cargo, out of gauge cargo, paying empties, break bulk and refrigerated cargo.</p>\n	<p>\n\tЛиния CMA CGM объявила о повышении ставок фрахта на $750 за TEU на направлении Азия &ndash; Средиземное море &ndash; Северная Европа с 1 марта 2012. Данный шаг последовал в череде ранее объявленных повышений других крупных перевозчиков Maersk и Hapag Lloyd.</p>\n<p>\n\tЛиния сообщила, что повышение будет состоять из двух составляющих: $200 за TEU надбавка по восстановлению доходности и $550 за TEU &ndash; временная топливная надбавка. Увеличение ставок линиями является ответом на &laquo;беспрецедентные&raquo; падение ставок в 2011 году, резкое увеличение стоимости топлива и ухудшение эксплуатационных условий в Азиатских портах.&nbsp;</p>\n<p>\n\t&ldquo;Текущий уровень фрахтовых ставок является недостаточным для покрытия судовых расходов, в том числе по оплате бункера, портовых сборов и прохождения Суэцкого канала&rdquo;, - сообщил&nbsp;<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=65" target="_blank">CMA CGM</a>.</p>\n<p>\n\tФормат котирования ставок &laquo;all-in&raquo; или &laquo;все включено&raquo;, где в ставку включаются такие основные надбавки как бункерная, валютная, за прохождение Аденского залива и Суэцкого канала &ndash; лишили перевозчиков инструментов для покрытия своих переменных расходов &ndash; сообщила линия.&nbsp;</p>\n<p>\n\tУвеличенные ставки фрахта будут распространяться на контейнеры отправляемые из всех портов Азии, в т.ч. Японии, ЮВ Азии , Шри Ланки и Бангладеш &ndash; на все порты Северной Европы, порты Средиземного, Адриатического и Черного морей. Надбавки будут действовать по отношению к контейнерам со стандартными сухими, негабаритными, насыпными, скоропортящимися грузами и к оплачиваемым порожним контейнерам.</p>\n	CMA CGM announced a rate increase of $750 per 20 foot container on the Asia-Mediterranean-North Europe route effective March 1, mirroring recent rate hikes by close rivals Maersk Line and Hapag-Lloyd.	Линия CMA CGM объявила о повышении ставок фрахта на $750 за TEU на направлении Азия – Средиземное море – Северная Европа с 1 марта 2012. Данный шаг последовал в череде ранее объявленных повышений других крупных перевозчиков Maersk и Hapag Lloyd. 
2	2012-01-26 00:43:21+04	t			The new block-train launched by GCS	The railway operator Ruscon, belonging the GCS group launched the new block-train from the port of Novorossiysk from December 2011.  	novyij-marshrut-kontejnernyih-poezdov-2012-01-25-144321	<p>\n\tThe railway operator Ruscon, belonging the GCS group launched the new block-train from the port of Novorossiysk from December 2011.&nbsp;</p>\n<p>\n\tTwice a week it offers delivery of 56 to 64 x 40&#39; containers to the r/w station Tikhonovo in Elabuga, Tatarstan.&nbsp;</p>\n<p>\n\tBlock-trains depart from the NLE terminal, however containers from the other port terminals of Novorossiysk are accepted too.&nbsp;</p>\n<p>\n\tFixed transit time from Novorossiysk to Tikhonovo is 4 days.&nbsp;</p>\n<p>\n\tThe main commodity presently carried by Ruscon trains on this route are CKD parts for car-assembly factories in Elabuga.</p>\n	\N	\N	2012-01-20 10:00:00+04	1817	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	The new block-train launched by GCS	Новый маршрут контейнерных поездов из Новороссийска	<p>\n\tThe railway operator Ruscon, belonging the GCS group launched the new block-train from the port of Novorossiysk from December 2011.&nbsp;</p>\n<p>\n\tTwice a week it offers delivery of 56 to 64 x 40&#39; containers to the r/w station Tikhonovo in Elabuga, Tatarstan.&nbsp;</p>\n<p>\n\tBlock-trains depart from the NLE terminal, however containers from the other port terminals of Novorossiysk are accepted too.&nbsp;</p>\n<p>\n\tFixed transit time from Novorossiysk to Tikhonovo is 4 days.&nbsp;</p>\n<p>\n\tThe main commodity presently carried by Ruscon trains on this route are CKD parts for car-assembly factories in Elabuga.</p>\n	<p>\n\tЖелезнодорожный оператор &quot;Рускон&quot;, входящий в группу ГКС, запустил новый&nbsp;контейнерный маршрут.</p>\n<p>\n\tДважды в неделю регулярный поезд обеспечивает&nbsp;доставку от&nbsp;56 до 64&nbsp;40-футовых контейнеров&nbsp;на станцию Тихоново (Елабуга, Татарстан).</p>\n<p>\n\tОтправки&nbsp;поездов осуществляются из терминала НЛЭ, однако имеется возможность приёма груза и из других терминалов Новороссийска.</p>\n<p>\n\tТранзитное время Новороссийск -&nbsp;Тихоново&nbsp;- около 4&nbsp;суток.&nbsp;</p>\n<p>\n\tОсновным грузом, доставляемым поездами &quot;Рускона&quot; по данному маршруту, являются комплектующие для автосборочных производств в Елабуге.</p>\n	The railway operator Ruscon, belonging the GCS group launched the new block-train from the port of Novorossiysk from December 2011.  	<p>\n\tЖелезнодорожный оператор &quot;Рускон&quot;, входящий в группу ГКС, запустил новый контейнерный маршрут.</p>\n
2	2012-01-26 00:45:26+04	t			Hapag-Lloyd will enlarge capacity on Caribbean – Ecuador Service (SW2) and revise northbound schedule.	Hapag Lloyd has informed that during first quarter of this year it will enlarge capacity on the Caribbean – Ecuador service (SW2) by replacing current ships of about 1.800 teus with ships of about 3.100 teus (nominal capacity).	uvelichenie-tonnazha-na-servise-2012-01-25-144526	<p>\n\tHapag Lloyd has informed that during first quarter of this year it will enlarge capacity on the Caribbean &ndash; Ecuador service (SW2) by replacing current ships of about 1.800 teus with ships of about 3.100 teus (nominal capacity).</p>\n<p>\n\tWhilst the northbound rotation will no longer include calls at Caucedo, this market will continue to be covered by Chile &ndash; Peru Express service (SW1) which offers sufficient capacity at identical transit times.</p>\n<p>\n\tFurthermore a potential Buenaventura northbound call is still under review on the Caribbean &ndash; Ecuador service (SW2).<br />\n\tThe new proforma schedule covering the northbound leg of the Caribbean &ndash; Ecuador Service (SW2) will be effective as from week 8 in February 2012.</p>\n<p>\n\tThe updated new proforma schedule will read as per below:<br />\n\tCallao &bull; Paita &bull; Guayaquil &bull; Manzanillo &bull; Cartagena &bull; Rotterdam &bull; Hamburg &bull; Antwerp &bull; Le Havre &bull; Kingston &bull; Cartagena &bull; Manzanillo &bull; Guayaquil &bull; Callao</p>\n	\N	\N	2012-01-24 10:00:00+04	1739	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Lloyd will enlarge capacity on Caribbean – Ecuador Service (SW2) and revise northbound schedule.	Увеличение тоннажа на сервисе SW2 Hapag-Lloyd	<p>\n\tHapag Lloyd has informed that during first quarter of this year it will enlarge capacity on the Caribbean &ndash; Ecuador service (SW2) by replacing current ships of about 1.800 teus with ships of about 3.100 teus (nominal capacity).</p>\n<p>\n\tWhilst the northbound rotation will no longer include calls at Caucedo, this market will continue to be covered by Chile &ndash; Peru Express service (SW1) which offers sufficient capacity at identical transit times.</p>\n<p>\n\tFurthermore a potential Buenaventura northbound call is still under review on the Caribbean &ndash; Ecuador service (SW2).<br />\n\tThe new proforma schedule covering the northbound leg of the Caribbean &ndash; Ecuador Service (SW2) will be effective as from week 8 in February 2012.</p>\n<p>\n\tThe updated new proforma schedule will read as per below:<br />\n\tCallao &bull; Paita &bull; Guayaquil &bull; Manzanillo &bull; Cartagena &bull; Rotterdam &bull; Hamburg &bull; Antwerp &bull; Le Havre &bull; Kingston &bull; Cartagena &bull; Manzanillo &bull; Guayaquil &bull; Callao</p>\n	<p>\n\tHapag-Lloyd меняет суда и ротацию на своем сервисе из портов Карибского моря и Эквадора на Северную Европу (SW2). Вместо судов вместимостью 1,8 тыс. TEU &nbsp;на линию встанут контейнеровозы порядка 3,1 тыс. TEU.</p>\n<p>\n\tИз ротации исключаются порты Кауседо, Порт-оф-Спейн и Виллемстад, добавляется Кингстон. Новая ротация: Кальяо &ndash; Паито &ndash; &nbsp;Гуаякиль &ndash; &nbsp;Мансанильо &ndash; &nbsp;Картахена &ndash; &nbsp;Роттердам &ndash; &nbsp;Гамбург &ndash; &nbsp;Антверпен &ndash; &nbsp;Гавр &ndash; &nbsp;Кингстон &ndash; &nbsp;Картахена &ndash; &nbsp;Мансанильо &ndash; &nbsp;Гуаякиль &ndash; &nbsp;Кальяо.</p>\n<p>\n\tВ новой ротации сервис начнет работать с 8 недели 2012 года, в феврале.</p>\n	Hapag Lloyd has informed that during first quarter of this year it will enlarge capacity on the Caribbean – Ecuador service (SW2) by replacing current ships of about 1.800 teus with ships of about 3.100 teus (nominal capacity).	Hapag-Lloyd меняет суда и ротацию на своем сервисе из портов Карибского моря и Эквадора на Северную Европу (SW2). Вместо судов вместимостью 1,8 тыс. TEU  на линию встанут контейнеровозы порядка 3,1 тыс. TEU.
2	2012-01-28 19:28:42+04	t			Hapag-Lloyd Hike Rates on Far East Services	Next phase of German carrier's rate restoration program takes effect in March 	hapag-lloyd-povyishaet-stavki-frahta-2012-01-28-092842	<p>\n\tNext phase of German carrier&#39;s rate restoration program takes effect in March</p>\n<p>\n\tHapag-Lloyd will impose a series of general rate increases on Far East services in March, as part of the German carrier&rsquo;s rate restoration program.</p>\n<p>\n\tThe company said rates on cargo shipped from Far East Asia, excluding Japan, to all destinations in North Europe and the Mediterranean, excluding South and West Africa, will go up by $750 per 20-foot equivalent unit, starting March 1.</p>\n<p>\n\tFrom the Mediterranean to the Far East and the Middle East, the carrier will apply an increase of $100 per TEU, also effective March 1. The Middle East includes destinations in the Arabian Gulf and Red Sea region.</p>\n<p>\n\t<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=127" target="_blank">Hapag-Lloyd</a>&rsquo;s proposed GRI on shipments moving from North Europe to the Far East and the Middle East region will be $100 per TEU, effective Feb. 13.</p>\n	\N	\N	2012-01-26 10:00:00+04	1740	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Lloyd Hike Rates on Far East Services	Hapag-Lloyd повышает ставки фрахта на Дальневосточных сервисах	<p>\n\tNext phase of German carrier&#39;s rate restoration program takes effect in March</p>\n<p>\n\tHapag-Lloyd will impose a series of general rate increases on Far East services in March, as part of the German carrier&rsquo;s rate restoration program.</p>\n<p>\n\tThe company said rates on cargo shipped from Far East Asia, excluding Japan, to all destinations in North Europe and the Mediterranean, excluding South and West Africa, will go up by $750 per 20-foot equivalent unit, starting March 1.</p>\n<p>\n\tFrom the Mediterranean to the Far East and the Middle East, the carrier will apply an increase of $100 per TEU, also effective March 1. The Middle East includes destinations in the Arabian Gulf and Red Sea region.</p>\n<p>\n\t<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=127" target="_blank">Hapag-Lloyd</a>&rsquo;s proposed GRI on shipments moving from North Europe to the Far East and the Middle East region will be $100 per TEU, effective Feb. 13.</p>\n	<p>\n\tС марта вступит в силу очередной этап восстановления фрахтовых ставок немецкого линейного перевозчика.</p>\n<p>\n\tHapag-Lloyd планирует провести в марте общее повышение ставок на дальневосточных сервисах, как часть программы по восстановлению доходности.</p>\n<p>\n\tПо сообщению компании, с 1 марта фрахтовые ставки для грузов отправляемых из портов Дальнего Востока (кроме Японии), на все порты Северной Европы и Средиземного моря возрастут на US750 за TEU.</p>\n<p>\n\tДля отправок из портов Средиземного моря на порты Дальнего и Ближнего Востока, включая Персидский залив и Красное море, перевозчик намерен ввести повышение USD100 за TEU, также с 1 марта. </p>\n<p>\n\t<a href="http://www.jocsailings.com/CarrierDirectory/CarrierDetail.aspx?CID=127" target="_blank">Hapag-Lloyd</a>&nbsp;также предполагает ввести GRI USD100 за TEU на отправки из портов Северной Европы на порты Дальнего и Ближнего Востока с 13 февраля.&nbsp;</p>\n	Next phase of German carrier's rate restoration program takes effect in March 	С марта вступит в силу очередной этап восстановления фрахтовых ставок немецкого линейного перевозчика.
2	2012-02-02 11:03:15+04	t			Maersk Line Adds $775 to Asia-Europe Rates	Maersk Line is moving to take rate increases on Asia-Europe lanes to $775/TEU effective March 1, that would push the rate to more than double the current spot market price.	maersk-planiruet-povyishenie-stavok-2012-02-02-010315	<p>\n\tMaersk Line is moving to take rate increases on Asia-Europe lanes to $775/TEU effective March 1, that would push the rate to more than double the current spot market price.</p>\n<p>\n\tThe Danish carrier said the general rate increase will be applied to all dry and reefer cargo shipped from any Asian port to destinations in North Europe and the Mediterranean.</p>\n<p>\n\tThe general rate increases on the depressed Asia-Europe trade come as container lines report deep 2011 losses caused by weak demand and low rates. &nbsp;The Shanghai Containerized Freight Index for the Asia-Europe trade fell below $500 in late 2011 and since has grown to around $730 per TEU. That is still barely half the rate at this time last year.</p>\n	\N	\N	2012-01-31 10:00:00+04	1743	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Line Adds $775 to Asia-Europe Rates	Маерск планирует повышение ставок фрахта на направлении Азия – Европа на USD775 за TEU с 1 марта 2012.	<p>\n\tMaersk Line is moving to take rate increases on Asia-Europe lanes to $775/TEU effective March 1, that would push the rate to more than double the current spot market price.</p>\n<p>\n\tThe Danish carrier said the general rate increase will be applied to all dry and reefer cargo shipped from any Asian port to destinations in North Europe and the Mediterranean.</p>\n<p>\n\tThe general rate increases on the depressed Asia-Europe trade come as container lines report deep 2011 losses caused by weak demand and low rates. &nbsp;The Shanghai Containerized Freight Index for the Asia-Europe trade fell below $500 in late 2011 and since has grown to around $730 per TEU. That is still barely half the rate at this time last year.</p>\n	<p>\n\tЭта мера должна более, чем удвоить спотовые ставки между главными портами этого трейда.<br />\n\t&nbsp;<br />\n\tДатская линия сообщила, что повышение будет распространяться на перевозки в стандартных и рефконтейнерах, из портов в Азии в порты Европы и Средиземного моря.&nbsp;<br />\n\t&nbsp;<br />\n\tОбщее повышение ставок на данном направлении происходит в момент опубликования морскими перевозчиками значительных убытков за 2011 год, ввиду слабого спроса и низких фрахтовых ставок. Шанхайский Контейнерный Фрахтовый Индекс (Shanghai Containerised Freight Index) в конце 2011 опустился ниже USD500 и вырос к настоящему моменту до USD730 за TEU. Этот показатель, однако, более чем вдвое ниже, чем годом ранее.</p>\n	Maersk Line is moving to take rate increases on Asia-Europe lanes to $775/TEU effective March 1, that would push the rate to more than double the current spot market price.	Датская линия сообщила, что повышение будет распространяться на перевозки в стандартных и рефконтейнерах, из портов в Азии в порты Европы и Средиземного моря. 
2	2011-08-21 07:27:39+04	t			Регулярный контейнерный поезд Новороссийск – ст.Кресты (МЖД)	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД)</p>\n	regulyarnyij-kontejnernyij-poezd-novorossijsk-2011-08-20-222739	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД).&nbsp;<br />\n\tОтправка из Новороссийска каждую пятницу вечером, прибытие на ст.Кресты вечером в воскресенье.<br />\n\tВремя в пути &ndash; 48 часов.</p>\n<p>\n\tТерминал на станции прибытия &ndash; МАНП, располагает специализированным крановым оборудованием, контейнерной площадкой и СВХ.<br />\n\tНаходится в 45 км от МКАД по Калужскому шоссе (д.Львово).</p>\n	\N	\N	2011-08-20 09:00:00+04	1816	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Регулярный контейнерный поезд Новороссийск – ст.Кресты (МЖД)	Регулярный контейнерный поезд Новороссийск – ст.Кресты (МЖД)	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД).&nbsp;<br />\n\tОтправка из Новороссийска каждую пятницу вечером, прибытие на ст.Кресты вечером в воскресенье.<br />\n\tВремя в пути &ndash; 48 часов.</p>\n<p>\n\tТерминал на станции прибытия &ndash; МАНП, располагает специализированным крановым оборудованием, контейнерной площадкой и СВХ.<br />\n\tНаходится в 45 км от МКАД по Калужскому шоссе (д.Львово).</p>\n	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД).&nbsp;<br />\n\tОтправка из Новороссийска каждую пятницу вечером, прибытие на ст.Кресты вечером в воскресенье.<br />\n\tВремя в пути &ndash; 48 часов.</p>\n<p>\n\tТерминал на станции прибытия &ndash; МАНП, располагает специализированным крановым оборудованием, контейнерной площадкой и СВХ.<br />\n\tНаходится в 45 км от МКАД по Калужскому шоссе (д.Львово).</p>\n	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД)</p>\n	<p>\n\tКомпания &laquo;Рускон&raquo; запустила регулярный контейнерный поезд по маршруту Новороссийск &ndash; ст.Кресты (МЖД)</p>\n
2	2012-02-06 23:02:37+04	t			Maersk upgrades its Ecubex service	Maersk Line is to upgrade its reefer-heavy West Coast South America-North Europe Ecubex with calls\nat Colon and Bremerhaven	maersk-rasshiryaet-svoj-servis-2012-02-06-130237	<p>\n\tMaersk Line is to upgrade its reefer-heavy West Coast South America-North Europe Ecubex with calls at Colon and Bremerhaven. At the same time, an extra 2,600 TEU vessel will be added, increasing the total to seven. The revised port order will be:Guayaquil, Balboa, Colon, Bremerhaven, St. Petersburg, Bremerhaven, Moin, Colon, Balboa and back to Guayaquil.</p>\n	\N	\N	2012-02-03 10:00:00+04	1746	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk upgrades its Ecubex service	 Maersk расширяет свой сервис Ecubex	<p>\n\tMaersk Line is to upgrade its reefer-heavy West Coast South America-North Europe Ecubex with calls at Colon and Bremerhaven. At the same time, an extra 2,600 TEU vessel will be added, increasing the total to seven. The revised port order will be:Guayaquil, Balboa, Colon, Bremerhaven, St. Petersburg, Bremerhaven, Moin, Colon, Balboa and back to Guayaquil.</p>\n	<p>\n\tMaersk Line расширяет свой. оориентированный на перевозку рефконтейнеров из Южной Америки в Северную Европу, сервис Ecubex.&nbsp;<br />\n\tК существующему расписанию добавляются заходы в порты Colon и Bremerhaven.</p>\n<p>\n\tОдновременно на сервис вводится дополнительное судно вместимостью 2,600 TEU. Таким образом общее количество задействованных судов увеличивается до семи. Итоговая ротация портов Ecubex выглядит следующим образом: Guayaquil, Balboa, Colon, Bremerhaven, St. Petersburg,</p>\n<p>\n\tBremerhaven, Moin, Colon, Balboa и обратно в Guayaquil.</p>\n	Maersk Line is to upgrade its reefer-heavy West Coast South America-North Europe Ecubex with calls\nat Colon and Bremerhaven	<p>\n\tMaersk Line расширяет свой. оориентированный на перевозку рефконтейнеров из Южной Америки в Северную Европу, сервис Ecubex.</p>\n
2	2012-02-06 23:15:12+04	t			OOCL to Hike Westbound Asia-Europe Rates $800	Carrier joins rivals in an attempt to pump up rates on the depressed trade lane \nOOCL announced Friday it will increase freight rates $800 for westbound cargo on Asia-Europe services March 1, joining other carriers in an attempt to pump up rates on the depressed trade lane.	oocl-povyishaet-stavki-na-2012-02-06-131512	<p>\n\tCarrier joins rivals in an attempt to pump up rates on the depressed trade lane&nbsp;<br />\n\tOOCL announced Friday it will increase freight rates $800 for westbound cargo on Asia-Europe services March 1, joining other carriers in an attempt to pump up rates on the depressed trade lane.</p>\n<p>\n\t&ldquo;The ocean freight rate for the Asia-Europe trade continues to be below the required level to cover basic operating costs,&rdquo; the carrier said.&nbsp;<br />\n\tOOCL will boost its rates by $800 per 20-foot equivalent unit on all shipments from the Far East (except Japan) to North Europe, the Mediterranean and the Black Sea. The increase would more than double the latest spot market rates on Asia-Europe lanes.</p>\n<p>\n\tOOCL&rsquo;s action mirrors the March 1 rate increases already scheduled by several other ocean carriers, including Maersk Line, Mediterranean Shipping and&nbsp;<a data-mce-="" data-mce-style="color: #1f497d; font-family: 'times new roman'; font-size: 11pt;" href="http://www.joc.com/container-lines/hanjin-seeks-700-increase-asia-europe-rates">Hanjin</a>.</p>\n	\N	\N	2012-02-03 10:00:00+04	1748	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	OOCL to Hike Westbound Asia-Europe Rates $800	OOCL повышает ставки на направлении Азия - Европа на $800	<p>\n\tCarrier joins rivals in an attempt to pump up rates on the depressed trade lane&nbsp;<br />\n\tOOCL announced Friday it will increase freight rates $800 for westbound cargo on Asia-Europe services March 1, joining other carriers in an attempt to pump up rates on the depressed trade lane.</p>\n<p>\n\t&ldquo;The ocean freight rate for the Asia-Europe trade continues to be below the required level to cover basic operating costs,&rdquo; the carrier said.&nbsp;<br />\n\tOOCL will boost its rates by $800 per 20-foot equivalent unit on all shipments from the Far East (except Japan) to North Europe, the Mediterranean and the Black Sea. The increase would more than double the latest spot market rates on Asia-Europe lanes.</p>\n<p>\n\tOOCL&rsquo;s action mirrors the March 1 rate increases already scheduled by several other ocean carriers, including Maersk Line, Mediterranean Shipping and&nbsp;<a data-mce-="" data-mce-style="color: #1f497d; font-family: 'times new roman'; font-size: 11pt;" href="http://www.joc.com/container-lines/hanjin-seeks-700-increase-asia-europe-rates">Hanjin</a>.</p>\n	<p>\n\tЛинии присоединилась к другим участникам рынка, в усилиях по восстановлению ставок на подверженном жёсткому кризису направлении.</p>\n<p>\n\tOOCL сообщила в пятницу о повышении своих фрахтовых ставок на $800 для перевозок из Азии в Европу с 1 марта.<br />\n\t&laquo;Ставки фрахта на направлении Азия-Европа продолжают оставаться на уровне недостаточном для покрытия даже базовых эксплуатационных издержек&raquo;, - сообщила линия.</p>\n<p>\n\tOOCL поднимет ставки на $800 за TEU для всех перевозок из портов Дальнего Востока (кроме Японии) в порты Северной Европы, Средиземного и Черного морей. Это повышение должно более, чем вдвое увеличить текущий уровень ставок фрахта.</p>\n<p>\n\tЗаявление OOCL последовало после целого ряда сообщений в течении прошлой недели о повышении ставок всех основных линейных перевозчиков с 1 марта 2012.</p>\n	Carrier joins rivals in an attempt to pump up rates on the depressed trade lane \nOOCL announced Friday it will increase freight rates $800 for westbound cargo on Asia-Europe services March 1, joining other carriers in an attempt to pump up rates on the depressed trade lane.	Линии присоединилась к другим участникам рынка, в усилиях по восстановлению ставок на подверженном жёсткому кризису направлении. 
2	2012-01-26 00:43:41+04	t			Ruscon expands its trucking fleet	Ruscon Ltd., the transport operator belonging to the GCS group, commissioned 20 new MAN container trucks. Thus own truck fleet of the company increased to 115 units. 	popolnenie-avtoparka-ruskon-2012-01-25-144341	<div>\n\tRuscon Ltd., the transport operator belonging to the GCS group, commissioned 20 new MAN container trucks. Thus own truck&nbsp;fleet of the company increased to 115 units.\n\t<p>\n\t\tThe purchased trucks will be dedicated to serving the company&#39;s key contract accounts in St.Petersburg&nbsp;and Novorossiysk.&nbsp;</p>\n\t<p>\n\t\tRuscon Ltd. is one of the leading companies of the GCS and the major provider of trucking, intermodal and terminal services for containerised goods in the European part of Russia.</p>\n</div>\n	\N	\N	2011-12-21 10:00:00+04	1818	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Ruscon expands its trucking fleet	Пополнение автопарка Рускон	<div>\n\tRuscon Ltd., the transport operator belonging to the GCS group, commissioned 20 new MAN container trucks. Thus own truck&nbsp;fleet of the company increased to 115 units.\n\t<p>\n\t\tThe purchased trucks will be dedicated to serving the company&#39;s key contract accounts in St.Petersburg&nbsp;and Novorossiysk.&nbsp;</p>\n\t<p>\n\t\tRuscon Ltd. is one of the leading companies of the GCS and the major provider of trucking, intermodal and terminal services for containerised goods in the European part of Russia.</p>\n</div>\n	<p>\n\tКомпания ООО &quot;Рускон&quot;, входящая в группу ГКС, приняла в эксплуатацию 20 новых автоконтейнеровозов MAN. Таким образом собственный грузовой автопарк компании&nbsp;вырос до&nbsp;115 единиц.</p>\n<p>\n\tНовоприобретенные машины планируется задействовать на контрактных перевозках грузов основных клиентов компании в Санкт-Петербурге и Новороссийске.</p>\n<p>\n\t&quot;Рускон&quot; является крупнейшей компаней в составе ГКС и одним из лидеров интермодальных контейнерных перевозок в европейской части РФ.</p>\n	Ruscon Ltd., the transport operator belonging to the GCS group, commissioned 20 new MAN container trucks. Thus own truck fleet of the company increased to 115 units. 	<p>\n\tКомпания ООО &quot;Рускон&quot;, входящая в группу ГКС, приняла в эксплуатацию 20 новых автоконтейнеровозов MAN. Таким образом собственный грузовой автопарк компании вырос до 115 единиц.</p>\n
2	2012-02-20 20:52:12+04	t			TUI sells its shares in Hapag Lloyd.	<p>\n\tTUI has reached an agreement with Albert Ballin (ABC) that will see its shareholding in Hapag-Lloyd reduced to 22% after June 2012, down from current 38.4%.</p>\n	turoperator-tui-prodaet-svoyu-2012-02-20-105212	<p>\n\tTUI has reached an agreement with Albert Ballin (ABC) that will see its shareholding in Hapag-Lloyd reduced to 22% after June 2012, down from current 38.4%.</p>\n<p>\n\tABC will then control more than three quarters &nbsp; of the carrier, which will thus remain firmly in German hands. As part of the agreement, both TUI and the consortium will first substitute hybrid capital provided to Hapag-Lloyd into equity, as a result of which TUI&rsquo;s ownership will temporarily rise (by 1.1%) to 39.5% before the deal is completed by June (2012).</p>\n<p>\n\tThereafter, TUI will have the right of priority placement of its remaining shares in an IPO, for which it may call, or to sell them otherwise (to any third party inside or outside of Germany). In April Hapag-Lloyd must offer to buy back shares from TUI at EUR 37.5 million (USD 50 million). With 36.9%, the City of Hamburg (this time spending EUR 420 million) will, through ABC, become the larger shareholder, while Kuhne Holding&rsquo;s participation will increase to 28.2%. The total deal is worth EUR 700 million (USD 920 million) to TUI, which would value Hapag-Lloyd&rsquo;s current worth at some USD 5.6 billion.</p>\n	\N	\N	2012-02-17 10:00:00+04	1758	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	TUI sells its shares in Hapag Lloyd.	Туроператор TUI продает свою долю в Hapag Lloyd.	<p>\n\tTUI has reached an agreement with Albert Ballin (ABC) that will see its shareholding in Hapag-Lloyd reduced to 22% after June 2012, down from current 38.4%.</p>\n<p>\n\tABC will then control more than three quarters &nbsp; of the carrier, which will thus remain firmly in German hands. As part of the agreement, both TUI and the consortium will first substitute hybrid capital provided to Hapag-Lloyd into equity, as a result of which TUI&rsquo;s ownership will temporarily rise (by 1.1%) to 39.5% before the deal is completed by June (2012).</p>\n<p>\n\tThereafter, TUI will have the right of priority placement of its remaining shares in an IPO, for which it may call, or to sell them otherwise (to any third party inside or outside of Germany). In April Hapag-Lloyd must offer to buy back shares from TUI at EUR 37.5 million (USD 50 million). With 36.9%, the City of Hamburg (this time spending EUR 420 million) will, through ABC, become the larger shareholder, while Kuhne Holding&rsquo;s participation will increase to 28.2%. The total deal is worth EUR 700 million (USD 920 million) to TUI, which would value Hapag-Lloyd&rsquo;s current worth at some USD 5.6 billion.</p>\n	<p>\n\tTUI достигло соглашения с консорциумом &nbsp;Albert Ballin (ABC), согласно которому доля первого в компании Hapag-Lloyd сократится после июня 2012 до 22% с нынешних 38.4%.</p>\n<p>\n\tABC получит контроль над более, чем тремя четвертями в капитале линии, которая, таким образом, останется полностью в руках немецких акционеров.</p>\n<p>\n\tСоглашением предусмотрено, что TUI и консорциум сначала конвертируют займы, ранее предоставленные в Hapag-Lloyd в акции, в результате чего доля TUI временно вырастет до 39.5% до завершения сделки в июне 2012.</p>\n<p>\n\tЗатем, TUI получит право на приоритетное размещение своих оставшихся акций через IPO либо продажу любой третьей стороне в Германии либо за её пределами. &nbsp;В апреле Hapag-Lloyd должен предложить обратный выкуп акций у &nbsp;TUI за 37.5 миллиона Евро. Город Гамбург с долей 36.9% (потратит 420 миллионов Евро) станет через ABC, станет крупнейшим акционером линии, холдинг Kuhne увеличит свою долю до 28.2%. Общая цена сделки составляет 700 миллионов Евро, что означает текущую оценку стоимости всего Hapag-Lloyd в размере 5.6 миллиардов долларов.</p>\n	<p>\n\tTUI has reached an agreement with Albert Ballin (ABC) that will see its shareholding in Hapag-Lloyd reduced to 22% after June 2012, down from current 38.4%.</p>\n	<p>\n\tTUI достигло соглашения с консорциумом &nbsp;Albert Ballin (ABC), согласно которому доля первого в компании Hapag-Lloyd сократится после июня 2012 до 22% с нынешних 38.4%.</p>\n
2	2012-02-08 10:02:15+04	t			Russian Federal Customs Committee: In 2011 foreign trade of Russia grew by 31,2% - to $821,3 billions	According to customs statistics foreign trade of Russia amounted to USD821,3 billion, and grew by 31,2% YoY.  Foreign trade with countries outside of FSU reached USD698,8 billion ( +30,7% on 2010).	fts-vneshnetorgovyij-oborot-rf-2012-02-08-000215	<p>\n\tAccording to customs statistics foreign trade of Russia amounted to USD821,3 billion, and grew by 31,2% YoY. &nbsp;Foreign trade with countries outside of FSU reached USD698,8 billion ( +30,7% on 2010).</p>\n<p>\n\tCountry&rsquo;s trade balance was positive - USD210,7 billion, which is USD42,5 billions more than in 2010. Trade balance with non-FSU countries was USD 176,8 billion (+ USD36,5 billion).</p>\n<p>\n\tExports in 2011 reached USD516,0 billion, 30% more than in 2010. Exports outside of FSU accounted for USD 437,8 billion (+29,7%).</p>\n<p>\n\tGrowth of exports was totally stipulated by increased value of exported goods. The average price of exports went up by 32,9% in 2011, while volumes went down by -2,2%.</p>\n<p>\n\tThe core item of Russian exports in 2011 were oil and energy commodities, which made up 72,6% of total exports (in 2010 &ndash; 70,8%). Average export price of these commodities grew by 33%. &nbsp;</p>\n<p>\n\tIn 2011 Russia imported goods at total value of USD 305,3 billion, which was 33,4% more than in 2010. Imports from non-FSU countries grew by 32,4% to USD261,0 billion.</p>\n<p>\n\tImports to Russia increased both in terms of physical volumes (+9,1%) and goods&rsquo; price (+22,2%) The dominant share of 51% in imports belonged to machinery and appliances, in 2010 they accounted for 47%. &nbsp;&nbsp;</p>\n<p>\n\tValue of imported machinery and appliances in 2011 increased by 43,7%, including &ndash; mechanical equipment by 40,4%, electric appliances and equipment &nbsp;&ndash; by 19,6%, railway vehicles &ndash; by 66,8%, road transport vehicles &ndash; by 68,0%, optical and video appliances &nbsp;&ndash; by 27,3%. Physical volume of imported cars went up by 46,1%, trucks &nbsp;&ndash; by 87,5%.</p>\n	\N	\N	2012-02-07 10:00:00+04	1750	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Russian Federal Customs Committee: In 2011 foreign trade of Russia grew by 31,2% - to $821,3 billions	ФТС: Внешнеторговый оборот РФ за 2011 год вырос на 31,2% - до $821,3 млрд	<p>\n\tAccording to customs statistics foreign trade of Russia amounted to USD821,3 billion, and grew by 31,2% YoY. &nbsp;Foreign trade with countries outside of FSU reached USD698,8 billion ( +30,7% on 2010).</p>\n<p>\n\tCountry&rsquo;s trade balance was positive - USD210,7 billion, which is USD42,5 billions more than in 2010. Trade balance with non-FSU countries was USD 176,8 billion (+ USD36,5 billion).</p>\n<p>\n\tExports in 2011 reached USD516,0 billion, 30% more than in 2010. Exports outside of FSU accounted for USD 437,8 billion (+29,7%).</p>\n<p>\n\tGrowth of exports was totally stipulated by increased value of exported goods. The average price of exports went up by 32,9% in 2011, while volumes went down by -2,2%.</p>\n<p>\n\tThe core item of Russian exports in 2011 were oil and energy commodities, which made up 72,6% of total exports (in 2010 &ndash; 70,8%). Average export price of these commodities grew by 33%. &nbsp;</p>\n<p>\n\tIn 2011 Russia imported goods at total value of USD 305,3 billion, which was 33,4% more than in 2010. Imports from non-FSU countries grew by 32,4% to USD261,0 billion.</p>\n<p>\n\tImports to Russia increased both in terms of physical volumes (+9,1%) and goods&rsquo; price (+22,2%) The dominant share of 51% in imports belonged to machinery and appliances, in 2010 they accounted for 47%. &nbsp;&nbsp;</p>\n<p>\n\tValue of imported machinery and appliances in 2011 increased by 43,7%, including &ndash; mechanical equipment by 40,4%, electric appliances and equipment &nbsp;&ndash; by 19,6%, railway vehicles &ndash; by 66,8%, road transport vehicles &ndash; by 68,0%, optical and video appliances &nbsp;&ndash; by 27,3%. Physical volume of imported cars went up by 46,1%, trucks &nbsp;&ndash; by 87,5%.</p>\n	<p>\n\tПо данным таможенной статистики в 2011 году внешнеторговый оборот России составил 821,3 млрд. долларов США и по сравнению с 2010 годом возрос на 31,2%, в том числе, со странами дальнего зарубежья &ndash; 698,8 млрд. долларов США (рост на 30,7%).</p>\n<p>\n\tСальдо торгового баланса сложилось положительное в размере 210,7 млрд. долларов США, что на 42,5 млрд. долларов США больше, чем в 2010 году При этом в торговле со странами дальнего зарубежья сальдо равнялось 176,8 млрд. долларов США (рост на 36,5 млрд. долларов США).</p>\n<p>\n\tЭкспорт России в 2011 году составил 516,0 млрд. долларов США и по сравнению с 2010 годом увеличился на 30%, в том числе в страны дальнего зарубежья &ndash; 437,8 млрд. долларов США (рост на 29,7%).</p>\n<p>\n\tУвеличение стоимостного объема экспорта 2011 году по сравнению с 2010 годом было полностью обусловлено ростом средних цен экспортируемых Россией товаров. Индекс средних цен экспорта за этот период составил 132,9%, тогда как индекс его физического объема &ndash; 97,8%.</p>\n<p>\n\tОснову российского экспорта в 2011 году в страны дальнего зарубежья составили топливно-энергетические товары, удельный вес которых в товарной структуре экспорта в эти страны составил 72,6% (в 2010 году &ndash; 70,8%). По сравнению с 2010 годом стоимостной объем этих товаров увеличился на 33,0%.</p>\n<p>\n\tИмпорт России в 2011 году составил 305,3 млрд. долларов США и по сравнению с 2010 годом увеличился на 33,4%, в том числе из стран дальнего зарубежья &ndash; 261,0 млрд. долларов США (рост на 32,4%).</p>\n<p>\n\tУвеличение стоимости российского импорта в 2011 году по сравнению с 2010 годом было обусловлено как ростом его физического объема, индекс которого составил 109,1%, так и увеличением индекса средних цен импортируемых товаров, составившего 122,2%.</p>\n<p>\n\tВ товарной структуре импорта из стран дальнего зарубежья на долю машин и оборудования в 2011 году приходилось 51,0% (в 2010 году &ndash; 47,0%). Стоимостной объем импорта машиностроительной продукции по сравнению с 2010 годом увеличился на 43,7%, в том числе: механического оборудования &ndash; на 40,4%, электрооборудования &ndash; на 19,6%, железнодорожного транспорта &ndash; на 66,8%, средств наземного транспорта (за исключением железнодорожного) &ndash; на 68,0%, инструментов и аппаратов оптических &ndash; на 27,3%. Физический объем ввоза легковых автомобилей возрос на 46,1%, грузовых &ndash; на 87,5%.</p>\n	According to customs statistics foreign trade of Russia amounted to USD821,3 billion, and grew by 31,2% YoY.  Foreign trade with countries outside of FSU reached USD698,8 billion ( +30,7% on 2010).	По данным таможенной статистики в 2011 году внешнеторговый оборот России составил 821,3 млрд. долларов США и по сравнению с 2010 годом возрос на 31,2%, в том числе, со странами дальнего зарубежья – 698,8 млрд. долларов США (рост на 30,7%).
2	2012-04-11 00:39:58+04	t			GCS expands the fleet of own flat-cars	<p>\nGCS has ordered 224 x 80&rsquo;-long flat-cars for transportation of containers. The order has been placed at &ldquo;TMH Wagon-construction&rdquo; plant belonging to the Trans-Mash holding. Delivery of the first 32 flat-cars is expected by the mid of April 2012.</p>\n	uvelichenie-sobstvennogo-parka-zhd-2012-04-10-153958	<p>\nGCS has ordered 224 x 80&rsquo;-long flat-cars for transportation of containers. The order has been placed at &ldquo;TMH Wagon-construction&rdquo; plant belonging to the Trans-Mash holding. Delivery of the first 32 flat-cars is expected by the mid of April 2012.</p>\n<p>\nThe newly ordered flat-cars are planned to be deployed in block-trains run by the mutli-modal operator Ruscon being part of the GCS group. At the moment Ruscon already operates several regular intermodal services from the port of Novorossiysk to various main destinations in the European part of Russia, including Moscow.</p>\n<p>\nExpanding own wagon fleet will be coupled with growing cooperation with third-party owners. In the nearest plans of GCS is to increase the number of long-term leased flat-cars operated by Ruscon to over 450 units.</p>\n	\N	\N	2012-03-27 09:00:00+04	1819	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	GCS expands the fleet of own flat-cars	Увеличение собственного парка жд платформ ГКС/Рускон	<p>\nGCS has ordered 224 x 80&rsquo;-long flat-cars for transportation of containers. The order has been placed at &ldquo;TMH Wagon-construction&rdquo; plant belonging to the Trans-Mash holding. Delivery of the first 32 flat-cars is expected by the mid of April 2012.</p>\n<p>\nThe newly ordered flat-cars are planned to be deployed in block-trains run by the mutli-modal operator Ruscon being part of the GCS group. At the moment Ruscon already operates several regular intermodal services from the port of Novorossiysk to various main destinations in the European part of Russia, including Moscow.</p>\n<p>\nExpanding own wagon fleet will be coupled with growing cooperation with third-party owners. In the nearest plans of GCS is to increase the number of long-term leased flat-cars operated by Ruscon to over 450 units.</p>\n	<p>\n\tГруппа ГКС подписала контракт на приобретение длиннобазных (80&rsquo;) платформ для перевозки крупнотоннажных контейнеров. Поступление первых платформ ожидается уже в середине апреля 2012.</p>\n<p>\n\tЗаказанные платформы планируется использовать в составе контейнерных поездов мультимодального оператора &laquo;Рускон&raquo;, входящего в группу ГКС. В настоящее время &laquo;Рускон&raquo; предлагает несколько регулярных маршрутных сервисов по жд доставке контейнеров между Новороссийским портом и станциями в Европейской части РФ, включая Москву.</p>\n<p>\n\tРасширение сообственного парка ГКС будет проводится параллельно с наращиванием сотрудничества со собственниками подвижного состава и увеличением числа привлеченных платформ. В ближайшее время&nbsp;планируется довести парк сторонних платформ в операторства у Рускона до более 450 единиц.</p>\n	<p>\nGCS has ordered 224 x 80&rsquo;-long flat-cars for transportation of containers. The order has been placed at &ldquo;TMH Wagon-construction&rdquo; plant belonging to the Trans-Mash holding. Delivery of the first 32 flat-cars is expected by the mid of April 2012.</p>\n	<p>\n\tГруппа ГКС подписала контракт на приобретение длиннобазных (80&rsquo;) платформ для перевозки крупнотоннажных контейнеров. Поступление первых платформ ожидается уже в середине апреля 2012.</p>\n
2	2012-02-10 04:31:04+04	t			G6 Alliance Speeds Up Asia-Europe Service Launch	The newly formed G6 alliance of ocean carriers has sped up the launch of its Asia-Europe service by a month to the first week of March to coincide with steep hikes in freight rates on the world’s biggest trade route.	alyans-g6-uskoryaet-zapusk-2012-02-09-183104	<p>\n\tThe newly formed G6 alliance of ocean carriers has sped up the launch of its Asia-Europe service by a month to the first week of March to coincide with steep hikes in freight rates on the world&rsquo;s biggest trade route.</p>\n<p>\n\tThe earlier start also coincides with the launch of a&nbsp;<a href="http://www.joc.com/container-lines/cma-cgm-msc-partner-key-routes" target="_blank">rival joint Asia-Europe partnership between Mediterranean Shipping and CMA CGM</a>.<br />\n\t&ldquo;Customer response to the G6 alliance is strong, the latest economic condition in the trade supports the timing of the launch, and we are ready to meet the market&rsquo;s expectations,&rdquo; the alliance said.</p>\n<p>\n\tThe&nbsp;<a href="http://www.joc.com/container-lines/new-world-grand-alliances-merge" target="_blank">G6 alliance, which was unveiled in late December</a>&nbsp;two weeks after the announcement of the CMA CGM-MSC partnership, joins the members of the Grand Alliance &mdash; Hapag-Lloyd, NYK and OOCL &mdash; and the New World Alliance &mdash; APL, Hyundai Merchant Marine and MOL.</p>\n<p>\n\tThe new joint services will be accompanied by a&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-line-adds-775-asia-europe-rates" target="_blank">wave of rate hikes by leading carriers averaging $750 to $800 per 20-foot container</a>&nbsp;westbound out of Asia to Europe, effective March 1.</p>\n<p>\n\tThe G6 will launch six services between Asia and north Europe in the first week of March, with sailings from Japanese ports to begin after consultations with the Japan Harbor Transportation Board and labor unions. A seventh service, providing direct coverage to the Bohai Bay ports in Dalian and Xingang, will follow &ldquo;when it can be supported by sustainable trade conditions.&rdquo;</p>\n<p>\n\tThe alliance will continue the existing Asia-Mediterranean Express Service and will also launch a new Asia-Black Sea Express service in the first week of April. The G6 carriers will operate 90 ships with capacities up to 14,000 20-foot equivalent units covering 40 ports.</p>\n<p>\n\tThe alliance is estimated to have around 24 percent of Asia-Europe capacity, the same as the MSC- CMA CGM partnership, with Maersk Line&rsquo;s independent operation consisting of about 18 to 19 percent of capacity.</p>\n<p>\n\tThe G6 and MSC-CMA CGM alliances followed the launch of Maersk Line&rsquo;s Daily Maersk &ldquo;conveyor belt&rdquo; service in October. &nbsp;The formation of carrier alliances&nbsp;<a href="http://www.joc.com/container-shipping/new-carrier-alliances-could-lead-rate-wars-alphaliner-says" target="_blank">threatens to prolong &ldquo;unrelenting&rdquo; rate wars on the Asia-Europe trades</a>&nbsp;and could spell &ldquo;disaster&rdquo; for lines in 2012, according to container market analyst Alphaliner.</p>\n	\N	\N	2012-02-08 10:00:00+04	1751	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	G6 Alliance Speeds Up Asia-Europe Service Launch	Альянс G6 ускоряет запуск сервисов на направлении Азия - Европа	<p>\n\tThe newly formed G6 alliance of ocean carriers has sped up the launch of its Asia-Europe service by a month to the first week of March to coincide with steep hikes in freight rates on the world&rsquo;s biggest trade route.</p>\n<p>\n\tThe earlier start also coincides with the launch of a&nbsp;<a href="http://www.joc.com/container-lines/cma-cgm-msc-partner-key-routes" target="_blank">rival joint Asia-Europe partnership between Mediterranean Shipping and CMA CGM</a>.<br />\n\t&ldquo;Customer response to the G6 alliance is strong, the latest economic condition in the trade supports the timing of the launch, and we are ready to meet the market&rsquo;s expectations,&rdquo; the alliance said.</p>\n<p>\n\tThe&nbsp;<a href="http://www.joc.com/container-lines/new-world-grand-alliances-merge" target="_blank">G6 alliance, which was unveiled in late December</a>&nbsp;two weeks after the announcement of the CMA CGM-MSC partnership, joins the members of the Grand Alliance &mdash; Hapag-Lloyd, NYK and OOCL &mdash; and the New World Alliance &mdash; APL, Hyundai Merchant Marine and MOL.</p>\n<p>\n\tThe new joint services will be accompanied by a&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-line-adds-775-asia-europe-rates" target="_blank">wave of rate hikes by leading carriers averaging $750 to $800 per 20-foot container</a>&nbsp;westbound out of Asia to Europe, effective March 1.</p>\n<p>\n\tThe G6 will launch six services between Asia and north Europe in the first week of March, with sailings from Japanese ports to begin after consultations with the Japan Harbor Transportation Board and labor unions. A seventh service, providing direct coverage to the Bohai Bay ports in Dalian and Xingang, will follow &ldquo;when it can be supported by sustainable trade conditions.&rdquo;</p>\n<p>\n\tThe alliance will continue the existing Asia-Mediterranean Express Service and will also launch a new Asia-Black Sea Express service in the first week of April. The G6 carriers will operate 90 ships with capacities up to 14,000 20-foot equivalent units covering 40 ports.</p>\n<p>\n\tThe alliance is estimated to have around 24 percent of Asia-Europe capacity, the same as the MSC- CMA CGM partnership, with Maersk Line&rsquo;s independent operation consisting of about 18 to 19 percent of capacity.</p>\n<p>\n\tThe G6 and MSC-CMA CGM alliances followed the launch of Maersk Line&rsquo;s Daily Maersk &ldquo;conveyor belt&rdquo; service in October. &nbsp;The formation of carrier alliances&nbsp;<a href="http://www.joc.com/container-shipping/new-carrier-alliances-could-lead-rate-wars-alphaliner-says" target="_blank">threatens to prolong &ldquo;unrelenting&rdquo; rate wars on the Asia-Europe trades</a>&nbsp;and could spell &ldquo;disaster&rdquo; for lines in 2012, according to container market analyst Alphaliner.</p>\n	<p>\n\tНедавно созданный альянс линейных перевозчиков G6 ускоряет на месяц начало совместных сервисов из Азии в Европу. Их запуск планируется с первой недели марта, одновременно с раннее объявленным резким повышением ставок на этом крупнейшем направлении перевозок.</p>\n<p>\n\tБолее раннее начало сервисов также связано с ожидаемым в этот период запуском конкурирующего совместного сервиса линий MSC и&nbsp;<a href="http://www.joc.com/container-lines/cma-cgm-msc-partner-key-routes" target="_blank">CMA CGM</a>.</p>\n<p>\n\t&laquo;Клиенты позитивно восприняли формирование альянса G6. Последние события в мировой экономике и отрасли подтверждают правильность времени запуска сервиса, и мы готовы следовать запросам рынка&raquo;, - сообщил представитель альянса.&nbsp;<br />\n\t&nbsp;<br />\n\tЛинейный альянс&nbsp;<a href="http://www.joc.com/container-lines/new-world-grand-alliances-merge" target="_blank">G6, созданный в конце декабря, всего лишь две недели спустя заявления о формировании партнёрства&nbsp;</a>CMA CGM-MSC, объединил участников более мелких альянсов Grand Alliance &mdash; Hapag-Lloyd, NYK и OOCL &mdash; и New World Alliance &mdash; APL, Hyundai Merchant Marine и &nbsp;MOL.<br />\n\t&nbsp;<br />\n\tНовые совместные сервисы будут запущены почти одновременно с чередой повышений ставок, объявленных всеми ведущими перевозчиками, в среднем на&nbsp;<br />\n\tУчастники G6 запустят шесть сервисов между портами Азии и Северной Европы с начала марта, первые отправки из портов Японии последуют после консультаций с Японским Портовым и Транспортным Советом (Japan Harbor Transportation Board) и профсоюзами. Седьмой совместный сервис будет открыт между портами бухты Bohai и портами Dalian и Xingang, после того, как он &ldquo;будет обеспечен соответствующими устойчивыми объемами перевозок.&rdquo;</p>\n<p>\n\tАльянс продолжит эксплуатацию существующего сервиса Азия &ndash; Средиземное море (Asia-Mediterranean Express Service), а также запустит прямой сервис Азия &ndash; Черное море на первой неделе апреля. &nbsp;<br />\n\t&nbsp;<br />\n\tУчастники G6 оперируют 90 судами, вместимостью до 14,000 TEU и обслуживают 40 портов.<br />\n\tАльянс контролирует около 24% провозной способности на направлении Азия &ndash; Европа, примерно столько же, сколько альянс MSC и CMA-CGM. На линию Maersk, работающую самостоятельно, &nbsp;приходится около 18%-19% провозной способности на этом направлении.&nbsp;</p>\n<p>\n\tСоздание альянсов G6 и MSC-CMA CGM последовало после запуска линией Maersk т.н. &ldquo;конвейерного&rdquo; ежедневного сервиса в октябре. Укрупнение альянсов линейных перевозчиков может привести на направлении Азия &ndash; Европа к дальнейшей ценовой войне, что, по мнению аналитиков &nbsp;Alphaliner, может повлечь за собой крайне негативные результаты для линий в 2012.</p>\n	The newly formed G6 alliance of ocean carriers has sped up the launch of its Asia-Europe service by a month to the first week of March to coincide with steep hikes in freight rates on the world’s biggest trade route.	Недавно созданный альянс линейных перевозчиков G6 ускоряет на месяц начало совместных сервисов из Азии в Европу. Их запуск планируется с первой недели марта, одновременно с раннее объявленным резким повышением ставок на этом крупнейшем направлении перевозок. 
2	2013-01-14 19:55:28+04	t			GCS/Ruscon launches an Ust-Luga - Nizhniy Novgorod  block train service for General Motors Korea	A new block train service is being launched by GCS/Ruscon out of the new Ust-Luga Container Terminal (ULCT). It will run a distance of over 1,100km to Nizhniy Novgorod. Nizhniy Novgorod is Russia’s fifth largest city and is located over 400km to the east of Moscow.\n	gksruskon-zapustil-regulyarnyij-kontejnernyij-2013-01-14-095528	<p>\n\tA new block train service is being launched by GCS/Ruscon out of the new Ust-Luga Container Terminal (ULCT). It will run a distance of over 1,100km to Nizhniy Novgorod. Nizhniy Novgorod is Russia&rsquo;s fifth largest city and is located over 400km to the east of Moscow.</p>\n<p>\n\tRuscon is a logistics and intermodal operator, being part of the GCS transportation group.</p>\n<p>\n\tThe service is being launched to serve the needs of General Motors (GM) Korea, which signed a contract in February 2011 with the Russian motor manufacturer GAZ to assemble its Chevrolet Aveo subcompact city car. However GCS is also offering capacity on the trains to third parties including carriers and shippers who route cargo via Ust-Luga.</p>\n<p>\n\tProduction of the Chevrolet Aveo began in December 2012 and the manufacturer is planning to assemble some 32,000 cars per annum.<br />\n\tRuscon loaded two pilot trains at ULCT in the beginning of December, transporting CKD parts that were shipped by GM Korea. In total 118 containers were delivered to the new assembly plant in Nizhniy Novgorod. 54x40ft and 2x20ft containers were carried on the first train and 60x40ft and 2x20ft containers on the second.</p>\n<p>\n\tRuscon uses its own flat-car wagons to form the trains and recently set up its own office in Ust-Luga.&nbsp; In addition to railway transportation, Ruscon is arranging port and customs transit formalities for this project while ocean transportation to ULCT is arranged by Maersk Line.</p>\n<p>\n\tThe regular service starts this month (January) and volumes will build to around 800x40ft containers per month.</p>\n<p>\n\tRuscon is 100% owned by GCS and performs all container transportation services within the group, outside of liner agency, customs clearance, LCL and stevedoring.</p>\n	\N	\N	2013-01-09 10:00:00+04	1820	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	GCS/Ruscon launches an Ust-Luga - Nizhniy Novgorod  block train service for General Motors Korea	ГКС/Рускон запустил регулярный контейнерный поезд между портом Усть-Луга и Нижним Новгородом для General Motors Korea	<p>\n\tA new block train service is being launched by GCS/Ruscon out of the new Ust-Luga Container Terminal (ULCT). It will run a distance of over 1,100km to Nizhniy Novgorod. Nizhniy Novgorod is Russia&rsquo;s fifth largest city and is located over 400km to the east of Moscow.</p>\n<p>\n\tRuscon is a logistics and intermodal operator, being part of the GCS transportation group.</p>\n<p>\n\tThe service is being launched to serve the needs of General Motors (GM) Korea, which signed a contract in February 2011 with the Russian motor manufacturer GAZ to assemble its Chevrolet Aveo subcompact city car. However GCS is also offering capacity on the trains to third parties including carriers and shippers who route cargo via Ust-Luga.</p>\n<p>\n\tProduction of the Chevrolet Aveo began in December 2012 and the manufacturer is planning to assemble some 32,000 cars per annum.<br />\n\tRuscon loaded two pilot trains at ULCT in the beginning of December, transporting CKD parts that were shipped by GM Korea. In total 118 containers were delivered to the new assembly plant in Nizhniy Novgorod. 54x40ft and 2x20ft containers were carried on the first train and 60x40ft and 2x20ft containers on the second.</p>\n<p>\n\tRuscon uses its own flat-car wagons to form the trains and recently set up its own office in Ust-Luga.&nbsp; In addition to railway transportation, Ruscon is arranging port and customs transit formalities for this project while ocean transportation to ULCT is arranged by Maersk Line.</p>\n<p>\n\tThe regular service starts this month (January) and volumes will build to around 800x40ft containers per month.</p>\n<p>\n\tRuscon is 100% owned by GCS and performs all container transportation services within the group, outside of liner agency, customs clearance, LCL and stevedoring.</p>\n	<p>\n\tНовый контейнерный поезд запущен ГКС/Рускон из Усть-Лужского Контейнерного Терминала (УЛКТ) в Нижний Новгород.&nbsp;</p>\n<p>\n\tПоезд предназначен в первую очередь для перевозок грузов компании General Motors (GM) Korea, которая в 2011 году подписала договор с автозаводом ГАЗ на сборку автомобилей Chevrolet Aveo. Одновременно ГКС предлагает возможности этого поезда также для перевозок сторонних экспедиторов и грузовладельцев, доставляющих контейнеры через Усть-Лугу.</p>\n<p>\n\tПроизводство Chevrolet Aveo началось с декабря 2012 года, планируемый объем сборки составляет до 32,000 автомобилей в год.</p>\n<p>\n\tРускон выполнил перевозку двух пробных поездов из УЛКТ в начале декабря. Всего для GM Korea в Нижний Новгород было доставлено 118 контейнеров, в том числе 54x40&rsquo; и 2x20&rsquo; контейнеров на первом поезде и 60x40&rsquo; и 2x20&rsquo; &ndash; на втором.</p>\n<p>\n\tРускон использовал для перевозки собственные платформы и недавно сформированный офис в Усть-Луге. Помимо жд перевозки, компания также осуществляла в интересах клиента необходимые портовые и транзитные формальности; морская часть перевозки выполнялась контейнерной линией Maersk Line.</p>\n<p>\n\tРегулярные перевозки комплектующих GM Korea начинаются с января. Ожидается, что их объем должен составить до 800x40&rsquo; в месяц.</p>\n<p>\n\tРускон является 100% дочкой группы ГКС и оказывает широкий спектр услуг по перевозке контейнеров, помимо услуг линейного агентирования, таможенной очистки и терминальной обработки.</p>\n	A new block train service is being launched by GCS/Ruscon out of the new Ust-Luga Container Terminal (ULCT). It will run a distance of over 1,100km to Nizhniy Novgorod. Nizhniy Novgorod is Russia’s fifth largest city and is located over 400km to the east of Moscow.\n	Новый контейнерный поезд запущен ГКС/Рускон из Усть-Лужского Контейнерного Терминала (УЛКТ) в Нижний Новгород.  \n
2	2013-02-14 04:41:30+04	t			GCS completes substantial investment programme expanding capacity at its MANP terminal in Moscow	<p>\n\tGlobal Container Services (GCS) has added a second rail-mounted gantry crane (RMG) at its MANP terminal on the outskirts of Moscow. This has increased the number of train arrivals it can handle up to five or six per week. In addition, it has increased the container yard (CY) capacity to over 2500TEU and the rail track length to 3km.</p>\n	gks-zavershaet-osnovnuyu-investitsionnuyu-2013-02-13-184130	<p>\n\tGlobal Container Services (GCS) has added a second rail-mounted gantry crane (RMG) at its MANP terminal on the outskirts of Moscow. This has increased the number of train arrivals it can handle up to five or six per week. In addition, it has increased the container yard (CY) capacity to over 2500TEU and the rail track length to 3km.</p>\n<p>\n\tThe new RMG was manufactured in Russia by Technoross and has a lift capacity of 36 tonnes. Containers can be stacked five-high (5+1) and its internal span of 42 m allows containers to be stacked 12 across. It has an outreach that enables it to service a parallel railway track.</p>\n<p>\n\tMANP is located next to the Kresty railway station some 45 km SW from the Moscow ring-road around which a number of important road distribution hubs are situated. MANP is also close to the important Kaluga region where a number of major international companies have invested in manufacturing, assembly and distribution facilities. These well-known names include Samsung, Panasonic, LG, PSA Peugeot Citro&euml;n, Mitsubishi,&nbsp;Adidas, X5 and Nestl&eacute;. Some of these companies already use MANP as an efficient facility for receiving, storage and distribution of goods in the highly important Central Russia market. &nbsp;</p>\n<p>\n\tThe total area of the MANP terminal is 14,6 ha and includes several warehouses offering a total storage capacity of 15,000m2. The facility has a customs bonded area for the acceptance and clearance of transit cargo.</p>\n<p>\n\tMANP also operates own fleet of trucks, recently increased by five new units, for the distribution of goods from the terminal to the storage and production sites of consignees. &nbsp;</p>\n<p>\n\tThe terminal is served by dedicated trains from Novorossiysk and new intermodal solutions via the ports of Saint-Petersburg/Ust-Luga, the Ukraine and the Russian Far East are under active consideration.</p>\n	\N	\N	2013-02-13 10:00:00+04	1821	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	GCS completes substantial investment programme expanding capacity at its MANP terminal in Moscow	ГКС завершает основную инвестиционную программу по увеличению мощности терминала МАНП в Москве	<p>\n\tGlobal Container Services (GCS) has added a second rail-mounted gantry crane (RMG) at its MANP terminal on the outskirts of Moscow. This has increased the number of train arrivals it can handle up to five or six per week. In addition, it has increased the container yard (CY) capacity to over 2500TEU and the rail track length to 3km.</p>\n<p>\n\tThe new RMG was manufactured in Russia by Technoross and has a lift capacity of 36 tonnes. Containers can be stacked five-high (5+1) and its internal span of 42 m allows containers to be stacked 12 across. It has an outreach that enables it to service a parallel railway track.</p>\n<p>\n\tMANP is located next to the Kresty railway station some 45 km SW from the Moscow ring-road around which a number of important road distribution hubs are situated. MANP is also close to the important Kaluga region where a number of major international companies have invested in manufacturing, assembly and distribution facilities. These well-known names include Samsung, Panasonic, LG, PSA Peugeot Citro&euml;n, Mitsubishi,&nbsp;Adidas, X5 and Nestl&eacute;. Some of these companies already use MANP as an efficient facility for receiving, storage and distribution of goods in the highly important Central Russia market. &nbsp;</p>\n<p>\n\tThe total area of the MANP terminal is 14,6 ha and includes several warehouses offering a total storage capacity of 15,000m2. The facility has a customs bonded area for the acceptance and clearance of transit cargo.</p>\n<p>\n\tMANP also operates own fleet of trucks, recently increased by five new units, for the distribution of goods from the terminal to the storage and production sites of consignees. &nbsp;</p>\n<p>\n\tThe terminal is served by dedicated trains from Novorossiysk and new intermodal solutions via the ports of Saint-Petersburg/Ust-Luga, the Ukraine and the Russian Far East are under active consideration.</p>\n	<p>\n\tГлобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км.</p>\n<p>\n\tНовый кран был сделан в России компанией &laquo;Техноросс&raquo;, и имеет грузоподъемность 36 тонн. Кран рассчитан на обработку штабеля высотой&nbsp; 5+1. Внутренний пролет крана составляет 42 метра, что соответствует 12 контейнерам в ширину.</p>\n<p>\n\tМАНП располагается рядом с железнодорожной станцией Кресты в 45 км на юго-запад от МКАД, недалеко от границы с Калужской области, в районе с высокой концентрацией сборочных производств и распределительных центров многих крупных зарубежных компаний. Среди них такие известные производители и марки, как Samsung, Panasonic, LG, PSA Peugeot Citro&euml;n, Mitsubishi, Adidas, X5 и Nestl&eacute;. Некоторые из этих компаний уже используют МАНП как терминал для получения, хранения и распределения товаров в регионе Центральной России.</p>\n<p>\n\tТерминал МАНП занимает 14,6 гектар, на которых расположены несколько складов общей площадью хранения 15,000 м2. На территории терминала находится склад временного хранения для осуществления таможенных операций с поступающими импортными грузами.&nbsp;</p>\n<p>\n\tМАНП располагает собственным парком автоконтейнеровозов, недавно увеличенным на пять единиц, для доставки товаров с терминала до складов грузополучателей.</p>\n<p>\n\tТерминал обслуживается специализированными контейнерными поездами из Новороссийска.&nbsp; В стадии активного рассмотрения находятся проекты поездов из портов Санкт-Петербург/Усть-Луга, Украины и российского Дальнего Востока.</p>\n	<p>\n\tGlobal Container Services (GCS) has added a second rail-mounted gantry crane (RMG) at its MANP terminal on the outskirts of Moscow. This has increased the number of train arrivals it can handle up to five or six per week. In addition, it has increased the container yard (CY) capacity to over 2500TEU and the rail track length to 3km.</p>\n	<p>\n\tГлобальный Контейнерный Сервис (GCS) добавил второй козловой контейнерный кран (RMG) на свой терминал МАНП, расположенный неподалеку от Москвы. Этот позволит увеличить количество поездов, которые могут быть отработаны, до пяти-шести в неделю. Кроме того, ввод нового крана повысил вместимость контейнерной площадки до 2500 TEU, и длину жд фронта до 3 км.</p>\n
2	2012-02-10 04:32:31+04	t			No End in Sight for Labor Stoppages at Rotterdam Port	A labor dispute at APM Terminals in Rotterdam that has disrupted shipping at one of Europe’s largest container handling facilities for over a week shows no sign of an early end.	na-terminale-apm-v-2012-02-09-183231	<p>\n\tA labor dispute at APM Terminals in Rotterdam that has disrupted shipping at one of Europe&rsquo;s largest container handling facilities for over a week shows no sign of an early end.</p>\n<p>\n\tOcean carriers are mulling whether to bypass the terminal as the strike by around 700 workers is delaying the departure of ships by several hours. Vessels that do sail on time are leaving boxes on the docks. The industrial action, over a new wage contract, has ranged from six-hour walkouts to 10-minute stoppages every hour to do exercises.</p>\n<p>\n\tThere is an &ldquo;absolute stalemate&rdquo; in talks between the company and the unions, said APM Terminals spokesman Cor Radings. No fresh talks are planned.</p>\n<p>\n\tAPM, a unit of Denmark&rsquo;s A.P Moller-Maersk, offered a 5.5 percent wage increase over two years coupled with a jobs guarantee through 2015. But it has rejected union demands for the new contract to include compensation for workers affected by government pension reforms extending the national retirement age from 65 to 67.</p>\n<p>\n\tThe disruption is causing a &ldquo;lot of concern&rdquo; for carriers who are now considering their short-term options, Radings said. The dispute is also damaging the APM Terminals reputation for reliability, he said. This is the first industrial action since a wildcat strike in 2010.</p>\n<p>\n\tAPM Terminals&nbsp;<a href="http://www.joc.com/portsterminals/analyst-says-rotterdam-container-growth-will-outpace-rivals" target="_blank">Rotterdam handles around 2.4 million 20-equivalent units a year</a>, with more than 50 percent of the traffic accounted for by sister company Maersk Line.</p>\n	\N	\N	2012-02-08 10:00:00+04	1753	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	No End in Sight for Labor Stoppages at Rotterdam Port	На терминале APM в Роттердаме продолжается забастовка.	<p>\n\tA labor dispute at APM Terminals in Rotterdam that has disrupted shipping at one of Europe&rsquo;s largest container handling facilities for over a week shows no sign of an early end.</p>\n<p>\n\tOcean carriers are mulling whether to bypass the terminal as the strike by around 700 workers is delaying the departure of ships by several hours. Vessels that do sail on time are leaving boxes on the docks. The industrial action, over a new wage contract, has ranged from six-hour walkouts to 10-minute stoppages every hour to do exercises.</p>\n<p>\n\tThere is an &ldquo;absolute stalemate&rdquo; in talks between the company and the unions, said APM Terminals spokesman Cor Radings. No fresh talks are planned.</p>\n<p>\n\tAPM, a unit of Denmark&rsquo;s A.P Moller-Maersk, offered a 5.5 percent wage increase over two years coupled with a jobs guarantee through 2015. But it has rejected union demands for the new contract to include compensation for workers affected by government pension reforms extending the national retirement age from 65 to 67.</p>\n<p>\n\tThe disruption is causing a &ldquo;lot of concern&rdquo; for carriers who are now considering their short-term options, Radings said. The dispute is also damaging the APM Terminals reputation for reliability, he said. This is the first industrial action since a wildcat strike in 2010.</p>\n<p>\n\tAPM Terminals&nbsp;<a href="http://www.joc.com/portsterminals/analyst-says-rotterdam-container-growth-will-outpace-rivals" target="_blank">Rotterdam handles around 2.4 million 20-equivalent units a year</a>, with more than 50 percent of the traffic accounted for by sister company Maersk Line.</p>\n	<p>\n\tТрудовому спору и забастовке на терминале APM Terminals в Роттердаме, который уже привёл к сбою линейных сервисов в одном из крупнейших контейнерных портов Европы, не видно близкого завершения.&nbsp;</p>\n<p>\n\tОкеанские перевозчики рассматривают приостановку заходов на терминал, так как забастовка, в которой участвуют около 700 работников, уже привела к задержкам с отправкой судов на несколько часов. &nbsp; &nbsp;Суда для соблюдения расписания вынуждены снимать часть груза с погрузки.&nbsp;</p>\n<p>\n\tЗабастовочные действия профсоюзов в ходе продолжающегося обсуждения зарплат варьируются от шестичасовых остановок работ до 10-минутных приостановок каждый час.</p>\n<p>\n\tПереговоры между администрацией компании и профсоюзами зашли в &laquo;полный тупик&raquo; - сообщил представитель терминала APM Кор Радингс. Дальнейшие переговоры не планируются.</p>\n<p>\n\tAPM, дочка датской A.P Moller-Maersk, предложил 5.5% повышение зарплаты в течении двух лет, а также гарантии трудоустройства до 2015 года. Администрация однако отвергла требования профсоюза включить в новый контракт компенсацию для работников, затронутых пенсионной реформой по увеличению пенсионного возраста с 65 до 67 лет.</p>\n<p>\n\tСбои в работе порта вызывают &ldquo;серьезную обеспокоенность&rdquo; со стороны линий, которые сейчас рассматривают альтернативные порты захода на ближайшую перспективу, - сказал Радингс. Трудовой спор также бьет по репутации терминалов APM в части надежности оказываемых услуг. Эта забастовка является первой после &laquo;дикой&raquo; неофициальной забастовки 2010 года.&nbsp;</p>\n<p>\n\tТерминал APM в Роттердаме обрабатывает около 2,4 миллионов TEU в год, более половины этого объема обеспечивается родственной терминалу линией Maersk Line.</p>\n	A labor dispute at APM Terminals in Rotterdam that has disrupted shipping at one of Europe’s largest container handling facilities for over a week shows no sign of an early end.	Трудовому спору и забастовке на терминале APM Terminals в Роттердаме, который уже привёл к сбою линейных сервисов в одном из крупнейших контейнерных портов Европы, не видно близкого завершения.  
2	2012-02-11 00:10:05+04	t			Maersk maiden call at Ust-Luga terminal	Maersk line made its maiden call at Dec.2011 launched Ust-Luga container terminal (ULCT). 	maersk-v-ust-luge-2012-02-10-141005	<p>\n\tMaersk line made its maiden call at Dec.2011 launched Ust-Luga container terminal (ULCT).</p>\n<p>\n\tM/v Maersk Vancouver (1719 TEU) arrived to discharge at Ust-Luga some 144 TEU.</p>\n<p>\n\tAccording to Maersk Line schedule, the vessel had arrived from Bremerhafen, and after Ust-Luga would proceed to St. Petersburg container terminal (SPCT &ndash; ex.4th Stevedoring Co.), then back to Bremerhafen.</p>\n<p>\n\tNeither Maersk nor the ULCT operator NCC could comment on outlooks of further calls of the line at Ust-Luga.</p>\n	\N	\N	2012-02-09 10:00:00+04	1754	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk maiden call at Ust-Luga terminal	Maersk в Усть-Луге	<p>\n\tMaersk line made its maiden call at Dec.2011 launched Ust-Luga container terminal (ULCT).</p>\n<p>\n\tM/v Maersk Vancouver (1719 TEU) arrived to discharge at Ust-Luga some 144 TEU.</p>\n<p>\n\tAccording to Maersk Line schedule, the vessel had arrived from Bremerhafen, and after Ust-Luga would proceed to St. Petersburg container terminal (SPCT &ndash; ex.4th Stevedoring Co.), then back to Bremerhafen.</p>\n<p>\n\tNeither Maersk nor the ULCT operator NCC could comment on outlooks of further calls of the line at Ust-Luga.</p>\n	<p>\n\tЛиния Maersk совершила первый судозаход в Усть-Лугу.&nbsp;Судно &laquo;Maersk Vancouver&raquo; (вместимость 1719 TEU) прибыл для выгрузки на Усть-Лужском контейнерном терминале (УЛКТ) 144 TEU контейнеров.</p>\n<p>\n\tПо расписанию Maersk, на УЛКТ судно пришло из Бремерхафена, а далее следует на контейнерный терминал &laquo;Морского порта&raquo;, а оттуда снова на Бремерхафен.</p>\n<p>\n\tНи Maersk ни оператор терминала НКК дальнейшие планы заходов линии не комментируют.</p>\n	Maersk line made its maiden call at Dec.2011 launched Ust-Luga container terminal (ULCT). 	<p>\n\tЛиния Maersk совершила первый судозаход в Усть-Лугу.</p>\n
2	2012-02-14 22:26:56+04	t			New terminal in Muuga	<p>\n\tRail Garant of Russia has started outfitting its new 600-metre container Terminal at Tallinn&rsquo;s Muuga harbour, which is to enter operations by the first quarter of 2013.</p>\n	novyij-kontejnernyij-terminal-v-2012-02-14-122656	<p>\n\tRail Garant of Russia has started outfitting its new 600-metre container Terminal at Tallinn&rsquo;s Muuga harbour, which is to enter operations by the first quarter of 2013.</p>\n<p>\n\tLast year Rail Garant won a tender for development of the new container terminal in Muuga and signed respective agreement with the Talinn port administration.</p>\n<p>\n\tOn Jan. 30rd the first pile of the berth wall was hammered in.</p>\n<p>\n\tAs reported by Rail Garant board member Nikolay Filin, in 2012 the first stage of the terminal must be completed, including crane rails, railway lines, and civil engineering infrastructure.</p>\n<p>\n\tDelivery and erection of gantries must be finished by the year end. The first shipments are expected to reach the terminal in the Q1&rsquo; 2013.</p>\n<p>\n\tRail Garant envisages that by the Q4&rsquo;2013 monthly throughput of the terminal must grow till 10&nbsp;000 TEU, in 2014 the terminal handling is forecast at 125&nbsp;000 TEU &ndash; full capacity of the terminal&rsquo;s first stage.</p>\n	\N	\N	2012-02-10 10:00:00+04	1755	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	New terminal in Muuga	Новый контейнерный терминал в Мууге	<p>\n\tRail Garant of Russia has started outfitting its new 600-metre container Terminal at Tallinn&rsquo;s Muuga harbour, which is to enter operations by the first quarter of 2013.</p>\n<p>\n\tLast year Rail Garant won a tender for development of the new container terminal in Muuga and signed respective agreement with the Talinn port administration.</p>\n<p>\n\tOn Jan. 30rd the first pile of the berth wall was hammered in.</p>\n<p>\n\tAs reported by Rail Garant board member Nikolay Filin, in 2012 the first stage of the terminal must be completed, including crane rails, railway lines, and civil engineering infrastructure.</p>\n<p>\n\tDelivery and erection of gantries must be finished by the year end. The first shipments are expected to reach the terminal in the Q1&rsquo; 2013.</p>\n<p>\n\tRail Garant envisages that by the Q4&rsquo;2013 monthly throughput of the terminal must grow till 10&nbsp;000 TEU, in 2014 the terminal handling is forecast at 125&nbsp;000 TEU &ndash; full capacity of the terminal&rsquo;s first stage.</p>\n	<p>\n\tРоссийская компания&nbsp;Rail Garant&nbsp;приступила к развитию нового контейнерного терминала в порту Мууга.</p>\n<p>\n\tТерминал с причальной стенкой длиной 600 метров должен вступить в строй в первом квартале 2013 года.</p>\n<p>\n\tВ прошлом году Группа компаний Rail Garant выиграла тендер на строительство нового контейнерного терминала в эстонском порту Мууга и подписала соглашение о сотрудничестве с Таллинским портом.</p>\n<p>\n\t30 января в терминал была торжественно вбита первая свая. &laquo;В целом в 2012 году планируется завершить строительство первой очереди терминала &ndash; построить подкрановые пути, железнодорожные пути и инженерную инфраструктуру&raquo;, - сообщил на пресс-конференции член правления Rail Garant Николай Фалин.</p>\n<p>\n\tПоставка и установка кранового оборудования для запуска первой очереди будет завершена к концу года. Начало первых перевозок запланировано на первый квартал 2013 года.&nbsp;<br />\n\tВ планах Rail Garant к четвертому кварталу будущего года увеличить ежемесячный грузооборот терминала до 10 тысяч TEU. В 2014 году прогнозируемый годовой объем составит 125 тысяч TEU, соответствующий мощности первой очереди терминала.</p>\n	<p>\n\tRail Garant of Russia has started outfitting its new 600-metre container Terminal at Tallinn&rsquo;s Muuga harbour, which is to enter operations by the first quarter of 2013.</p>\n	<p>\n\tРоссийская компания&nbsp;Rail Garant&nbsp;приступила к развитию нового контейнерного терминала в порту Мууга.</p>\n
2	2012-02-20 20:47:07+04	t			Tonnage upgrade on ABX service Asia to Black Sea	<p>\n\tAs from mid-March, the Asia Black Sea Express (ABX) of China Shipping (4 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 each) will deploy ships of 5,500 TEU.</p>\n	rasshirenie-kontejnernogo-servisa-abx-2012-02-20-104707	<p>\n\tAs from mid-March, the Asia Black Sea Express (ABX) of China Shipping (4 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 each) will deploy ships of 5,500 TEU, replacing 4,200 TEU tonnage, a capacity increase of some 30%.</p>\n<p>\n\tAfter having called at Damietta, Piraeus and Istanbul (Ambarli), the vessels continue to the Black Sea ports of Constantza and Illichevsk.</p>\n	\N	\N	2012-02-17 10:00:00+04	1757	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Tonnage upgrade on ABX service Asia to Black Sea	Расширение контейнерного сервиса ABX Азия – Черное море	<p>\n\tAs from mid-March, the Asia Black Sea Express (ABX) of China Shipping (4 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 each) will deploy ships of 5,500 TEU, replacing 4,200 TEU tonnage, a capacity increase of some 30%.</p>\n<p>\n\tAfter having called at Damietta, Piraeus and Istanbul (Ambarli), the vessels continue to the Black Sea ports of Constantza and Illichevsk.</p>\n	<p>\n\tС середины марта контейнерный сервис Asia Black Sea Express (ABX) линий China Shipping (4 судна), &ldquo;K&rdquo; Line, PIL, Wan Hai</p>\n<p>\n\tи YangMing (по одному судну от каждого участника) задействует суда вместимостью 5,500 TEU, заменяя ранее использовавшиеся суда 4,200 TEU&ndash; увеличение провозной способности сервиса почти на 30%.</p>\n<p>\n\tПосле заходов в Дамиетту, Пирей и Стамбул сервис следует в черноморские порты Констанца и Ильичевск. Доставка контейнеров в Новороссийск осуществляется фидером через порт Констанца.</p>\n	<p>\n\tAs from mid-March, the Asia Black Sea Express (ABX) of China Shipping (4 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 each) will deploy ships of 5,500 TEU.</p>\n	<p>\n\tС середины марта контейнерный сервис Asia Black Sea Express (ABX) линий China Shipping (4 судна), &ldquo;K&rdquo; Line, PIL, Wan Hai и YangMing (по одному судну от каждого участника) задействует суда вместимостью 5,500 TEU.</p>\n
2	2012-02-22 23:02:34+04	t			MSC Set to Grab Asia-Europe Business From Maersk	<p>\n\tGeneva-based carrier&#39;s fleet of 43 vessels over 12,500 TEU &quot;dwarfs&quot; rival&#39;s</p>\n	msc-otvoevyivaet-u-maersk-2012-02-22-130234	<p>\n\tGeneva-based carrier&#39;s fleet of 43 vessels over 12,500 TEU &quot;dwarfs&quot; rival&#39;s</p>\n<p>\n\tMediterranean Shipping is set to significantly increase its share of Asia-Europe container traffic in 2012 at the expense of market leader Maersk Line, according to Alphaliner.</p>\n<p>\n\tThe Geneva-based carrier &ldquo;holds the wildcard&rdquo; on the world&rsquo;s biggest trade lane because its fleet of 43 vessels over 12,500 20-foot equivalent units &ldquo;dwarfs&rdquo; Maersk&rsquo;s current tally of 21 11,500 TEUs ships, the container analyst said.</p>\n<p>\n\tMSC received its 43rd ship of above 11,500 TEUs last week, enabling the the world&rsquo;s second largest ocean carrier to deploy a full fleet of 11,500-14,000 TEUs ships on each of its four Far East-Europe-Mediterranean strings for the first time.</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of March MSC will be operating 43 vessels above 12,500 TEUs, if deliveries proceed on schedule. This means its four Far East-Europe-Mediterranean services will deploy ships above 12,500 TEUs, as the remaining 11,500 TEUs vessels are displaced by the latest newbuildings.</p>\n<p>\n\tThe gap between MSC and Maersk will widen during the year as MSC is expected to receive further very large and ultra large container ships, boosting its 11,500-14,000 TEUs fleet to 56 by the end of 2012. Of these, 52 ships are larger than 12,500 TEUs.</p>\n<p>\n\tMaersk, by contrast, will not receive any new ships of this size in 2012 as the first of the carrier&rsquo;s giant 18,000 TEUs Triple-E vessels are not expected to enter the market until early 2013.</p>\n<p>\n\t&ldquo;This gives MSC an edge to increase its market share substantially this year, mainly at the expense of Maersk,&rdquo; according to Alphaliner.</p>\n<p>\n\tMaersk reaffirmed its determination to defend its Asia-Europe market share last week even as it announced it will <a href="http://www.joc.com/container-lines/maersk-cuts-asia-europe-capacity-9-percent" target="_blank">cut capacity by 9 percent through a vessel sharing agreement with French carrier CMA CGM</a> in a bid to restore profitability.</p>\n<p>\n\t&ldquo;We will defend our market share position at any cost, while focusing on growing with the market and restoring profitability,&rdquo; the Danish carrier said.</p>\n<p>\n\tMaersk Line has an estimated 18 percent share of the Asia-Europe market.</p>\n	\N	\N	2012-02-21 10:00:00+04	1759	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MSC Set to Grab Asia-Europe Business From Maersk	MSC отвоевывает у Maersk рынок контейнерных перевозок из Азии в Европу	<p>\n\tGeneva-based carrier&#39;s fleet of 43 vessels over 12,500 TEU &quot;dwarfs&quot; rival&#39;s</p>\n<p>\n\tMediterranean Shipping is set to significantly increase its share of Asia-Europe container traffic in 2012 at the expense of market leader Maersk Line, according to Alphaliner.</p>\n<p>\n\tThe Geneva-based carrier &ldquo;holds the wildcard&rdquo; on the world&rsquo;s biggest trade lane because its fleet of 43 vessels over 12,500 20-foot equivalent units &ldquo;dwarfs&rdquo; Maersk&rsquo;s current tally of 21 11,500 TEUs ships, the container analyst said.</p>\n<p>\n\tMSC received its 43rd ship of above 11,500 TEUs last week, enabling the the world&rsquo;s second largest ocean carrier to deploy a full fleet of 11,500-14,000 TEUs ships on each of its four Far East-Europe-Mediterranean strings for the first time.</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of March MSC will be operating 43 vessels above 12,500 TEUs, if deliveries proceed on schedule. This means its four Far East-Europe-Mediterranean services will deploy ships above 12,500 TEUs, as the remaining 11,500 TEUs vessels are displaced by the latest newbuildings.</p>\n<p>\n\tThe gap between MSC and Maersk will widen during the year as MSC is expected to receive further very large and ultra large container ships, boosting its 11,500-14,000 TEUs fleet to 56 by the end of 2012. Of these, 52 ships are larger than 12,500 TEUs.</p>\n<p>\n\tMaersk, by contrast, will not receive any new ships of this size in 2012 as the first of the carrier&rsquo;s giant 18,000 TEUs Triple-E vessels are not expected to enter the market until early 2013.</p>\n<p>\n\t&ldquo;This gives MSC an edge to increase its market share substantially this year, mainly at the expense of Maersk,&rdquo; according to Alphaliner.</p>\n<p>\n\tMaersk reaffirmed its determination to defend its Asia-Europe market share last week even as it announced it will <a href="http://www.joc.com/container-lines/maersk-cuts-asia-europe-capacity-9-percent" target="_blank">cut capacity by 9 percent through a vessel sharing agreement with French carrier CMA CGM</a> in a bid to restore profitability.</p>\n<p>\n\t&ldquo;We will defend our market share position at any cost, while focusing on growing with the market and restoring profitability,&rdquo; the Danish carrier said.</p>\n<p>\n\tMaersk Line has an estimated 18 percent share of the Asia-Europe market.</p>\n	<p>\n\tФлот MSC из &nbsp; 43 судов вместимостью более 12,500 TEU решительно опережает размер аналогично тоннажа своего главного конкурента.<br />\n\t<br />\n\tСогласно агентству Alphaliner, швейцарская линия в 2012 значительно нарастит свою долю на направлении перевозок Азия &ndash; Европа, в основном, за счет нынешнего лидера Maersk.<br />\n\t<br />\n\tНа крупнейшем мировом трейде у MSC имеется такой важный козырь, как флот из 43 судов, вместимостью более 12,500 TEU, который решительно опережает аналогичных тоннаж своего конкурента: Maersk сейчас оперирует 21 судном вместимостью более 11,500 TEU.<br />\n\t<br />\n\tMSC принял 43ее судно такой вместимости на прошлой неделе.<br />\n\t<br />\n\tЭто позволяет линии полностью укомплектовать все свои четыре сервиса из Азии в Европу и Средиземное море всем своим флотом судов вместимостью 11,500-14,000 TEU.<br />\n\tЕсли график строительства будет выполняться, к концу марта MSCбудет оперировать 43 судами вместимостью более 12,500 TEU.<br />\n\t<br />\n\tВ итоге линия сможет разместить на сервисах Азия &ndash; Европа только суда от 12,500 TEUs, полностью вытеснив суда&nbsp; 11,500 TEUs вновь вводящимися пароходами большей вместимости.<br />\n\tВ течении года разрыв между MSC и Maersk будет только увеличиваться, т.к. к концу 2012 флот первого возрастет до 56 судов размером 11,500-14,000 TEU. Из них 52 судна будут больше, чем 12,500 TEU.<br />\n\t<br />\n\tMaersk, напротив, не ожидает поступления новых судов такого размера до конца года, поскольку первые суда 3Е класса этой линии, вместимостью 18,000 TEU ожидаются не раньше начала 2013.<br />\n\tВ то же время, Maersk на прошлой неделе подтвердил свою решимость сохранить свою долю рынка на направлении контейнерных перевозок Азия-Европа, сообщая о сокращении своего тоннажа на этом трейде на 9% и запуске совместных сервисов с CMA-CGMв целях восстановления доходности перевозок.<br />\n\t<br />\n\t&ldquo;Мы будем любой ценой бороться за сохранение своей доли, фокусируя усилия на росте вместе с рынком и восстановлении доходности операций&rdquo;, - сообщил датский перевозчик.<br />\n\t<br />\n\tДоля Maersk на этом трейде сейчас оценивается в размере 18%.</p>\n	<p>\n\tGeneva-based carrier&#39;s fleet of 43 vessels over 12,500 TEU &quot;dwarfs&quot; rival&#39;s</p>\n	<p>\n\tФлот MSCиз&nbsp; 43 судов вместимостью более 12,500 TEU решительно опережает размер аналогично тоннажа своего главного конкурента.</p>\n
2	2012-02-24 20:11:22+04	t			Maersk Drops Option to Order Last 10 Triple-E Ships	<p>\n\tDanish carrier won&#39;t deploy 180,000 TEUs of capacity on Asia-Europe trade lane</p>\n	maersk-otkazyivaetsya-ot-optsiona-2012-02-24-101122	<p>\n\tDanish carrier won&#39;t deploy 180,000 TEUs of capacity on Asia-Europe trade lane<br />\n\tThe decision by Maersk Line not to exercise an option to order another 10 mega-containerships with capacities of 18,000 20-foot equivalent units was no surprise considering overcapacity on the Asia-Europe trade.<br />\n\t&ldquo;That had been implied quite a while ago,&rdquo; said Martin Dixon, editor of Drewry&rsquo;s Container Freight Rate Insight. &ldquo;There&rsquo;s too much capacity, and demand on the Asia-Europe trade where those vessels would have been deployed is slowing.&rdquo;<br />\n\tMaersk Line ordered 10 Triple-E ships a year ago this month from South Korea&rsquo;s Daewoo Shipbuilding and Marine Engineering. The world&rsquo;s largest container line also had an option to order another 20 of the ships, and later exercised its option to order 10 of them.<br />\n\tIf Maersk had exercised its option to order the last 10 of the 30 so-called Triple-E ships, those ships would have been delivered around 2015.<br />\n\tDixon said there are reports that other lines looking to hold back orders going into 2013. &ldquo;Demand is unlikely to be strong on that trade in the two years ahead,&rdquo; he said.<br />\n\tWhenMaersk announced on Feb. 17 that it would reduce capacity on the Asia-Europe trade by 9 percent, Maersk said it would &ldquo;not declare&rdquo; its option for the last 10 Triple-E ships.&nbsp; Maersk also said it will consider additional opportunities to reduce capacity, including redelivery of time charter tonnage, the use of lay-ups and slow-steaming.</p>\n	\N	\N	2012-02-22 10:00:00+04	1760	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Drops Option to Order Last 10 Triple-E Ships	Maersk отказывается от опциона на покупку 10 судов-контейнеровозов класса 3E	<p>\n\tDanish carrier won&#39;t deploy 180,000 TEUs of capacity on Asia-Europe trade lane<br />\n\tThe decision by Maersk Line not to exercise an option to order another 10 mega-containerships with capacities of 18,000 20-foot equivalent units was no surprise considering overcapacity on the Asia-Europe trade.<br />\n\t&ldquo;That had been implied quite a while ago,&rdquo; said Martin Dixon, editor of Drewry&rsquo;s Container Freight Rate Insight. &ldquo;There&rsquo;s too much capacity, and demand on the Asia-Europe trade where those vessels would have been deployed is slowing.&rdquo;<br />\n\tMaersk Line ordered 10 Triple-E ships a year ago this month from South Korea&rsquo;s Daewoo Shipbuilding and Marine Engineering. The world&rsquo;s largest container line also had an option to order another 20 of the ships, and later exercised its option to order 10 of them.<br />\n\tIf Maersk had exercised its option to order the last 10 of the 30 so-called Triple-E ships, those ships would have been delivered around 2015.<br />\n\tDixon said there are reports that other lines looking to hold back orders going into 2013. &ldquo;Demand is unlikely to be strong on that trade in the two years ahead,&rdquo; he said.<br />\n\tWhenMaersk announced on Feb. 17 that it would reduce capacity on the Asia-Europe trade by 9 percent, Maersk said it would &ldquo;not declare&rdquo; its option for the last 10 Triple-E ships.&nbsp; Maersk also said it will consider additional opportunities to reduce capacity, including redelivery of time charter tonnage, the use of lay-ups and slow-steaming.</p>\n	<p>\n\tДатский перевозчик не разместит на направлении Азия &ndash; Европа тоннаж в объеме &nbsp;180,000TEU.<br />\n\tРешение линии не использовать опцион на приобретение дополнительных 10 судов вместимостью 18,000TEUне стало сюрпризом, ввиду наблюдаемого сейчас избытка тоннажа на данном направлении. &nbsp;<br />\n\t&ldquo;Это было ясно уже достаточно давно,&rdquo; &ndash; сообщил Мартин Диксон, редактор аналитического издания Drewry&rsquo;sContainerFreightRateInsight. &ldquo;На направлении Азия &ndash; Европа, где планировалось использовать данные суда, уже и так слишком много тоннажа, а спрос замедляется.&rdquo;<br />\n\tMaersk заказал 10 судов класса 3E ровно год назад у южнокорейской верфи DaewooShipbuildingandMarineEngineering. Крупнейшая в мире линия также получила опцион на приобретение дополнительных 20 судов такого класса, на 10 из которых она его и реализовала.<br />\n\tЕсли бы Maersk использовала этот опцион на покупку последних 10 из 30 судов 3Е, эти суда были бы поставлены заказчику около 2015 года.<br />\n\tДиксон сообщил о том, что и другие линии рассматривают возможность приостановить заказы в 2013 году. &ldquo;Маловероятно, что спрос на контейнерные перевозки сколько-нибудь оживится в ближайшие два года&quot;, - сообщил он.<br />\n\t17 февраля, при объявлении о планируемом сокращении тоннажа на направлении Азия-Европа на 9%,Maersk также сообщил, что линия не &laquo;раскроет&raquo; опцион на 10 дополнительных 3Е класса, и будет рассматривать дополнительные возможности для сокращения задействованного флота путем возврата зафрахтованного тоннажа, вывода судов на отстой и дальнейшего замедления сервисов.</p>\n	<p>\n\tDanish carrier won&#39;t deploy 180,000 TEUs of capacity on Asia-Europe trade lane</p>\n	<p>\n\tДатский перевозчик не разместит на направлении Азия &ndash; Европа тоннаж в объеме &nbsp;180,000TEU.</p>\n
2	2012-03-11 18:38:18+04	t			Mega-Ship Trend Comes With Consequences	<p>\n\tAnalysts predict container industry will shrink to seven to 10 carriers by mid-2020s&nbsp;</p>\n	posledstviya-vvoda-sverhkrupnyih-kontejnernyih-2012-03-11-093818	<p>\n\tAnalysts predict container industry will shrink to seven to 10 carriers by mid-2020s&nbsp;</p>\n<p>\n\tThe economies of scale that are driving carriers to replace their fleets with mega-ships will result in the consolidation of shipping lines or in the reduction of competition on customer service, according to a panel on the growth of ship sizes at the 12th annual Trans-Pacific Maritime Conference in Long Beach on Monday.</p>\n<p>\n\t&ldquo;The container industry will shrink to seven to 10 carriers by the mid-2020s,&rdquo; said Lars Jensen, CEO and partner of Seaintel Maritime Analysis. &ldquo;It may be eight, it may be 10, but there will be fewer players.&rdquo;</p>\n<p>\n\tJensen said industry consolidation, which has stalled in recent years but will start again by 2015 because of the need to order and pay for more ships with capacities of more than 10,000 20-foot equivalent units.&nbsp;</p>\n<p>\n\tThe capacity of the global container fleet will grow by 7 percent per year through 2015, but the capacity of the new mega-ships being delivered will increase at a 30 percent annual rate, Jensen said. &ldquo;From now until the end of 2014, the mega-ship fleet will grow by 120 percent,&rdquo; he said. By 2015, mega-ships will account for more than half of the capacity of the total container fleet.</p>\n<p>\n\tAs more large ships enter the Asia-Europe and the trans-Pacific trades, carriers will cascade smaller and less-efficient ships on the trans-Atlantic and the north-south trades, which have not been hit by the overcapacity that has caused freight rates to plunge. But these trades, which have had relatively stable freight rates, will start to suffer from too much capacity, Jensen said.</p>\n<p>\n\tIn the last few months, most of the major container lines have consolidated their east-west services in reaction to the advent of the Daily Maersk service between Asia and Europe last fall.</p>\n<p>\n\t&ldquo;These carrier consolidations are not marriages made of love,&rdquo; said Otto Schacht, global head of seafreight for Kuehne + Nagel. He said this is resulting in less choice for shippers because the consolidated services offer fewer sailings and departure times. The only way a carrier that is selling a consolidated service can differentiate itself from the competition is through better services, he added.</p>\n<p>\n\tTim O&rsquo;Connell, senior director of trade and marketing for Maersk Line North America, said the carrier had ordered its 18,000-TEU Triple-E ships to achieve economies of scale through the lowest slot costs and high-energy efficiency and low emissions.</p>\n<p>\n\t&ldquo;The size of the mega-ships is already approaching its upper limit, because ships larger than 18,000-TEUs cannot be loaded and unloaded quick enough to offer the frequency of sailings demanded by the market, Jensen said. In addition, few ports have the infrastructure to handle ships bigger than the Maersk Triple-E ships.</p>\n	\N	\N	2012-03-05 10:00:00+04	1762	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Mega-Ship Trend Comes With Consequences	Последствия ввода сверхкрупных контейнерных судов.	<p>\n\tAnalysts predict container industry will shrink to seven to 10 carriers by mid-2020s&nbsp;</p>\n<p>\n\tThe economies of scale that are driving carriers to replace their fleets with mega-ships will result in the consolidation of shipping lines or in the reduction of competition on customer service, according to a panel on the growth of ship sizes at the 12th annual Trans-Pacific Maritime Conference in Long Beach on Monday.</p>\n<p>\n\t&ldquo;The container industry will shrink to seven to 10 carriers by the mid-2020s,&rdquo; said Lars Jensen, CEO and partner of Seaintel Maritime Analysis. &ldquo;It may be eight, it may be 10, but there will be fewer players.&rdquo;</p>\n<p>\n\tJensen said industry consolidation, which has stalled in recent years but will start again by 2015 because of the need to order and pay for more ships with capacities of more than 10,000 20-foot equivalent units.&nbsp;</p>\n<p>\n\tThe capacity of the global container fleet will grow by 7 percent per year through 2015, but the capacity of the new mega-ships being delivered will increase at a 30 percent annual rate, Jensen said. &ldquo;From now until the end of 2014, the mega-ship fleet will grow by 120 percent,&rdquo; he said. By 2015, mega-ships will account for more than half of the capacity of the total container fleet.</p>\n<p>\n\tAs more large ships enter the Asia-Europe and the trans-Pacific trades, carriers will cascade smaller and less-efficient ships on the trans-Atlantic and the north-south trades, which have not been hit by the overcapacity that has caused freight rates to plunge. But these trades, which have had relatively stable freight rates, will start to suffer from too much capacity, Jensen said.</p>\n<p>\n\tIn the last few months, most of the major container lines have consolidated their east-west services in reaction to the advent of the Daily Maersk service between Asia and Europe last fall.</p>\n<p>\n\t&ldquo;These carrier consolidations are not marriages made of love,&rdquo; said Otto Schacht, global head of seafreight for Kuehne + Nagel. He said this is resulting in less choice for shippers because the consolidated services offer fewer sailings and departure times. The only way a carrier that is selling a consolidated service can differentiate itself from the competition is through better services, he added.</p>\n<p>\n\tTim O&rsquo;Connell, senior director of trade and marketing for Maersk Line North America, said the carrier had ordered its 18,000-TEU Triple-E ships to achieve economies of scale through the lowest slot costs and high-energy efficiency and low emissions.</p>\n<p>\n\t&ldquo;The size of the mega-ships is already approaching its upper limit, because ships larger than 18,000-TEUs cannot be loaded and unloaded quick enough to offer the frequency of sailings demanded by the market, Jensen said. In addition, few ports have the infrastructure to handle ships bigger than the Maersk Triple-E ships.</p>\n	<p>\n\tАналитики прогнозируют сжатие мировой контейнерной отрасли до 7-10 игроков к середине 2020-х годов. &nbsp;</p>\n<p>\n\tЭкономия масштаба, которая заставляет перевозчиков заменять существующий контейнерный флот сверхкрупными судами приведет к укрупнению контейнерных линий и снижению конкуренции по уровню клиентского сервиса. К такому выводу пришли эксперты, выступавшие на 12 ежегодной Транс-Тихоокеанской морской конференции в Лонг Биче, в ходе дискуссии по росту вместимости контейнерных судов в понедельник. &nbsp;&nbsp;</p>\n<p>\n\t&laquo;Контейнерная отрасль сократится до 7-10 игроков к середине 2020х годов&raquo;, - сообщил LarsJensen, CEOи партнёр в компании SeaintelMaritimeAnalysis. &laquo;Может остаться 8 игроков, может остаться 10, но их в любом случае будет меньше&raquo;. &nbsp;</p>\n<p>\n\tJensen отметил, что консолидация отрасли, которая приостановилась в прошлые годы, возобновится не позднее 2015 года ввиду необходимости заказа все большего числа контейнерных судов, вместимостью более 10 0000 TEU.</p>\n<p>\n\tРост мирового контейнерного тоннажа составит около 7% в год до 2015 года, но объем нового сверхкрупного флота будет расти не менее, чем на 30% в год. &laquo;С настоящего момента до конца 2014 года вместимость сверхкрупных контейнеровозов возрастет на 120%&raquo;, - сообщил Jensen. &nbsp;К 2015 на такие мега-суда будет приходиться более половины всего мирового тоннажа.</p>\n<p>\n\tПо мере того, как все больше крупных судов вводится в строй на азиатско-европейском и транс-тихоокеанском направлениях, линии каскадируют менее крупный и менее эффективный флот на трансатлантические сервисы и направления Север-Юг, которые были менее затронуты ростом предложения и ценовой войной в прошлом. При этом, однако, эти трейды, которые отличались до сих пор достаточно стабильным уровнем ставок, будут страдать от излишнего тоннажа и избытка предложения, сообщил Jensen.</p>\n<p>\n\tВ последние несколько месяцев большинство основных линий объединили свои контейнерные сервисы на направлении восток-запад, вслед за объявлением о запуске сервиса DailyMaersk между Азией и Европой прошлой осенью. &nbsp;</p>\n<p>\n\t&laquo;Эти альянсы морских перевозчиков отнюдь не являются браками по любви&raquo;, - отметил Otto Schacht, директор по морским перевозкам компании Kuehne + Nagel. Он сообщил, что укрупнение контейнерных линий приведёт к сужению выбора для клиентов, ввиду сокращения числа выполняемых рейсов. Единственным способом для линий выделить себя среди партнёров по совместному сервису останется только более высокое качество обслуживания, добавил он.</p>\n<p>\n\tTim O&rsquo;Connell, главный региональный директор по маркетингу линии Maersk в Северной Америке, сообщил, что линии заказала суда 3Е класса вместимостью 18,000-TEU для достижения наиболее низкой себестоимости перевозки и наивысшей эффективности по уровню энергозатрат и выбросов в атмосферу.</p>\n<p>\n\t&laquo;Размер сверхкрупных контейнерных судов уже достигает своего верхнего предела, т.к. суда больше, чем 18,000-TEU не могут быть так быстро обработаны в портах, чтобы это не повлияло на частоту судозаходов, требуемую рынком. Кроме того, лишь несколько портов в мире способны обрабатывать суда большего размера, чем класса 3Е Maersk&raquo;, - сообщил Jensen.</p>\n	<p>\n\tAnalysts predict container industry will shrink to seven to 10 carriers by mid-2020s&nbsp;</p>\n	<p>\n\tАналитики прогнозируют сжатие мировой контейнерной отрасли до 7-10 игроков к середине 2020-х годов. &nbsp;</p>\n
2	2012-03-22 00:50:40+04	t			Partnership of Green Alliance and Evergreen set-up	New-found partners Green Alliance (Coscon, Hanjin, “K” Line and Yang Ming) and Evergreen have detailed\n\ntheir announced Europe/Mediterranean-Far East slot-swap co-operation, to take effect in April.	opredelilas-struktura-kontejnernyih-servisov-2012-03-21-155040	<p>\n\tTogether they will provide eight loops out of North Europe (Green Alliance/5 and Evergreen/3) and four out of the Mediterranean (3 and 1), respectively, initially using ships ranging between 5,400 TEU and 11,000 TEU (to grow to an upper limit of 13,100 TEU).</p>\n<p>\n\tThe North Europe services will be operated by 76 ships with a total capacity of 690,000 TEU, which is an average 9,100 TEU per vessel. 65% of the overall capacity will come from forty-seven units of 9,600 TEU, to be provided by the four Green Alliance partners.The remaining 35% (29 ships/8,300 TEU) will be deployed by Evergreen and its vessel operating partners China Shipping (7 ships) and ZIM (3).</p>\n<p>\n\tFor the Med-Asia package, the Green Alliance is to deploy 26 ships, average 6,400 TEU, total 165,000 TEU, while the single Evergreen service (actually a pendulum) is operated by fourteen 5,400 TEU units.</p>\n<p>\n\tBesides some minor changes to their existing North Europe-Far East connections, the combined portfolio includes two resurrected seasonally-suspended loops, the Green Alliance&rsquo;s NE4 and Evergreen&rsquo;s CES2 (operated together with China Shipping and ZIM). These two will have the following rotations:</p>\n<p>\n\t- NE4 - Green Alliance - Ningbo, Shanghai, Hong Kong, Singapore, Rotterdam, Hamburg, Antwerp, Singapore, Shenzhen (Yantian), Kaohsiung and back to Ningbo</p>\n<p>\n\t- CES2 - China Shipping, Evergreen, ZIM - Hamburg, Rotterdam, Antwerp, Qingdao, Shanghai, Ningbo, Xiamen, Shenzhen (Yantian), Port Tanjung Pelepas, Port Kelang and back to Antwerp</p>\n<p>\n\tDespite an overhaul of the Green Alliance&rsquo;s Mediterranean-Far East network, apart from the deletion of Algeciras, overall coverage will remain largely unchanged. In contrast, Evergreen&rsquo;s USWC-Far East-Mediterranean UAM pendulum, of which only the Mediterranean-Far East leg is part of the agreement, will no longer connect to the West Med, but divert to the Adriatic ports of Koper, Rijeka and Trieste. Until early 2009, the latter outlets were directly served by Evergreen&rsquo;s cancelled Adriatic Service (ADR) and then replaced by a feeder connection.</p>\n<p>\n\tThe upgraded, combined portfolio reads:</p>\n<p>\n\t- MD1 - Piraeus, La Spezia, Genoa, Barcelona, Valencia, Piraeus, Singapore, Hong Kong, Qingdao, Shanghai, Ningbo, Shenzhen (Yantian), Hong Kong, Shenzhen (Shekou), Singapore and back to Piraeus</p>\n<p>\n\t- MD2 - Port Said, Ashdod, Genoa, Barcelona, Marseilles, Port Said, Singapore, Hong Kong, Ningbo, Shanghai, Xiamen, Kaohsiung, Hong Kong, Shenzhen (Yantian), Singapore and Port Said again</p>\n<p>\n\t- MD3 - Port Said, Naples, La Spezia, Leghorn, Port Said, Singapore, Ho Chi Minh, Hong Kong, Shenzhen (Yantian), Busan, Shanghai, Ningbo, Hong Kong, Shenzhen (Yantian), Singapore and once again Port Said</p>\n<p>\n\t- UAM - Ashdod, Alexandria, Taranto, Koper, Rijeka, Trieste, Taranto, Colombo, Port Tanjung Pelepas, Kaohsiung, Hong Kong, Shenzhen (Yantian), Shanghai, Ningbo, Tacoma, Vancouver, Tokyo, Osaka, Busan, Qingdao, Shanghai, Ningbo, Kaohsiung, Hong Kong, Shenzhen (Yantian), Port Tanjung Pelepas, Colombo, back to Ashdod</p>\n	\N	\N	2012-03-15 09:00:00+04	1764	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Partnership of Green Alliance and Evergreen set-up	Определилась структура контейнерных сервисов Green Alliance и Evergreen.	<p>\n\tTogether they will provide eight loops out of North Europe (Green Alliance/5 and Evergreen/3) and four out of the Mediterranean (3 and 1), respectively, initially using ships ranging between 5,400 TEU and 11,000 TEU (to grow to an upper limit of 13,100 TEU).</p>\n<p>\n\tThe North Europe services will be operated by 76 ships with a total capacity of 690,000 TEU, which is an average 9,100 TEU per vessel. 65% of the overall capacity will come from forty-seven units of 9,600 TEU, to be provided by the four Green Alliance partners.The remaining 35% (29 ships/8,300 TEU) will be deployed by Evergreen and its vessel operating partners China Shipping (7 ships) and ZIM (3).</p>\n<p>\n\tFor the Med-Asia package, the Green Alliance is to deploy 26 ships, average 6,400 TEU, total 165,000 TEU, while the single Evergreen service (actually a pendulum) is operated by fourteen 5,400 TEU units.</p>\n<p>\n\tBesides some minor changes to their existing North Europe-Far East connections, the combined portfolio includes two resurrected seasonally-suspended loops, the Green Alliance&rsquo;s NE4 and Evergreen&rsquo;s CES2 (operated together with China Shipping and ZIM). These two will have the following rotations:</p>\n<p>\n\t- NE4 - Green Alliance - Ningbo, Shanghai, Hong Kong, Singapore, Rotterdam, Hamburg, Antwerp, Singapore, Shenzhen (Yantian), Kaohsiung and back to Ningbo</p>\n<p>\n\t- CES2 - China Shipping, Evergreen, ZIM - Hamburg, Rotterdam, Antwerp, Qingdao, Shanghai, Ningbo, Xiamen, Shenzhen (Yantian), Port Tanjung Pelepas, Port Kelang and back to Antwerp</p>\n<p>\n\tDespite an overhaul of the Green Alliance&rsquo;s Mediterranean-Far East network, apart from the deletion of Algeciras, overall coverage will remain largely unchanged. In contrast, Evergreen&rsquo;s USWC-Far East-Mediterranean UAM pendulum, of which only the Mediterranean-Far East leg is part of the agreement, will no longer connect to the West Med, but divert to the Adriatic ports of Koper, Rijeka and Trieste. Until early 2009, the latter outlets were directly served by Evergreen&rsquo;s cancelled Adriatic Service (ADR) and then replaced by a feeder connection.</p>\n<p>\n\tThe upgraded, combined portfolio reads:</p>\n<p>\n\t- MD1 - Piraeus, La Spezia, Genoa, Barcelona, Valencia, Piraeus, Singapore, Hong Kong, Qingdao, Shanghai, Ningbo, Shenzhen (Yantian), Hong Kong, Shenzhen (Shekou), Singapore and back to Piraeus</p>\n<p>\n\t- MD2 - Port Said, Ashdod, Genoa, Barcelona, Marseilles, Port Said, Singapore, Hong Kong, Ningbo, Shanghai, Xiamen, Kaohsiung, Hong Kong, Shenzhen (Yantian), Singapore and Port Said again</p>\n<p>\n\t- MD3 - Port Said, Naples, La Spezia, Leghorn, Port Said, Singapore, Ho Chi Minh, Hong Kong, Shenzhen (Yantian), Busan, Shanghai, Ningbo, Hong Kong, Shenzhen (Yantian), Singapore and once again Port Said</p>\n<p>\n\t- UAM - Ashdod, Alexandria, Taranto, Koper, Rijeka, Trieste, Taranto, Colombo, Port Tanjung Pelepas, Kaohsiung, Hong Kong, Shenzhen (Yantian), Shanghai, Ningbo, Tacoma, Vancouver, Tokyo, Osaka, Busan, Qingdao, Shanghai, Ningbo, Kaohsiung, Hong Kong, Shenzhen (Yantian), Port Tanjung Pelepas, Colombo, back to Ashdod</p>\n	<p>\n\tНедавно образованное партнерство Green Alliance (контейнерные линии Coscon, Hanjin, &ldquo;K&rdquo; Line и Yang Ming) и линии Evergreen сообщило о деталях обмена слотами, которое вступает в силу с апреля на направлении Дальний Восток &ndash; Средиземное море/Европа.</p>\n<p>\n\tСовместно партнёры будут оперировать восемью линейными сервисами на Северную Европу ( пять предоставит Green Alliance и 3 - Evergreen) и четырьмя на Средиземноморье (3 и 1 соответственно).</p>\n<p>\n\tИзначально планируется использовать суда вместимостью от 5,400 TEU до 11,000 TEU, в дальнейшем планируется их увеличение до 13,100 TEU.</p>\n<p>\n\tНа североевропейских сервисах будет задействовано 76 судов, общим тоннажем 690,000 TEU и средней вместимостью 9,100 TEU на судно. 65% общего тоннажа на этом направлении будет сформировано за счет 47 судов Green Alliance, средней вместимостью 9,600 TEU. Остальные 35% - за счет 29 судов Evergreen и его партнеров по сервису (China Shipping 7 судов и ZIM &ndash; 3 судна), вместимостью 8,300 TEU.</p>\n<p>\n\tВ пакете средиземноморских сервисов Green Alliance собирается задействовать 26 судов, средней вместимостью 6,400 TEU, общим тоннажем 165,000 TEU, в то время, как единственный сервис Evergreen (охватывающий также западное побережье Сев. Америки) использует 14 судов 5,400 TEU.</p>\n<p>\n\tКроме незначительных изменений на существующих сервисах Азия &ndash; Сев. Европа, в партнерское соглашение были включены два возобновленных сезонных линейных сервиса: NE4 Green Alliance и CES2 Evergreen (оперируемый совместно с China Shipping и ZIM). Ротация этих двух сервисов следующая:</p>\n<p>\n\t- NE4 - Green Alliance - Нингбо, Шанхай, Гонконг, Сингапур, Роттердам, Гамбург, Антверпен, Сингапур, Шенжень (Янтянь), Гаосюн и обратно в Нингбо.</p>\n<p>\n\t- CES2 - China Shipping, Evergreen, ZIM - Гамбург, Роттердам, Антверпен, Циндао, Шанхай, Нингбо, Сямень, Шенжень (Яантянь), Танжунг Пелепас, Кланг и обратно в Антверпен.</p>\n<p>\n\tСервисы Green Alliance на Средиземное мореs, кроме исключения Альхесираса из ротации, останутся в основном без изменений. Напротив, сервис UAM Evergreen прекратит заходы в западную часть Средиземного моря и продолжится до адриатических портов Копер, Риека и Триест. До начала 2009 года они обслуживались напрямую Адриатическим сервисом Evergreen, который в дальнейшем был заменен на фидер.</p>\n<p>\n\tОбновленный портфель совместных сервисов на данном направлении выглядит следующим образом:</p>\n<p>\n\t- MD1 - Пирей, Ла Специя, Генуя, Барселона, Валенсия, Пирей, Сингапур, Гонконг, Циндао, Шанхай, Нингбо, Шенжень (Янтянь), Гонконг, Шенжень (Шекоу) , Сингапур и обратно в Пирей.</p>\n<p>\n\t- MD2 &ndash; Порт Саид, Ашдод, Генуя, Барселона, Марсель, Порт Саид, Сингапур, Гонконг, Нингбо, Шанхай, Сямень, Гаосюн, Гонконг, Шанжень (Янтянь), Сингапур и снова Порт Саид.</p>\n<p>\n\t- MD3 &ndash; Порт Саид, Неаполь, Ла Специя, Ливорно, Порт Саид, Сингапур, Хошимин, Гонконг, Шенжень (Янтянь), Пусан, Шанхай, Нингбо, Гонконг, Шенжень (Янтянь), Сингапур и обратно в Порт Саид.</p>\n<p>\n\t- UAM - Ашдод, Александрия, Таранто, Копер, Риека, Триест, Таранто, Коломбо, Танжунг Пелепас, Гаосюн, Гонконг, Шенжень (Янтянь), Шанхай, Нингбо, Такома, Ванкувер, Токио. Осака, Пусан, Циндао, Шанхай, Нингбо, Гаосюн, Гонконг, Шенжень (Янтянь), Танжунг Пелепас, Коломбо, Ашдод.</p>\n	New-found partners Green Alliance (Coscon, Hanjin, “K” Line and Yang Ming) and Evergreen have detailed\n\ntheir announced Europe/Mediterranean-Far East slot-swap co-operation, to take effect in April.	Недавно образованное партнерство Green Alliance (контейнерные линии Coscon, Hanjin, “K” Line и Yang Ming) и линии Evergreen сообщило о деталях обмена слотами, которое вступает в силу с апреля на направлении Дальний Восток – Средиземное море/Европа. 
2	2012-03-22 00:53:59+04	t			2011 Results of Far East – Europe/Med trade in 2011	<p>\n\tThe combined 2011 North Europe and Mediterranean-Far East trade increased by 4.5% year-on-year to 19,973,000 TEU. Westbound (to Europe) trade volumes were up by a meagre 2.8%, eastbound by a higher 8.7%.</p>\n	obemyi-na-napravlenii-dalnij-2012-03-21-155359	<p>\n\tThe combined 2011 North Europe and Mediterranean-Far East trade increased by 4.5% year-on-year to 19,973,000 TEU. Westbound (to Europe) trade volumes were up by a meagre 2.8%, eastbound by a higher 8.7%.</p>\n<p>\n\tHowever, when considering the two areas separately, it appears that imports from the Far East to North Europe actually declined, by 3.4%, to 8,699,000 TEU, a number which is even somewhat lower than that of pre-crisis year 2008. Exports to the Far East (eastbound) rose by a only 1.3% and are therefore also lower than those of 2008. Overall twoway trade dropped by 1.9% to 12,784,000 TEU.</p>\n<p>\n\tTrade &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tWB to N. Europe &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,699 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9,002 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,546 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,796</p>\n<p>\n\tWB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.4% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -14.2%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tEB to Far East &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,085 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,032 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,180 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,094</p>\n<p>\n\tEB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3% &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.6% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tTotal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,784 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13,034 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11,726 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,890</p>\n<p>\n\tTotal growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -1.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11.2% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -9.0%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tImbalance TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,614 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,971 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,365 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,703</p>\n<p>\n\tImbalance % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 45% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53%</p>\n<p>\n\t(1,000 TEU)</p>\n<p>\n\tSo, in reality, it was the Mediterranean that saved the overall Europe-Far East trade last year. Westbound to the Med growth stood at a healthy 15%, while exports to the Far East were nearly 28% higher. The total Mediterranean-Far East volume reached 7,189,000 TEU, plus 18% year-on-year, and is now more than 23% higher than in 2008. This explains the recent increased activity in that area, with various ULCS shifting to the Med-far East route and new services launched.</p>\n<p>\n\t&nbsp;Trade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tWB to Med. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,222 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,536 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,989 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,698</p>\n<p>\n\tWB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13.7% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -15.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tEB to Far East &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,967 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,538 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,336 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,141</p>\n<p>\n\tEB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 27.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tTotal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,189 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6,074 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,325 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,839</p>\n<p>\n\tTotal growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -8.8%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tImbalance TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,255 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,998 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,653 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,556</p>\n<p>\n\tImbalance % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 62% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 66% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 67% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76%</p>\n<p>\n\t(1,000 TEU)</p>\n	\N	\N	2012-03-15 09:00:00+04	1765	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	2011 Results of Far East – Europe/Med trade in 2011	Объемы на направлении Дальний Восток – Европа в 2011	<p>\n\tThe combined 2011 North Europe and Mediterranean-Far East trade increased by 4.5% year-on-year to 19,973,000 TEU. Westbound (to Europe) trade volumes were up by a meagre 2.8%, eastbound by a higher 8.7%.</p>\n<p>\n\tHowever, when considering the two areas separately, it appears that imports from the Far East to North Europe actually declined, by 3.4%, to 8,699,000 TEU, a number which is even somewhat lower than that of pre-crisis year 2008. Exports to the Far East (eastbound) rose by a only 1.3% and are therefore also lower than those of 2008. Overall twoway trade dropped by 1.9% to 12,784,000 TEU.</p>\n<p>\n\tTrade &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tWB to N. Europe &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,699 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9,002 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,546 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,796</p>\n<p>\n\tWB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.4% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -14.2%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tEB to Far East &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,085 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,032 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,180 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,094</p>\n<p>\n\tEB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3% &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.6% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tTotal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,784 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13,034 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11,726 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,890</p>\n<p>\n\tTotal growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -1.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11.2% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -9.0%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tImbalance TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,614 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,971 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,365 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,703</p>\n<p>\n\tImbalance % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 45% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53%</p>\n<p>\n\t(1,000 TEU)</p>\n<p>\n\tSo, in reality, it was the Mediterranean that saved the overall Europe-Far East trade last year. Westbound to the Med growth stood at a healthy 15%, while exports to the Far East were nearly 28% higher. The total Mediterranean-Far East volume reached 7,189,000 TEU, plus 18% year-on-year, and is now more than 23% higher than in 2008. This explains the recent increased activity in that area, with various ULCS shifting to the Med-far East route and new services launched.</p>\n<p>\n\t&nbsp;Trade&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tWB to Med. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,222 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,536 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,989 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,698</p>\n<p>\n\tWB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13.7% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -15.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tEB to Far East &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,967 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,538 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,336 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,141</p>\n<p>\n\tEB growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 27.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tTotal &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,189 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6,074 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,325 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,839</p>\n<p>\n\tTotal growth &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -8.8%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tImbalance TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,255 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,998 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,653 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,556</p>\n<p>\n\tImbalance % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 62% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 66% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 67% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76%</p>\n<p>\n\t(1,000 TEU)</p>\n	<p>\n\tОбъем контейнерных перевозок на направлении Дальний Восток &ndash; Северная Европа/ Средиземноморье увеличился в 2011 году на 4,5% до 19,973,000 TEU. В западном направлении объемы выросли на незначительные 2.8%, в восточном &ndash; на 8.7%.</p>\n<p>\n\tТем не менее, при рассмотрении двух регионов по отдельности, оказывается, что импорт из Дальнего Востока на Северную Европу в 2011 фактически снизился на 3,4% до 8,699,000 TEU, что чуть ниже уровня предкризисного 2008 года. Экспорт на Дальний Восток в 2011 вырос лишь на 1,3% и оказался ниже, чем в 2008. Суммарный объем перевозок контейнеров в обеих направлениях снизился на 1,9% до 12,784,000 TEU.</p>\n<p>\n\tНаправление &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tНа Сев.Европу &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,699 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9,002 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,546 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,796</p>\n<p>\n\tИзменение %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.4% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -14.2%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tНа Д. Восток&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,085 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,032 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,180 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,094</p>\n<p>\n\tИзменение %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3% &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -3.6% &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tВсего &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,784 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13,034 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11,726 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12,890</p>\n<p>\n\tВсего изменение&nbsp;&nbsp;&nbsp;&nbsp; -1.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11.2% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -9.0%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tДисбаланс TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,614 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,971 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,365 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,703</p>\n<p>\n\tДисбаланс %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 55% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 45% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53%</p>\n<p>\n\t(в тыс. TEU)</p>\n<p>\n\tТаким образом, именно Средиземное море вытянуло общую статистику Европа &ndash; Дальний Восток в прошлом году. Импорт на Средиземноморье существенно вырос на 15%, в то время, как экспорт на Дальний Восток увеличился на целые 28%. Общий объем перевозок в обоих направлениях достиг 7,189,000 TEU, т.е. 18% выше, чем годом ранее, и на 23% выше уровня 2008 года. Это во многом объясняет возросшую в последнее время активность линий в данном регионе по запуску новых сервисов и вводу на них сверхкрупных судов-контейнеровозов (ULCS).</p>\n<p>\n\tНаправление&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2011 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2010 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2008</p>\n<p>\n\tTEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEU</p>\n<p>\n\tНа Сред.море&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,222 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,536 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,989 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,698</p>\n<p>\n\tИзменение %&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13.7% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -15.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tНа Д.Восток &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,967 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,538 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,336 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,141</p>\n<p>\n\tИзменение % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 27.9% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17.1%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tВсего&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7,189 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6,074 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,325 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5,839</p>\n<p>\n\tВсего изменение&nbsp;&nbsp;&nbsp;&nbsp; 18.3% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14.1% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -8.8%</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tДисбаланс TEU &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,255 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,998 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2,653 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3,556</p>\n<p>\n\tДисбаланс % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 62% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 66% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 67% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76%</p>\n<p>\n\t(в тыс. TEU)</p>\n	<p>\n\tThe combined 2011 North Europe and Mediterranean-Far East trade increased by 4.5% year-on-year to 19,973,000 TEU. Westbound (to Europe) trade volumes were up by a meagre 2.8%, eastbound by a higher 8.7%.</p>\n	Объем контейнерных перевозок на направлении Дальний Восток – Северная Европа/ Средиземноморье увеличился в 2011 году на 4,5% до 19,973,000 TEU. В западном направлении объемы выросли на незначительные 2.8%, в восточном – на 8.7%.
2	2012-03-22 00:55:15+04	t			Maersk boosts capacity on East Coast of S.America	Maersk Line will more than double capacity of its North Europe-East Coast South America Samba service,\n\ncurrently deploying 3,200 TEU tonnage	maersk-rasshiryaet-servis-mezhdu-2012-03-21-155515	<p>\n\tMaersk Line will more than double capacity of its North Europe-East Coast South America Samba service, currently deploying 3,200 TEU tonnage. Until it has received a full complement of 7,500 TEU Sam-Max newbuildings, the Danish carrier will continue to deploy smaller vessels, operating in tandem for part of the voyage. They will load simultaneously in Europe (Tilbury, Rotterdam, Bremerhaven and Antwerp) but thereafter have a different rotation, as follows:</p>\n<p>\n\t- Loop 1 - Santos, Paranagua, Itapoa</p>\n<p>\n\t- Loop 2 - Algeciras, Buenos Aires, Montevideo, Rio Grande</p>\n<p>\n\tDue to the above, inventively-designed expansion of capacity, Maersk Line will reduce its North Europe-East Coast South America slot charter on MSC&rsquo;s SAEC1 loop. It will henceforth use this allocation, sold as Samex, for shipments to/from Navegantes (South Brazil, opposite Itajai) only.</p>\n	\N	\N	2012-03-16 09:00:00+04	1766	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk boosts capacity on East Coast of S.America	Maersk расширяет сервис между Европой и Вост. побережьем Южной Америки	<p>\n\tMaersk Line will more than double capacity of its North Europe-East Coast South America Samba service, currently deploying 3,200 TEU tonnage. Until it has received a full complement of 7,500 TEU Sam-Max newbuildings, the Danish carrier will continue to deploy smaller vessels, operating in tandem for part of the voyage. They will load simultaneously in Europe (Tilbury, Rotterdam, Bremerhaven and Antwerp) but thereafter have a different rotation, as follows:</p>\n<p>\n\t- Loop 1 - Santos, Paranagua, Itapoa</p>\n<p>\n\t- Loop 2 - Algeciras, Buenos Aires, Montevideo, Rio Grande</p>\n<p>\n\tDue to the above, inventively-designed expansion of capacity, Maersk Line will reduce its North Europe-East Coast South America slot charter on MSC&rsquo;s SAEC1 loop. It will henceforth use this allocation, sold as Samex, for shipments to/from Navegantes (South Brazil, opposite Itajai) only.</p>\n	<p>\n\tMaersk планирует более, чем удвоить свой тоннаж на сервисе Samba между Северной Европой и Вост. побережьем Южной Америки.</p>\n<p>\n\tСейчас сервис эксплуатирует контейнерные суда вместимостью 3,200 TEU. До ожидаемого в скором времени поступления новых судов 7,500 TEU, датская контейнерная линия продолжит использовать более мелкие суда, которые будут работать совместно с большими на измененном маршруте. &nbsp;Обработка в Европе будет производиться на одних и тех же терминалах (Тилбури, Роттердам, Бремерхафн и Антверпен), а в Южной Америке порты захода будут отличаться: &nbsp;</p>\n<p>\n\t- Маршрут 1 &ndash; Сантос, Паранагуа, Итапоа</p>\n<p>\n\t- Маршрут 2 &ndash; Альхесирас, Буэнос Айрес, Монтевидео, Рио Гранде.</p>\n<p>\n\tВ связи с указанным увеличением тоннажа, Maersk сократит свой слот на сервисе SAEC1 линии MSC, который также работает на направлении Европа &ndash; Вост. побережье Южной Америки.</p>\n<p>\n\tВ дальнейшем Maersk будет продавать сервис на этом слоте только для порта Навегантес (Южная Бразилия, рядом с портом Итахай).</p>\n	Maersk Line will more than double capacity of its North Europe-East Coast South America Samba service,\n\ncurrently deploying 3,200 TEU tonnage	Maersk планирует более, чем удвоить свой тоннаж на сервисе Samba между Северной Европой и Вост. побережьем Южной Америки.
2	2012-03-29 18:48:35+04	t			Maersk Suspends All North Europe-Asia Bookings	<p>\n\tShip cancellations after Chinese New Year cause buildup of cargo, with European terminals near capacity.</p>\n	alyans-g6-otkazyivaetsya-ot-2012-03-29-094835	<p>\n\t&nbsp;</p>\n<p>\n\tShip cancellations after Chinese New Year cause buildup of cargo, with European terminals near capacity.</p>\n<p>\n\tMaersk Line has suspended bookings on its North Europe-to-Asia services effective immediately as it battles to clear up a backlog of containers at clogged European container terminals.</p>\n<p>\n\tMaersk said it expects to accept bookings again in early May after it has tackled an unprecedented buildup of cargo caused by consecutive vessel cancellations following the Chinese New Year.</p>\n<p>\n\t&ldquo;At the moment, terminal density at some ports is nearing yard capacity,&rdquo; the Danish carrier said. &ldquo;If bookings are not halted, this could negatively impact productivity, further slow down ocean carriers&rsquo; ability to clear the heavy backlog/overflow and impact other trades.&rdquo;</p>\n<p>\n\tLow westbound demand for Asian goods after the Chinese New Year prompted several carriers to cancel multiple sailings from Asia, and in turn, eastbound sailings from Europe. Despite the eurozone crisis and general rate increases in February, March and April, demand has continued to grow strongly for European goods on eastbound sailings to Asia, Maersk said.</p>\n<p>\n\t&ldquo;The booking stop is temporary, and we are working to clear it as soon as possible so that we can resume booking acceptance as usual,&rdquo; Maersk said in a notice to shippers. &ldquo;We are implementing this complete booking stop to ensure we prioritize and deliver on the bookings we have already accepted.&rdquo;</p>\n<p>\n\t&ldquo;We have heard from customers that other lines have also stopped bookings until May,&rdquo; a Maersk Line spokesman said.&nbsp;&ldquo;Shippers are obviously disappointed by the temporary capacity shortage, but it&rsquo;s too early to evaluate the impact on supply chains.&rdquo;</p>\n<p>\n\tMaersk said it is &ldquo; working on all options,&rdquo; including adding extra ports on an inducement basis, reviewing possible extra loader opportunities out of North Europe and other measures to reduce the impact and duration of the booking suspension.</p>\n<p>\n\tThe suspension hasn&#39;t affected bookings on the much busier westbound leg out of Asia to Europe, including Maersk Line&rsquo;s Daily Maersk service.</p>\n<p>\n\tMaersk is the market leader on the Asia-Europe route, accounting for more than 19 percent of traffic on the world&rsquo;s biggest trade lane.</p>\n	\N	\N	2012-03-29 09:00:00+04	1768	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Suspends All North Europe-Asia Bookings	Альянс G6 отказывается от заходов в Гданьск на сервисе Loop 3	<p>\n\t&nbsp;</p>\n<p>\n\tShip cancellations after Chinese New Year cause buildup of cargo, with European terminals near capacity.</p>\n<p>\n\tMaersk Line has suspended bookings on its North Europe-to-Asia services effective immediately as it battles to clear up a backlog of containers at clogged European container terminals.</p>\n<p>\n\tMaersk said it expects to accept bookings again in early May after it has tackled an unprecedented buildup of cargo caused by consecutive vessel cancellations following the Chinese New Year.</p>\n<p>\n\t&ldquo;At the moment, terminal density at some ports is nearing yard capacity,&rdquo; the Danish carrier said. &ldquo;If bookings are not halted, this could negatively impact productivity, further slow down ocean carriers&rsquo; ability to clear the heavy backlog/overflow and impact other trades.&rdquo;</p>\n<p>\n\tLow westbound demand for Asian goods after the Chinese New Year prompted several carriers to cancel multiple sailings from Asia, and in turn, eastbound sailings from Europe. Despite the eurozone crisis and general rate increases in February, March and April, demand has continued to grow strongly for European goods on eastbound sailings to Asia, Maersk said.</p>\n<p>\n\t&ldquo;The booking stop is temporary, and we are working to clear it as soon as possible so that we can resume booking acceptance as usual,&rdquo; Maersk said in a notice to shippers. &ldquo;We are implementing this complete booking stop to ensure we prioritize and deliver on the bookings we have already accepted.&rdquo;</p>\n<p>\n\t&ldquo;We have heard from customers that other lines have also stopped bookings until May,&rdquo; a Maersk Line spokesman said.&nbsp;&ldquo;Shippers are obviously disappointed by the temporary capacity shortage, but it&rsquo;s too early to evaluate the impact on supply chains.&rdquo;</p>\n<p>\n\tMaersk said it is &ldquo; working on all options,&rdquo; including adding extra ports on an inducement basis, reviewing possible extra loader opportunities out of North Europe and other measures to reduce the impact and duration of the booking suspension.</p>\n<p>\n\tThe suspension hasn&#39;t affected bookings on the much busier westbound leg out of Asia to Europe, including Maersk Line&rsquo;s Daily Maersk service.</p>\n<p>\n\tMaersk is the market leader on the Asia-Europe route, accounting for more than 19 percent of traffic on the world&rsquo;s biggest trade lane.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tКонтейнерный сервис альянса G6 Loop 3 на маршруте из Азии в Европу не будет включать заход в порт Гданьск, сообщил OOCL.</p>\n<p>\n\tКак сообщил гонконгский перевозчик, решение отказаться от заходов в Гданьск было вызвано &laquo;непредвиденными обстоятельствами получения причального окна&raquo;.</p>\n<p>\n\tГрузы, следующие на Польшу и другие балтийские порты, включая Россию, будут приниматься к перевозке на фидерах через немецкие порты Гамбург и Бремерхафен. &nbsp;</p>\n<p>\n\tРотация нового линейного сервиса Loop 3 будет выглядеть следующим образом: Shanghai, Ningbo, Shekou, Singapore, Tangier, Rotterdam, Bremerhaven, Gothenburg, Rotterdam, Jeddah, Singapore, Shekou, HongKongи обратно в Shanghai.</p>\n<p>\n\tАльянс G6 был сформирован в декабре прошлого года и объединяет азиатско-европейские океанские линии Hapag-Lloyd, NYK, OOCL, APL, HyundaiMerchantMarineи MOL.</p>\n	<p>\n\tShip cancellations after Chinese New Year cause buildup of cargo, with European terminals near capacity.</p>\n	<p>\n\tКонтейнерный сервис альянса&nbsp;G6&nbsp;Loop&nbsp;3 на маршруте из Азии в Европу не будет включать заход в порт Гданьск, сообщил&nbsp;OOCL.</p>\n
2	2012-03-30 23:45:25+04	t			MSC Merges India-Europe-Mediterranean Services	<p>\n\tMediterranean Shipping Company will upgrade and combine its existing Indian Subcontinent-Europe-Mediterranean service network operated in conjunction with Shipping Corporation of India, effective in early April.</p>\n	liniya-mscobedinyaet-svoi-servisyi-2012-03-30-144525	<p>\n\t&nbsp;</p>\n<p>\n\tMediterranean Shipping Company will upgrade and combine its existing Indian Subcontinent-Europe-Mediterranean service network operated in conjunction with Shipping Corporation of India, effective in early April.</p>\n<p>\n\tThe Geneva-based ocean carrier said the current services, ISES and I-Med, will be merged into a single loop, deploying ships of 6,500 20-foot equivalent units capacity.</p>\n<p>\n\tThe new ISE port rotation will be Colombo, Nhava Sheva (Jawaharlal Nehru), Mundra, Salalah, Gioia Tauro, Felixstowe, Hamburg, Antwerp, Gioia Tauro and back to Colombo.</p>\n<p>\n\tMSC said it would continue to cover the Mediterranean ports via Gioia Tauro. &ldquo;This will give customers much wider coverage and quicker connectivity to the Mediterranean ports.&rdquo;</p>\n<p>\n\tThe first vessel in the combined service will be the SCI Chennai, scheduled to depart from Colombo on April 7.</p>\n<p>\n\tThe current ISES rotation is Colombo, Nhava Sheva, Mundra, Pipavav, Salalah, Felixstowe, Hamburg, Gothenburg, Antwerp, Jeddah and Colombo. The I-Med calls Colombo, Nhava Sheva, Mundra, Salalah, Port Said, Istanbul, Barcelona, Genoa, La Spezia, Gioia Tauro, Port Said, Salalah and Colombo.</p>\n	\N	\N	2012-03-29 09:00:00+04	1771	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MSC Merges India-Europe-Mediterranean Services	Линия MSCобъединяет свои сервисы на направлении Индия – Европа – Средиземное море.	<p>\n\t&nbsp;</p>\n<p>\n\tMediterranean Shipping Company will upgrade and combine its existing Indian Subcontinent-Europe-Mediterranean service network operated in conjunction with Shipping Corporation of India, effective in early April.</p>\n<p>\n\tThe Geneva-based ocean carrier said the current services, ISES and I-Med, will be merged into a single loop, deploying ships of 6,500 20-foot equivalent units capacity.</p>\n<p>\n\tThe new ISE port rotation will be Colombo, Nhava Sheva (Jawaharlal Nehru), Mundra, Salalah, Gioia Tauro, Felixstowe, Hamburg, Antwerp, Gioia Tauro and back to Colombo.</p>\n<p>\n\tMSC said it would continue to cover the Mediterranean ports via Gioia Tauro. &ldquo;This will give customers much wider coverage and quicker connectivity to the Mediterranean ports.&rdquo;</p>\n<p>\n\tThe first vessel in the combined service will be the SCI Chennai, scheduled to depart from Colombo on April 7.</p>\n<p>\n\tThe current ISES rotation is Colombo, Nhava Sheva, Mundra, Pipavav, Salalah, Felixstowe, Hamburg, Gothenburg, Antwerp, Jeddah and Colombo. The I-Med calls Colombo, Nhava Sheva, Mundra, Salalah, Port Said, Istanbul, Barcelona, Genoa, La Spezia, Gioia Tauro, Port Said, Salalah and Colombo.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tMediterranean&nbsp;Shipping&nbsp;Company&nbsp;(MSC) с начала апреля 2012 планирует обновить и объединить свои линейные сервисы из портов Индостана на Европу и Средиземноморье, оперируемые совместно с индийским перевозчиков Shipping&nbsp;Corporation&nbsp;of&nbsp;India.</p>\n<p>\n\tКак сообщил представитель MSC, ротация существующих сейчас сервисов ISESи I-Med, будут объединена, а размер задействованных судов увеличится до 6,500 TEU.</p>\n<p>\n\tРасписание нового сервиса ISE&nbsp;будет включать порты Colombo, Nhava&nbsp;Sheva (Jawaharlal&nbsp;Nehru), Mundra, Salalah, GioiaTauro, Felixstowe, Hamburg, Antwerp, Gioia&nbsp;Tauroи далее обратно в Colombo.</p>\n<p>\n\tMSCдобавил, что порты Средиземного моря будут обслуживаться через хаб в Gioia&nbsp;Tauro. &ldquo;Такой маршрут обеспечит нашим клиентам более широкое географическое покрытие и быструю доставку до портов Средиземного моря&raquo;. &nbsp;&nbsp;</p>\n<p>\n\tПервое рейс на судно на объединенном сервисе будет выполняться т/х SCIChennai, которое должно покинуть Сolombo7 апреля.</p>\n<p>\n\tРасписание существовавшего до сих пор сервиса ISES: Colombo, Nhava&nbsp;Sheva, Mundra, Pipavav, Salalah, Felixstowe, Hamburg, Gothenburg, Antwerp, Jeddahand&nbsp;Colombo. Сервис I-Med заходил&nbsp;в&nbsp;порты Colombo, Nhava Sheva, Mundra, Salalah, Port Said, Istanbul, Barcelona, Genoa, La Spezia, Gioia Tauro, Port Said, Salalah и Colombo.</p>\n	<p>\n\tMediterranean Shipping Company will upgrade and combine its existing Indian Subcontinent-Europe-Mediterranean service network operated in conjunction with Shipping Corporation of India, effective in early April.</p>\n	<p>\n\tMediterranean Shipping Company (MSC) с начала апреля 2012 планирует обновить и объединить свои линейные сервисы из портов Индостана на Европу и Средиземноморье, оперируемые совместно с индийским перевозчиков&nbsp;Shipping Corporation of India.</p>\n
2	2012-04-24 02:17:48+04	t			ZIM’s new service set-up in Black Sea	<p>\n\t<span lang="EN-US">Having taken slots on the joint Far East Black Sea Express </span></p>\n<p>\n\t<span lang="EN-US">(ABX) of China Shipping, &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming Israeli carrier ZIM</span></p>\n<p>\n\t<span lang="EN-US">now connects Asia with Black Sea destinations twice a week</span></p>\n	liniya-zim-obnovlyaet-raspisanie-2012-04-23-171748	<p>\n\tHaving taken slots on the joint Far East Black Sea Express (ABX) of China Shipping, &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming Israeli carrier ZIM</p>\n<p>\n\tnow connects Asia with Black Sea destinations twice a week, as follows:</p>\n<p>\n\t- ABX (Coscon and ZIM, slots) - 9x 5,200 TEU average - Piraeus,</p>\n<p>\n\tIstanbul (Ambarli), Constantza, Ilichevsk, Port Kelang,</p>\n<p>\n\tShanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang</p>\n<p>\n\tand back to Piraeus</p>\n<p>\n\t- EMX (ZIM ships, slot of China Shipping) - 10x 4,100 TEU average - Haifa, Ashdod, Istanbul</p>\n<p>\n\t(Ambarll), Odessa, Novorossisk, Gemlik, Istanbul (Ambarli),</p>\n<p>\n\tHaifa, Mundra, Colombo, Port Kelang, Busan, Shanghai,</p>\n<p>\n\tNingbo, Shenzhen (Dachan), Port Kelang and Haifa again.</p>\n<p>\n\tBesides of deep-sea ZIM has also extended to Novorossiysk its short-sea BSX service, henceforth covering Ashdod &ndash; Haifa &ndash; Limassol &ndash; Novorossiysk &ndash; Constanta &ndash; Varna &ndash; Izmit &ndash; Evyap- Thessaloniki &ndash; Izmir &ndash; Piraeus &ndash; Ashdod</p>\n<p>\n\tThe BSX will be manned with three units, averaging 1540 TEU. The service is going to call at the NCSP terminal.</p>\n	\N	\N	2012-04-14 09:00:00+04	1770	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	ZIM’s new service set-up in Black Sea	Линия ZIM обновляет расписание сервисов на Черное море	<p>\n\tHaving taken slots on the joint Far East Black Sea Express (ABX) of China Shipping, &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming Israeli carrier ZIM</p>\n<p>\n\tnow connects Asia with Black Sea destinations twice a week, as follows:</p>\n<p>\n\t- ABX (Coscon and ZIM, slots) - 9x 5,200 TEU average - Piraeus,</p>\n<p>\n\tIstanbul (Ambarli), Constantza, Ilichevsk, Port Kelang,</p>\n<p>\n\tShanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang</p>\n<p>\n\tand back to Piraeus</p>\n<p>\n\t- EMX (ZIM ships, slot of China Shipping) - 10x 4,100 TEU average - Haifa, Ashdod, Istanbul</p>\n<p>\n\t(Ambarll), Odessa, Novorossisk, Gemlik, Istanbul (Ambarli),</p>\n<p>\n\tHaifa, Mundra, Colombo, Port Kelang, Busan, Shanghai,</p>\n<p>\n\tNingbo, Shenzhen (Dachan), Port Kelang and Haifa again.</p>\n<p>\n\tBesides of deep-sea ZIM has also extended to Novorossiysk its short-sea BSX service, henceforth covering Ashdod &ndash; Haifa &ndash; Limassol &ndash; Novorossiysk &ndash; Constanta &ndash; Varna &ndash; Izmit &ndash; Evyap- Thessaloniki &ndash; Izmir &ndash; Piraeus &ndash; Ashdod</p>\n<p>\n\tThe BSX will be manned with three units, averaging 1540 TEU. The service is going to call at the NCSP terminal.</p>\n	<p>\n\tПолучив слоты на объединенном сервисе FarEastBlackSeaExpress</p>\n<p>\n\t(ABX), оперируемом линиями ChinaShipping, &ldquo;K&rdquo; Line, PIL, WanHaiи YangMing, израильский перевозчик ZIM теперь предлагает на направления Азия &ndash; Черное море два рейса в неделю:</p>\n<p>\n\t- ABX(слоты Cosconи ZIM) &ndash; 9 судов в среднем 5,700 TEU- Пирей, Стамбул (Амбарли), Констанца, Ильичевск, Кланг, Шанхай, Нингбо, Шенжень (Шекоу), Сингапур, Кланг и обратно в Пирей.</p>\n<p>\n\t- EMX(суда ZIM, &nbsp;слот ChinaShipping) &ndash; 10 судов в среднем 4,100 TEU&nbsp;- Хайфа, Ашдод, Стамбул (Амбарли), Одесса, Новороссийск, Гемлик, Стамблу (Амбарли), Хайфа, Мундра, Коломбо, Кланг, Пусан, Шанхай,</p>\n<p>\n\tНингбо, Шенжень (Да Чан), Кланг и обратно в Хайфу.</p>\n<p>\n\tКроме океанских сервисов ZIMтакже продлил до Новороссийска свой черноморский сервис BSX, который с апреля осуществляет сервисы в следующие порты Ашдод, Хайфа, Лимассол, Новороссийск, Констанца, Варна, Измит, Эвьяп, Салоники, Измир, Пирей, Ашдод. На сервисе задействованы три судна средней вместимостью 1540 TEU. В Новороссийске заходы осуществляются на терминал НМТП.</p>\n	<p>\n\t<span lang="EN-US">Having taken slots on the joint Far East Black Sea Express </span></p>\n<p>\n\t<span lang="EN-US">(ABX) of China Shipping, &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming Israeli carrier ZIM</span></p>\n<p>\n\t<span lang="EN-US">now connects Asia with Black Sea destinations twice a week</span></p>\n	<p>\n\tПолучив слоты на объединенном сервисе FarEastBlackSeaExpress</p>\n<p>\n\t(ABX), оперируемом линиями ChinaShipping, &ldquo;K&rdquo; Line, PIL, WanHaiи YangMing, израильский перевозчик ZIM теперь предлагает на направления Азия &ndash; Черное море два рейса в неделю</p>\n
2	2012-04-07 02:30:21+04	t			Evergreen comes to Vostochniy	<p>\n\tThe Hong Kong-Taiwan-US West Coast (HTW) service of Evergreen will be extended to Vostochny, deploying</p>\n	evergreen-idet-v-vostochnyij-2012-04-06-173021	<p>\n\tThe Hong Kong-Taiwan-US West Coast (HTW) service of Evergreen will be extended to Vostochny, deploying</p>\n<p>\n\tone extra vessel to make six units of 8,000/8,500 TEU. After CMA CGM (1 service), Maersk Line (3)</p>\n<p>\n\tand ZIM (1) this is the sixth deepsea operation to serve the Russian Far East port directly. The revised port order is: Vostochny, Taipei, Xiamen, Hong Kong,</p>\n<p>\n\tShenzhen (Yantian), Los Angeles, Oakland and back to Vostochny.</p>\n<p>\n\tThe first call at Vostochniy is scheduled on Apr. 12th with the chartered m/v CSCL Africa. The transit time from LA to Vostochniy will be 14 days, from Oakland - &nbsp;12 days.</p>\n	\N	\N	2012-04-06 09:00:00+04	1773	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Evergreen comes to Vostochniy	Evergreen идет в Восточный	<p>\n\tThe Hong Kong-Taiwan-US West Coast (HTW) service of Evergreen will be extended to Vostochny, deploying</p>\n<p>\n\tone extra vessel to make six units of 8,000/8,500 TEU. After CMA CGM (1 service), Maersk Line (3)</p>\n<p>\n\tand ZIM (1) this is the sixth deepsea operation to serve the Russian Far East port directly. The revised port order is: Vostochny, Taipei, Xiamen, Hong Kong,</p>\n<p>\n\tShenzhen (Yantian), Los Angeles, Oakland and back to Vostochny.</p>\n<p>\n\tThe first call at Vostochniy is scheduled on Apr. 12th with the chartered m/v CSCL Africa. The transit time from LA to Vostochniy will be 14 days, from Oakland - &nbsp;12 days.</p>\n	<p>\n\tEvergreen будет заходить в Восточный на своем deep sea сервисе Hong Kong-Taiwan-US West Coast (HTW).</p>\n<p>\n\tПо данным Dynamar, для этого линия выводит на сервис одно дополнительное судно, теперь работать на HTW будут шесть восьмитысячников вместо пяти.</p>\n<p>\n\tНовая ротация: Восточный &ndash; Тайбэй &ndash; Сямэнь &ndash; Гонконг &ndash; Шенжень (Янтьян) &ndash; Лос-Анджелес &ndash; Окленд.</p>\n<p>\n\tПо данным источников, первый судозаход в Восточный намечен на 12 апреля зафрахтованным контейнеровозом &laquo;CSCL Africa&raquo;. Время транзита из Лос-Анджелеса в Восточный составит 14 дней, из Окленда &ndash; 12 дней.</p>\n<p>\n\tПосле CMACGM(1 сервис), MaerskLine(3 сервиса) и ZIM(1 сервис) это будет уже шестой океанский сервис, осуществляющий заходы в российский дальневосточный порт.</p>\n<p>\n\t&nbsp;</p>\n	<p>\n\tThe Hong Kong-Taiwan-US West Coast (HTW) service of Evergreen will be extended to Vostochny, deploying</p>\n	<p>\n\tEvergreen будет заходить в Восточный на своем deep sea сервисе Hong Kong-Taiwan-US West Coast (HTW).</p>\n
2	2012-05-10 19:45:03+04	t			Q1 2012 container throughput of Baltic ports	<p>\n\t<span lang="EN-US">In the Q1 2012 container throughput of Baltic ports went up by 16,7% to 236 266 TEU.</span></p>\n	liniya-hanjin-vozvraschaetsya-na-2012-05-10-104503	<p>\n\tIn the Q1 2012 container throughput of Baltic ports went up by 16,7% to 236 266 TEU.</p>\n<p>\n\tThe biggest port of the region &ndash; Kalipeda handled 91,1 thousand TEU (+0,1%), followed by Riga &nbsp;&ndash; 86,9 thousand TEU (+30,5%). Tallin achieved in Jan.-Mar. slightly less than 57 thousand TEU, which is 28,5% than a year ago.</p>\n<p>\n\tLiepaya increased its container throughput by 76,2% to 962 TEU. Container handling has been resumed at Ventspils &ndash; 360 TEU was the results in Q1 2012.</p>\n	\N	\N	2012-04-20 09:00:00+04	1775	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Q1 2012 container throughput of Baltic ports	Линия Hanjin возвращается на Черное море	<p>\n\tIn the Q1 2012 container throughput of Baltic ports went up by 16,7% to 236 266 TEU.</p>\n<p>\n\tThe biggest port of the region &ndash; Kalipeda handled 91,1 thousand TEU (+0,1%), followed by Riga &nbsp;&ndash; 86,9 thousand TEU (+30,5%). Tallin achieved in Jan.-Mar. slightly less than 57 thousand TEU, which is 28,5% than a year ago.</p>\n<p>\n\tLiepaya increased its container throughput by 76,2% to 962 TEU. Container handling has been resumed at Ventspils &ndash; 360 TEU was the results in Q1 2012.</p>\n	<p>\n\tHanjin присоединится к линиям Cosconи ZIM, как пользователь слота на сервисе FarEast-BlackSeaABX, оперируемом судами (9 х 5700 TEU) альянса перевозчиков в составе ChinaShipping(5 судов), &ldquo;K&rdquo; Line, PIL, WanHaiи YangMing( по 1 судну), который заходит в порты: Пирей, Стамбул (Амбарли), Констанца, Ильичевск, Кланг, Шанхай, Нингбо, Шенжень (Шекоу), Сингапур, Кланг и обратно в Пирей.</p>\n	<p>\n\t<span lang="EN-US">In the Q1 2012 container throughput of Baltic ports went up by 16,7% to 236 266 TEU.</span></p>\n	<p>\n\t<span lang="EN-US">Hanjin </span>присоединится к линиям <span lang="EN-US">Coscon</span>и <span lang="EN-US">ZIM</span>, как пользователь слота на сервисе <span lang="EN-US"> Far</span><span lang="EN-US">East</span>-<span lang="EN-US">Black</span><span lang="EN-US">Sea</span><span lang="EN-US">ABX</span>, оперируемом судами (9 х 5700 <span lang="EN-US">TEU</span>) альянса перевозчиков в составе <span lang="EN-US"> China</span><span lang="EN-US">Shipping</span>(5 судов), &ldquo;<span lang="EN-US">K</span>&rdquo; <span lang="EN-US">Line</span>, <span lang="EN-US"> PIL</span>, <span lang="EN-US">Wan</span><span lang="EN-US">Hai</span>и <span lang="EN-US">Yang</span><span lang="EN-US">Ming</span>( по 1 судну), который заходит в порты: Пирей, Стамбул (Амбарли), Констанца, Ильичевск, Кланг, Шанхай, Нингбо, Шенжень (Шекоу), Сингапур, Кланг и обратно в Пирей.</p>\n
2	2012-05-10 19:44:13+04	t			Changes on the Team Lines intra-Baltic services	<p>\n\t<span lang="EN-US">Team Lines will make various changes to services operating in the Baltic. </span></p>\n	izmeneniya-v-linejnyih-servisah-2012-05-10-104413	<p>\n\t<span lang="EN-US">Team Lines will make various changes to services operating in the Baltic. The following loops, with</span></p>\n<p>\n\t<span lang="EN-US">their new itineraries, will be affected:</span></p>\n<ul>\n\t<li>\n\t\t<span lang="EN-US">RUS1 - Bremerhaven, Hamburg, Riga, Tallinn, St. Petersburg and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">RUS3 - Bremerhaven, Hamburg, St. Petersburg, Rauma, Gavle and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">POL2 - Hamburg, Bremerhaven, Szczecin, Aarhus and back to Hamburg;</span></li>\n\t<li>\n\t\t<span lang="EN-US">FIN1 - Bremerhaven, Hamburg, Turku, Kotka, Helsinki and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">SWE1 - Bremerhaven, Hamburg, Norrkoping, Stockholm, Gavle, Sodertalje and back to Bremerhaven</span></li>\n</ul>\n<p>\n\t<span lang="EN-US">&nbsp;</span></p>\n	\N	\N	2012-05-05 09:00:00+04	1776	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Changes on the Team Lines intra-Baltic services	 Изменения в линейных сервисах Team Lines на Балтике	<p>\n\t<span lang="EN-US">Team Lines will make various changes to services operating in the Baltic. The following loops, with</span></p>\n<p>\n\t<span lang="EN-US">their new itineraries, will be affected:</span></p>\n<ul>\n\t<li>\n\t\t<span lang="EN-US">RUS1 - Bremerhaven, Hamburg, Riga, Tallinn, St. Petersburg and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">RUS3 - Bremerhaven, Hamburg, St. Petersburg, Rauma, Gavle and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">POL2 - Hamburg, Bremerhaven, Szczecin, Aarhus and back to Hamburg;</span></li>\n\t<li>\n\t\t<span lang="EN-US">FIN1 - Bremerhaven, Hamburg, Turku, Kotka, Helsinki and back to Bremerhaven;</span></li>\n\t<li>\n\t\t<span lang="EN-US">SWE1 - Bremerhaven, Hamburg, Norrkoping, Stockholm, Gavle, Sodertalje and back to Bremerhaven</span></li>\n</ul>\n<p>\n\t<span lang="EN-US">&nbsp;</span></p>\n	<p>\n\tTeam Lines вводит изменения на сервисах, задействованных в Балтийском море.</p>\n<p>\n\tНовые ротации портов на измененных сервисах.</p>\n<ul>\n\t<li>\n\t\tRUS1 - Бремерхафн, Гамбург, Рига, Таллин, Санкт-Петербург и обратно в Бремерхафн;</li>\n\t<li>\n\t\tRUS3 &ndash; Бремерхафн, Гамбург, Санкт-Петербург, Раума, Гавле и обратно в Бремерхафн;</li>\n\t<li>\n\t\tPOL2 &ndash; Гамбург, Бремерхафн, Щецин, Охус и обратно в Гамбург;</li>\n\t<li>\n\t\tFIN1 &ndash; Бремерхафн, Гамбург, Турку, Котка, Хелсьинки и обратно в Бремерхафн;</li>\n\t<li>\n\t\tSWE1 &ndash; Бремерхафн, Гамбург, Норкоппинг, Стокгольм, Гавле, Сёдерталье и обратно в Бремерхафн.</li>\n</ul>\n	<p>\n\t<span lang="EN-US">Team Lines will make various changes to services operating in the Baltic. </span></p>\n	<p>\n\t<span lang="EN-US">Team Lines </span> вводит изменения на сервисах, задействованных в Балтийском море.</p>\n
2	2012-05-18 02:37:19+04	t			Container handling of Ukrainian ports in Q1’ 2012	<p>\n\t<span lang="EN-US">In the Q1 2012 ports of Ukraine handled 157 &nbsp;662 TEU, which is 5,2% lower than in the same period of 2011.</span></p>\n	dinamika-perevalki-kontejnerov-v-2012-05-17-173719	<p>\n\t<span lang="EN-US">In the Q1 2012 ports of Ukraine handled 157 &nbsp;662 TEU, which is 5,2% lower than in the same period of 2011.</span></p>\n<p>\n\t<span lang="EN-US">Reduction of volumes occurred mainly due to -31,6% slump in Iliychevsk seaport. The port handled in the Q1 just 46&nbsp;221 TEU.</span></p>\n<p>\n\t<span lang="EN-US">Odessa seaport (terminals HPC and Brooklin-Kiev) handled in the first three month almost as much as a year ago - 95&nbsp;221 TEU (+1,1%).</span></p>\n<p>\n\t<span lang="EN-US">The biggest growth among Ukrainian terminals was achieved the Fishery port of Iliychevsk &ndash; the terminal handled 9&nbsp;877 TEU (+ 294% YoY). </span></p>\n<p>\n\t<span lang="EN-US">&nbsp;Despite the recession in Q1, March throughput of Ukrainian ports showed some signs of recovery &ndash; container volumes went up by 9,4% above February, to 56&nbsp;633 TEU.</span></p>\n	\N	\N	2012-05-17 09:00:00+04	1779	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Container handling of Ukrainian ports in Q1’ 2012	Динамика перевалки контейнеров в Украине	<p>\n\t<span lang="EN-US">In the Q1 2012 ports of Ukraine handled 157 &nbsp;662 TEU, which is 5,2% lower than in the same period of 2011.</span></p>\n<p>\n\t<span lang="EN-US">Reduction of volumes occurred mainly due to -31,6% slump in Iliychevsk seaport. The port handled in the Q1 just 46&nbsp;221 TEU.</span></p>\n<p>\n\t<span lang="EN-US">Odessa seaport (terminals HPC and Brooklin-Kiev) handled in the first three month almost as much as a year ago - 95&nbsp;221 TEU (+1,1%).</span></p>\n<p>\n\t<span lang="EN-US">The biggest growth among Ukrainian terminals was achieved the Fishery port of Iliychevsk &ndash; the terminal handled 9&nbsp;877 TEU (+ 294% YoY). </span></p>\n<p>\n\t<span lang="EN-US">&nbsp;Despite the recession in Q1, March throughput of Ukrainian ports showed some signs of recovery &ndash; container volumes went up by 9,4% above February, to 56&nbsp;633 TEU.</span></p>\n	<p>\n\tВ первом квартале 2012 года переработка контейнеров в морских портах Украины составила 157&nbsp;662 TEU, что на 5,2% ниже, чем за аналогичный период 2011 года.</p>\n<p>\n\tСокращение произошло в основном из-за спада объемов в Ильичевском морском торговом порту до 46&nbsp;221 TEU (-31,6%).</p>\n<p>\n\tОдесский морской торговый порт (терминалы ГПК и Бруклин-Киев) показал результаты практически равные прошлогодним &ndash; 95&nbsp;221 TEU(+1,1%).</p>\n<p>\n\tНаибольший прирост &ndash; на 294% был достигнут Ильичевским рыбным портом, объем которого составил в 1 квартале 9&nbsp;877 TEU.</p>\n<p>\n\tНесмотря на снижение объемов, в марте порты Украины вышли в положительную динамику с объемом перевалки 56&nbsp;633 TEU, рост к февралю +9,4%.</p>\n	<p>\n\t<span lang="EN-US">In the Q1 2012 ports of Ukraine handled 157 &nbsp;662 TEU, which is 5,2% lower than in the same period of 2011.</span></p>\n	<p>\n\tВ первом квартале 2012 года переработка контейнеров в морских портах Украины составила 157&nbsp;662 <span lang="EN-US">TEU</span>, что на 5,2% ниже, чем за аналогичный период 2011 года.</p>\n
2	2012-06-18 22:18:05+04	t			Maersk takes slots on the MSC service to Novorossiysk.	<p>\n\t<span lang="EN-US">Seago, the short sea subsidiary of Maersk, has temporarily suspended its Black Sea service from Port Said and Ashdod to Novorossiysk. Till start of the new reefer season the line will hire slots on the Alexandria/Ashdod to Novorossiysk service of MSC. </span></p>\n	maersk-beryot-slotyi-na-2012-06-18-131805	<p>\n\t<span lang="EN-US">Seago, the short sea subsidiary of Maersk, has temporarily suspended its Black Sea service from Port Said and Ashdod to Novorossiysk. Till start of the new reefer season the line will hire slots on the Alexandria/Ashdod to Novorossiysk service of MSC. </span></p>\n<p>\n\t<span lang="EN-US">Seago has explained stop of own loop with insufficient volume of reefer imports during the low season and growing bunker costs. The last sailing of Seago own feeder m/v Bernard A from Port Said to Novorossiysk was on June 10<sup>th</sup>..</span></p>\n<p>\n\t<span lang="EN-US">From June 18<sup>th</sup> till restart of reefer season, goods from Egypt and Israel will be delivered to Novorossiysk in two ways: from Port Said via Ambarli/Istanbul and directly from Alexandria and Ashdod. </span></p>\n	\N	\N	2012-06-10 09:00:00+04	1781	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk takes slots on the MSC service to Novorossiysk.	Maersk берёт слоты на Новороссийск на сервисе MSC.	<p>\n\t<span lang="EN-US">Seago, the short sea subsidiary of Maersk, has temporarily suspended its Black Sea service from Port Said and Ashdod to Novorossiysk. Till start of the new reefer season the line will hire slots on the Alexandria/Ashdod to Novorossiysk service of MSC. </span></p>\n<p>\n\t<span lang="EN-US">Seago has explained stop of own loop with insufficient volume of reefer imports during the low season and growing bunker costs. The last sailing of Seago own feeder m/v Bernard A from Port Said to Novorossiysk was on June 10<sup>th</sup>..</span></p>\n<p>\n\t<span lang="EN-US">From June 18<sup>th</sup> till restart of reefer season, goods from Egypt and Israel will be delivered to Novorossiysk in two ways: from Port Said via Ambarli/Istanbul and directly from Alexandria and Ashdod. </span></p>\n	<p>\n\tSeago, региональный контейнерный перевозчик в составе Maersk, временно прекращает работу своего черноморского сервиса из Порт-Саида и Ашдода на Новороссийск. До начала нового рефсезона линия будет использовать слоты на черноморском сервисе MSC.</p>\n<p>\n\tВ Seago объясняют отказ от собственного сервиса низкими объемами рефов и ростом расходов из-за высоких цен на бункер. Последний рейс будет т/х &laquo;Bernard A&raquo; будет 10 июня из Порт-Саида.</p>\n<p>\n\tС 18 июня и до окончания рефсезона опции для грузов из Египта и Израиля будут такие: из Порт-Саида в Новороссийск с трансшипментом через Амбарли на сервисе Seago, напрямую из Александрии и Ашдода на Новороссийск и из Новороссийска на Ашдод &ndash; на сервисе MSC.</p>\n	<p>\n\t<span lang="EN-US">Seago, the short sea subsidiary of Maersk, has temporarily suspended its Black Sea service from Port Said and Ashdod to Novorossiysk. Till start of the new reefer season the line will hire slots on the Alexandria/Ashdod to Novorossiysk service of MSC. </span></p>\n	<p>\n\tSeago, региональный контейнерный перевозчик в составе Maersk, временно прекращает работу своего черноморского сервиса из Порт-Саида и Ашдода на Новороссийск. До начала нового рефсезона линия будет использовать слоты на черноморском сервисе MSC.</p>\n
2	2012-11-30 02:18:06+04	t			Summa completes the acquisition of FESCO	<p>\n\tExtensive negotiations on acquisition of FESCO group seem to near their end as the deal must be closed in the coming days soon. The amount of the deal is estimated at over USD900&nbsp;million.</p>\n	summa-zakryivaet-sdelku-po-2012-11-29-161806	<p>\n\tExtensive negotiations on acquisition of FESCO group seem to near their end as the deal must be closed in the coming days soon. The amount of the deal is estimated at over USD900&nbsp;million.</p>\n<p>\n\tOriginally Summa failed to get loan from Russian banks, including Sberbank, and had to invite international sources of finance. So the deal was delayed several times. Finally the main lenders will be ING, Goldman Sachs and Raiffeisen. The total amount of syndicated loan will reach about USD700 millions.</p>\n<p>\n\tThe deal will cover 56% of Far Eastern Shipping Co. Besides of that 9% of 13% FESCO&rsquo;s treasury stock was sold in the H1 2012 for USD78 million to undisclosed buyer, supposedly affiliated with Summa. As a result Summa will control Vladivostok Commercial Seaport, Transgarant, Russkaya Troyka, Dalreftrans, about 20% of Transcontainer as well as several other transportation companies. &nbsp;Part of FESCO fleet including 25 conventional vessels will remain outside of the deal.</p>\n<p>\n\tThe consolidated revenue of FESCO in the H1 2012 was USD582,5&nbsp;million. Loss due to fleet revaluation and currency exchange was USD60&nbsp;million. CompanycapitalizationisintheregionofRUR29 bn.&nbsp;</p>\n<p>\n\tAccording to Summa there is a possibility the FESCO will get another minor shareholder, which can finance up to 20% of the deal. In any case Summa would become FESCO&rsquo;s dominant shareholder. Other shareholders of FESCO include East Capital fund (7%) and EBRD (3,7%), about 20% of FESCO stock is floated on the market.</p>\n	\N	\N	2012-11-29 10:00:00+04	1803	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Summa completes the acquisition of FESCO	Сумма закрывает сделку по покупке FESCO	<p>\n\tExtensive negotiations on acquisition of FESCO group seem to near their end as the deal must be closed in the coming days soon. The amount of the deal is estimated at over USD900&nbsp;million.</p>\n<p>\n\tOriginally Summa failed to get loan from Russian banks, including Sberbank, and had to invite international sources of finance. So the deal was delayed several times. Finally the main lenders will be ING, Goldman Sachs and Raiffeisen. The total amount of syndicated loan will reach about USD700 millions.</p>\n<p>\n\tThe deal will cover 56% of Far Eastern Shipping Co. Besides of that 9% of 13% FESCO&rsquo;s treasury stock was sold in the H1 2012 for USD78 million to undisclosed buyer, supposedly affiliated with Summa. As a result Summa will control Vladivostok Commercial Seaport, Transgarant, Russkaya Troyka, Dalreftrans, about 20% of Transcontainer as well as several other transportation companies. &nbsp;Part of FESCO fleet including 25 conventional vessels will remain outside of the deal.</p>\n<p>\n\tThe consolidated revenue of FESCO in the H1 2012 was USD582,5&nbsp;million. Loss due to fleet revaluation and currency exchange was USD60&nbsp;million. CompanycapitalizationisintheregionofRUR29 bn.&nbsp;</p>\n<p>\n\tAccording to Summa there is a possibility the FESCO will get another minor shareholder, which can finance up to 20% of the deal. In any case Summa would become FESCO&rsquo;s dominant shareholder. Other shareholders of FESCO include East Capital fund (7%) and EBRD (3,7%), about 20% of FESCO stock is floated on the market.</p>\n	<p>\n\tДлительные переговоры по покупке Суммой транспортной группы FESCO, наконец, завершились, и теперь в ближайшие дни сделка будет закрыта. Сумма сделки составит более $900&nbsp;млн.</p>\n<p>\n\tДля покупки Сумма была намерена взять кредиты в российских банках, в том числе и в Сбербанке, но, получив отказ в предоставлении займа, группа начала искать зарубежные источники финансирования. Поэтому закрытие сделки откладывалось на довольно долгие сроки. Основными кредиторами выступят ING, Goldman Sachs и Raiffeisen. При этом объем синдицированного кредита может достичь порядка $700&nbsp;млн.</p>\n<p>\n\tРезультатом сделки станет покупка 56% Дальневосточного морского пароходства. Кроме того, более 9% из 13% казначейских акций FESCO продала в первом полугодии за $78&nbsp;млн, при этом покупатель не известен, но им предположительно выступает структура Суммы. Таким образом, Сумма будет контролировать Владивостокский МТП, Трансгарант, Русскую тройку, Дальрефтранс, порядка 20% акций Трансконтейнера, а также ряд ругих операторов. Часть морского флота FESCO, состоящая из 25 судов для перевозки генеральных грузов, в структуру сделки не входит.</p>\n<p>\n\tКонсолидированная выручка FESCO по МСФО в первом полугодии текущего года составила $582,5&nbsp;млн, убыток , вызванный переоценкой стоимости флота и курсовыми разницами &mdash; $60&nbsp;млн. Рыночная капитализация компании составляет порядка 29&nbsp;млрд руб.</p>\n<p>\n\tПо словам представителя Суммы, не исключено появление у FESCO нового миноритарного акционера, который, по мнению участников рынка, профинансирует до 20% сделки. При этом, по заявлению Суммы, группа в любом случае будет контролирующим ауционером FESCO. На данный момент крупнейшими миноритариями ДВМП выступают фонд East Capital (7%) и ЕБРР (3,7%), порядка 20% обращаются на рынке.</p>\n	<p>\n\tExtensive negotiations on acquisition of FESCO group seem to near their end as the deal must be closed in the coming days soon. The amount of the deal is estimated at over USD900&nbsp;million.</p>\n	<p>\n\tДлительные переговоры по покупке Суммой транспортной группы FESCO, наконец, завершились, и теперь в ближайшие дни сделка будет закрыта. Сумма сделки составит более $900&nbsp;млн.</p>\n
2	2012-06-18 22:19:42+04	t			MOL joins feeder service of HL to St.Petersburg	<p>\n\tFrom end of June MOL will start hiring slots on the May-launched Russia Express (REX) feeder service recently initiated by Hapag-Lloyd, calling</p>\n<p>\n\tat: Bremerhaven, Hamburg, St. Petersburg, Helsinki, Gdynia and back to Bremerhaven with two ice-class 1400 TEU units.</p>\n	mol-vospolzuetsya-fiderom-hapag-2012-06-18-131942	<p>\n\tFrom end of June MOL will start hiring slots on the May-launched Russia Express (REX) feeder service recently initiated by Hapag-Lloyd, calling</p>\n<p>\n\tat: Bremerhaven, Hamburg, St. Petersburg, Helsinki, Gdynia and back to Bremerhaven with two ice-class 1400 TEU units.</p>\n	\N	\N	2012-06-15 09:00:00+04	1782	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MOL joins feeder service of HL to St.Petersburg	MOL воспользуется фидером Hapag на Санкт-Петербург	<p>\n\tFrom end of June MOL will start hiring slots on the May-launched Russia Express (REX) feeder service recently initiated by Hapag-Lloyd, calling</p>\n<p>\n\tat: Bremerhaven, Hamburg, St. Petersburg, Helsinki, Gdynia and back to Bremerhaven with two ice-class 1400 TEU units.</p>\n	<p>\n\t&nbsp;С конца июня линия MOLначинает использовать слоты на недавно запущенном фидере RussiaExpress (REX) компании Hapag-Lloyd. Фидер заходит в порты Бремерхафен, Гамбург, Санкт-Петербург, Хельсинки, Гдыня и обратно в Бремерхафн, используя два судна ледового класса вместимостью по 1400 TEU.</p>\n	<p>\n\tFrom end of June MOL will start hiring slots on the May-launched Russia Express (REX) feeder service recently initiated by Hapag-Lloyd, calling</p>\n<p>\n\tat: Bremerhaven, Hamburg, St. Petersburg, Helsinki, Gdynia and back to Bremerhaven with two ice-class 1400 TEU units.</p>\n	<p>\n\tС конца июня линия MOLначинает использовать слоты на недавно запущенном фидере RussiaExpress (REX) компании Hapag-Lloyd. Фидер заходит в порты Бремерхафен, Гамбург, Санкт-Петербург, Хельсинки, Гдыня и обратно в Бремерхафн, используя два судна ледового класса вместимостью по 1400 TEU.</p>\n
2	2012-06-25 23:05:48+04	t			The second deep-sea service to St. Petersburg	<p>\n\t<span lang="EN-US">Maersk Line has added St Petersburg to its Europe-Mexico-Central</span> America service (CRX).</p>\n	vtoroj-okeanskij-servis-na-2012-06-25-140548	<p>\n\tMaersk Line has added St Petersburg to its Europe-Mexico-Central America service (CRX). The CRX will henceforth call at Tilbury, Rotterdam,</p>\n<p>\n\tBremerhaven, St Petersburg, Rotterdam, Bremerhaven, Vera Cruz, Altamira, Big Creek, Manzanillo (Pan), Moin, Cork, Tilbury.</p>\n<p>\n\tPrior to the extension, the service turned at Bremerhaven while the boxes</p>\n<p>\n\tto/from St Petersburg used to be relayed through Baltic feeders or</p>\n<p>\n\tthe Bremerhaven-St Petersburg string of the &#39;Ecubex&#39; service.</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tThe extension of the CRX to St Petersburg leads to the addition of</p>\n<p>\n\ttwo weeks to the rotation, which will then take eight weeks instead of</p>\n<p>\n\tsix weeks. Two 2,500 teu ships are added in order to maintain</p>\n<p>\n\tweekly sailings. These two additional ships are shifted from the</p>\n<p>\n\tEurope-WCSA &#39;Andean&#39; service, which has been recently suspended.</p>\n<p>\n\tBoth the CRX and Ecubex are fruit oriented services serving in particular</p>\n<p>\n\tthe Russian market via St Petersburg. The volumes of bananas</p>\n<p>\n\tand other fruits have progressively been containerized over</p>\n<p>\n\tthe years at the expense of conventional reefer tonnage, leading to</p>\n<p>\n\tan increase of containerized shipments that today justify the introduction</p>\n<p>\n\tof a St Petersburg direct call.</p>\n	\N	\N	2012-06-19 09:00:00+04	1783	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	The second deep-sea service to St. Petersburg	Второй океанский сервис на Санкт-Петебург	<p>\n\tMaersk Line has added St Petersburg to its Europe-Mexico-Central America service (CRX). The CRX will henceforth call at Tilbury, Rotterdam,</p>\n<p>\n\tBremerhaven, St Petersburg, Rotterdam, Bremerhaven, Vera Cruz, Altamira, Big Creek, Manzanillo (Pan), Moin, Cork, Tilbury.</p>\n<p>\n\tPrior to the extension, the service turned at Bremerhaven while the boxes</p>\n<p>\n\tto/from St Petersburg used to be relayed through Baltic feeders or</p>\n<p>\n\tthe Bremerhaven-St Petersburg string of the &#39;Ecubex&#39; service.</p>\n<p>\n\t&nbsp;</p>\n<p>\n\tThe extension of the CRX to St Petersburg leads to the addition of</p>\n<p>\n\ttwo weeks to the rotation, which will then take eight weeks instead of</p>\n<p>\n\tsix weeks. Two 2,500 teu ships are added in order to maintain</p>\n<p>\n\tweekly sailings. These two additional ships are shifted from the</p>\n<p>\n\tEurope-WCSA &#39;Andean&#39; service, which has been recently suspended.</p>\n<p>\n\tBoth the CRX and Ecubex are fruit oriented services serving in particular</p>\n<p>\n\tthe Russian market via St Petersburg. The volumes of bananas</p>\n<p>\n\tand other fruits have progressively been containerized over</p>\n<p>\n\tthe years at the expense of conventional reefer tonnage, leading to</p>\n<p>\n\tan increase of containerized shipments that today justify the introduction</p>\n<p>\n\tof a St Petersburg direct call.</p>\n	<p>\n\tЛиния Maerskдобавила Санкт-Петербург в расписание сервиса CRX, работающего на направлении Европа-Мексика-Центральная Америка.</p>\n<p>\n\tРотация портов на сервисе CRX будет следующей: Тилбюри, Роттердам, Бремерхафен, Санкт-Петербург, Роттердам, Бремерхафен, Веракруз, Альтамира, Биг Крик, Манзанилло (Панама), Мойн, Корк, Тилбюри.</p>\n<p>\n\tДо настоящего времени сервис доходил только до Бремерхафена, куда контейнеры в/из Санкт-Петербурга доставлялись с помощью балтийских фидеров Maersk либо на плече Бремерхафен &ndash; Санкт-Петербург другого прямого сервиса линии &nbsp;&#39;Ecubex&#39;.</p>\n<p>\n\tПродление сервиса CRX до Санкт-Петербурга приведёт к удлинению его ротации с шести до восьми недель.</p>\n<p>\n\tДля сохранения недельной частоты к шести задействованным судам добавлено ещё два судна вместимостью по 2,500 teu.</p>\n<p>\n\tЭти два судна переводятся с недавно приостановленного сервиса Andean между Европой и Зап.побережьем Южной Америки.</p>\n<p>\n\tСервисы CRX и Ecubex ориентированы преимущественно на доставку свежих фруктов на российский рынок.</p>\n<p>\n\tВ последние годы активно росла контейнеризация перевозок бананов и прочих фруктов, что привело к значительному увеличению контейнерных перевозок и запуску уже второго прямого сервиса на Санкт-Петербург.</p>\n	<p>\n\t<span lang="EN-US">Maersk Line has added St Petersburg to its Europe-Mexico-Central</span> America service (CRX).</p>\n	<p>\n\tЛиния Maerskдобавила Санкт-Петербург в расписание сервиса CRX, работающего на направлении Европа-Мексика-Центральная Америка.</p>\n
2	2012-07-18 23:02:35+04	t			Container handling results of Novorossiysk seaport in the H1 2012	<p>\n\tIn the first half of 2012 the port of Novorossiysk handled 339&nbsp;517 TEU (+2% on 2011 YoY).</p>\n	itogi-perevalki-kontejnerov-v-2012-07-18-140235	<p>\n\tIn the first half of 2012 the port of Novorossiysk handled 339&nbsp;517 TEU (+2% on 2011 YoY).</p>\n<p>\n\tThe volume of imported containers went up just by 0.5% to 164&nbsp;729 TEU, while exports surged to 60&nbsp;995 TEU, by 31%.</p>\n<p>\n\tContainer throughput of Novorossiysk port terminals was as follows.</p>\n<p>\n\tNLE (Timber) 139&nbsp;075 TEU (-7%)</p>\n<p>\n\tNUTEP 111&nbsp;190 TEU (+6,9%)</p>\n<p>\n\tNCSP 89&nbsp;252 TEU (+13%)</p>\n	\N	\N	2012-07-17 09:00:00+04	1785	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Container handling results of Novorossiysk seaport in the H1 2012	Итоги перевалки контейнеров в Новороссийском порту за 1 полугодие 2012.	<p>\n\tIn the first half of 2012 the port of Novorossiysk handled 339&nbsp;517 TEU (+2% on 2011 YoY).</p>\n<p>\n\tThe volume of imported containers went up just by 0.5% to 164&nbsp;729 TEU, while exports surged to 60&nbsp;995 TEU, by 31%.</p>\n<p>\n\tContainer throughput of Novorossiysk port terminals was as follows.</p>\n<p>\n\tNLE (Timber) 139&nbsp;075 TEU (-7%)</p>\n<p>\n\tNUTEP 111&nbsp;190 TEU (+6,9%)</p>\n<p>\n\tNCSP 89&nbsp;252 TEU (+13%)</p>\n	<p>\n\tВ первом полугодии 2012 года Новороссийский порт обработал 339&nbsp;517 TEU (+2% к 1 пг 2011).</p>\n<p>\n\tОбъем импорта через Новороссийск вырос на 0,5% 164&nbsp;729 TEU, экспорт увеличился до 60&nbsp;995 TEU, на 31% по сравнению с 2011 годом.</p>\n<p>\n\tПеревалка контейнеров на терминалах Новороссийского порта в первом полугодии составила:</p>\n<p>\n\tНЛЭ 139&nbsp;075 TEU (-7%)</p>\n<p>\n\tНУТЭП 111&nbsp;190 TEU (+6,9%)</p>\n<p>\n\tНМТП 89&nbsp;252 TEU (+13%)</p>\n	<p>\n\tIn the first half of 2012 the port of Novorossiysk handled 339&nbsp;517 TEU (+2% on 2011 YoY).</p>\n	<p>\n\tВ первом полугодии 2012 года Новороссийский порт обработал 339&nbsp;517 TEU (+2% к 1 пг 2011).</p>\n
2	2012-07-18 23:05:39+04	t			Carriers suspend some Asia-Europe сalls in mid-peak season	<p>\n\tThe recovery of the Asia &ndash; Europe trade remains tentative, with weak cargo demand forcing some carriers to pull out sailings in what should have been the peak shipping season for the trade.</p>\n	linii-otmenyayut-rejsyi-na-2012-07-18-140539	<p>\n\tThe recovery of the Asia &ndash; Europe trade remains tentative, with weak cargo demand forcing some carriers to pull out sailings in what should have been the peak shipping season for the trade.</p>\n<p>\n\t&nbsp;Maersk and the CHKY alliance members have taken the lead to skip some calls for a month of July to better manage capacity. The decision illustrates to difficulties to fill the Asia-Europe ships as the faltering demand on the Europe side does not allow to mop up the extra capacity recently added to the trade. The capacity supply has increased by 9% over the past three months, while demand went down by abt.5% in same period of time.</p>\n<p>\n\tCosco Container Lines, &ldquo;K&rdquo; Line, Yang Ming and Hanjin Shipping announced they would independently implement what they call a &ldquo;capacity rationalization plan&rdquo; on their services in the two trade lanes by skipping some voyages in July and August.</p>\n<p>\n\tEven as the four carriers announced their skipped calls, average spot rates in the Asia-Europe trade lane eased slightly this week as vessel overcapacity continues to erode the big general rate increases carriers have put into effect this year.</p>\n<p>\n\tIn the period from the end of July to the middle of August, the CKYH carriers will set what they call &ldquo;blank sailings&rdquo; on the NE1 service operated by Cosco, the NE4 service jointly operated by Yang Ming and &ldquo;K&rdquo; Line, and the MD1 service jointly operated by Cosco and Hanjin Shipping.</p>\n<p>\n\tThe specific voyages that are being skipped are:</p>\n<ul>\n\t<li>\n\t\tThe NE4 call at Ningbo will be skipped on July 25.</li>\n\t<li>\n\t\tThe NE1 service call at Shanghai will be skipped on Aug. 4.</li>\n\t<li>\n\t\tThe MD1 service call by the Hanjin Rotterdam, which has a capacity of 8,600 20-foot equivalent units, at Qingdao on Aug. 4 will be replaced by a smaller vessel with a capacity of 5,600 TEUs.</li>\n\t<li>\n\t\tThe NE4 service&rsquo;s Yang Ming Mobility will skip its call at Ningbo on Aug. 15.</li>\n</ul>\n<p>\n\tThe CKYH carriers&rsquo; move follows the decision of Maersk to skip four sailings in early July, which was done without any public announcements:</p>\n<ul>\n\t<li>\n\t\tAE5 sailing skipped on Week 28 eta Ningbo 8 July</li>\n\t<li>\n\t\tAE6 sailing skipped on Week 27 eta Ningbo 4 July</li>\n\t<li>\n\t\tAE9 sailing skipped on Week 27 eta Qingdao 5 July (with downgraded connections at Tanjung Pelepas, capacity reduced by 4&rsquo;000 TEU).</li>\n\t<li>\n\t\tAE20 sailing skipped on Week 28 eta Shanghai 13 July (service jointly run with CMA CGM)</li>\n</ul>\n<p>\n\tDespite Maersk&rsquo;s skipped sailings in the first two weeks of July, the Far East &ndash; Europe spot rates come under increasing pressure. Vessel load factors remain well below normal peak season levels, averaging just 90%, which has pulled down spot rates on the FE-North Europe trade by 7% in the last two weeks, based on SCFI.</p>\n<p>\n\tForward rates suggest that FE-Europe rates have peaked in early July and are expected to trend down in the next six months.</p>\n	\N	\N	2012-07-16 09:00:00+04	1787	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Carriers suspend some Asia-Europe сalls in mid-peak season	Линии  отменяют рейсы на направлении Азия-Европа	<p>\n\tThe recovery of the Asia &ndash; Europe trade remains tentative, with weak cargo demand forcing some carriers to pull out sailings in what should have been the peak shipping season for the trade.</p>\n<p>\n\t&nbsp;Maersk and the CHKY alliance members have taken the lead to skip some calls for a month of July to better manage capacity. The decision illustrates to difficulties to fill the Asia-Europe ships as the faltering demand on the Europe side does not allow to mop up the extra capacity recently added to the trade. The capacity supply has increased by 9% over the past three months, while demand went down by abt.5% in same period of time.</p>\n<p>\n\tCosco Container Lines, &ldquo;K&rdquo; Line, Yang Ming and Hanjin Shipping announced they would independently implement what they call a &ldquo;capacity rationalization plan&rdquo; on their services in the two trade lanes by skipping some voyages in July and August.</p>\n<p>\n\tEven as the four carriers announced their skipped calls, average spot rates in the Asia-Europe trade lane eased slightly this week as vessel overcapacity continues to erode the big general rate increases carriers have put into effect this year.</p>\n<p>\n\tIn the period from the end of July to the middle of August, the CKYH carriers will set what they call &ldquo;blank sailings&rdquo; on the NE1 service operated by Cosco, the NE4 service jointly operated by Yang Ming and &ldquo;K&rdquo; Line, and the MD1 service jointly operated by Cosco and Hanjin Shipping.</p>\n<p>\n\tThe specific voyages that are being skipped are:</p>\n<ul>\n\t<li>\n\t\tThe NE4 call at Ningbo will be skipped on July 25.</li>\n\t<li>\n\t\tThe NE1 service call at Shanghai will be skipped on Aug. 4.</li>\n\t<li>\n\t\tThe MD1 service call by the Hanjin Rotterdam, which has a capacity of 8,600 20-foot equivalent units, at Qingdao on Aug. 4 will be replaced by a smaller vessel with a capacity of 5,600 TEUs.</li>\n\t<li>\n\t\tThe NE4 service&rsquo;s Yang Ming Mobility will skip its call at Ningbo on Aug. 15.</li>\n</ul>\n<p>\n\tThe CKYH carriers&rsquo; move follows the decision of Maersk to skip four sailings in early July, which was done without any public announcements:</p>\n<ul>\n\t<li>\n\t\tAE5 sailing skipped on Week 28 eta Ningbo 8 July</li>\n\t<li>\n\t\tAE6 sailing skipped on Week 27 eta Ningbo 4 July</li>\n\t<li>\n\t\tAE9 sailing skipped on Week 27 eta Qingdao 5 July (with downgraded connections at Tanjung Pelepas, capacity reduced by 4&rsquo;000 TEU).</li>\n\t<li>\n\t\tAE20 sailing skipped on Week 28 eta Shanghai 13 July (service jointly run with CMA CGM)</li>\n</ul>\n<p>\n\tDespite Maersk&rsquo;s skipped sailings in the first two weeks of July, the Far East &ndash; Europe spot rates come under increasing pressure. Vessel load factors remain well below normal peak season levels, averaging just 90%, which has pulled down spot rates on the FE-North Europe trade by 7% in the last two weeks, based on SCFI.</p>\n<p>\n\tForward rates suggest that FE-Europe rates have peaked in early July and are expected to trend down in the next six months.</p>\n	<p>\n\tВосстановление ставок на азиатско-европейском трейде остается неустойчивым. Слабый спрос вынуждает перевозчиков отменять отдельные рейсы в период, который традиционно считался для отрасли пиковым.&nbsp;</p>\n<p>\n\tMaersk и линии-участники альянса CHKY стали первыми в отмене ряда судозаходов в июле, для оптимизации загрузки своего тоннажа. Данное решение отражает те трудности, с которыми столкнулись линии в заполнении флота.</p>\n<p>\n\tВ течении последних трех месяцев его общая вместимость на данном направлении увеличилась на 9% в то время, как спрос в части импорта сократился в это же время примерно на 5%.</p>\n<p>\n\tСosco, &ldquo;K&rdquo; Line, Yang Ming и Hanjin сообщили о введении т.н. &laquo;плана оптимизации тоннажа&raquo; на двух направлениях из Азии в Европу и Средиземное море, предполагающем пропуск нескольких рейсов в июле и августе. &nbsp;</p>\n<p>\n\tНесмотря на эти меры, средние ставки фрахта на этих трейдах незначительно снизились в течении прошлой недели, ввиду того сохраняющегося избытка тоннажа. .</p>\n<p>\n\tВ период с конца июля до середины августа участники альянса CKYH пропустят отдельные рейсы на сервисе NE1, оперируемом Cosco, на NE4 совместно оперируемом Yang Ming и &ldquo;K&rdquo; Line, а также на сервисе MD1 совместно оперируемом Cosco и Hanjin.</p>\n<p>\n\tКонкретно будут пропущены следующие рейсы:</p>\n<ul>\n\t<li>\n\t\tРейс NE4 с заходом в Нингбо 25 июля.</li>\n\t<li>\n\t\tРейс NE1 с заходом в Шанхай 4 августа.</li>\n\t<li>\n\t\tРейс MD1 с заходом в Циндао 4 августа, вместо судна вместимостью 8,600 TEU будет использовано судно меньшей вместимости - 5,600 TEU.</li>\n\t<li>\n\t\tРейс NE4 с заходом в Нингбо 15 августа.</li>\n</ul>\n<p>\n\tРешение CKYH последовало после аналогичных мер со стороны линии Maersk, отменившей без официального уведомления ряд рейсов в начале июля.</p>\n<ul>\n\t<li>\n\t\tРейс AE5 на 28 неделе, с заходом в Нингбо 8 июля.</li>\n\t<li>\n\t\tРейс AE6 на 27 неделе с заходом в Нингбо 4 июля.</li>\n\t<li>\n\t\tРейс AE9 на 27 неделе с заходом в Циндао 5 июля (с уменьшенным до 4000 TEU стыковочным рейсом в Танжунг Пелепасе).</li>\n\t<li>\n\t\tРейс AE20 на 28 неделе с заходом в Шанхай 13 июля (совместный сервис с CMA-CGM)</li>\n</ul>\n<p>\n\tНесмотря на пропуск рейсов в первые две недели июля, ставки на направлении из Азии в Европу продолжают снижаться. Уровень загрузки судов остается ниже обычного пикового показателя и составляет в среднем 90%, что уже привело к спаду ставок фрахта на 7% за последние две недели &ndash; согласно Шанхайскому Контейнерному Фрахтовому Индексу (SCFI). Форвардные ставки этого же индекса предполагают, что ставки на данном направлении достигли своего пика в начале июля и должны снижаться в течении следующих шести месяцев.</p>\n	<p>\n\tThe recovery of the Asia &ndash; Europe trade remains tentative, with weak cargo demand forcing some carriers to pull out sailings in what should have been the peak shipping season for the trade.</p>\n	<p>\n\tВосстановление ставок на азиатско-европейском трейде остается неустойчивым. Слабый спрос вынуждает перевозчиков отменять отдельные рейсы в период, который традиционно считался для отрасли пиковым.</p>\n
2	2012-08-01 01:35:00+04	t			Vladivostok Commercial Seaport has commissioned two new Ship-to-Shore gantries.	<p>\n\tVladivostok Commercial Seaport (VCSP) has put into operation two new STS gantries of Liebherr, delivered from Ireland in April this year.</p>\n	unifeeder-menyaet-rotatsiyu-na-2012-07-31-163500	<p>\n\tVladivostok Commercial Seaport (VCSP) has put into operation two new STS gantries of Liebherr, delivered from Ireland in April this year.</p>\n<p>\n\tThe cranes were tailor designed for operational requirement at the berth nos. 14-15 of the terminal and are suitable for handling Panamax container ships.</p>\n<p>\n\tThe gantries have lifting capacity of up to 60 mt under spreader and productivity of 40 moves/ hour. The twin-lift spreaders of the cranes can handle two 20&rsquo; containers at one time.</p>\n<p>\n\tThe purchase of two STS gantries have cost the VCSP over 400 million roubles (abt. USD12,5 million).</p>\n	\N	\N	2012-07-30 09:00:00+04	1789	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Vladivostok Commercial Seaport has commissioned two new Ship-to-Shore gantries.	Unifeeder меняет ротацию на Санкт-Петербург	<p>\n\tVladivostok Commercial Seaport (VCSP) has put into operation two new STS gantries of Liebherr, delivered from Ireland in April this year.</p>\n<p>\n\tThe cranes were tailor designed for operational requirement at the berth nos. 14-15 of the terminal and are suitable for handling Panamax container ships.</p>\n<p>\n\tThe gantries have lifting capacity of up to 60 mt under spreader and productivity of 40 moves/ hour. The twin-lift spreaders of the cranes can handle two 20&rsquo; containers at one time.</p>\n<p>\n\tThe purchase of two STS gantries have cost the VCSP over 400 million roubles (abt. USD12,5 million).</p>\n	<p>\n\tФидерный оператор Unifeeder провел реорганизацию своих сервисов на Россию. Увеличена провозная способность и число судозаходов&nbsp; на петербургские терминалы.</p>\n<p>\n\tПо информации линии, теперь у Unifeeder четыре еженедельных судозахода в Петербург из Гамбурга, 2 еженедельных судозахода из Роттердама, по одному еженедельному судозаходу из Бремерхафена и Антверпена, плюс еженедельный судозаход в Усть-Лугу.</p>\n<p>\n\tВ Петербурге Unifeeder обслуживается на ПКТ, в Петролеспорту и на Контейнерном терминале Санкт-Петербург (4-й район порта). Ротация сервисов с последними изменениями (действуют с 33 недели):</p>\n<ul type="disc">\n\t<li>\n\t\tLoop 1: Роттердам &ndash; Антверпен &ndash; Гамбург &ndash; Усть-Луга &ndash; ПКТ &ndash; ПЛП &ndash; Роттердам,</li>\n\t<li>\n\t\tLoop 2: Бремерхафен &ndash; Гамбург &ndash; КТ СПб &ndash; ПКТ &ndash; ПЛП &ndash; Клайпеда &ndash; Гамбург &ndash; Бремерхафен,</li>\n\t<li>\n\t\tLoop 3: Роттердам &ndash; ПКТ &ndash; ПЛП &ndash; Роттердам &ndash; Антверпен &ndash; Гамбург,</li>\n\t<li>\n\t\tLoop 4: Гамбург &ndash; ПЛП &ndash; Роттердам &ndash; Гамбург,</li>\n\t<li>\n\t\tLoop 5: Роттердам &ndash; Гамбург &ndash; ПЛП &ndash; Гамбург &ndash; Роттердам.</li>\n</ul>\n	<p>\n\tVladivostok Commercial Seaport (VCSP) has put into operation two new STS gantries of Liebherr, delivered from Ireland in April this year.</p>\n	<p>\n\tФидерный оператор Unifeeder провел реорганизацию своих сервисов на Россию. Увеличена провозная способность и число судозаходов&nbsp; на петербургские терминалы.</p>\n
2	2012-08-01 01:36:38+04	t			Unifeeder has reviewed its services to St. Petersburg port	<p>\n\t<span lang="EN-US">The common feeder operator Unifeeder has upgraded its services to Russia. The line has increased its capacity and frequency of calls at the terminals of St.Petersburg. </span></p>\n	vladivostokskij-morskoj-torgovyij-port-2012-07-31-163638	<p>\n\t<span lang="EN-US">The common feeder operator Unifeeder has upgraded its services to Russia. The line has increased its capacity and frequency of calls at the terminals of St.Petersburg. </span></p>\n<p>\n\t<span lang="EN-US">According to Unifeeder the line now offers four sailings a week to St. Petersburg from Hamburg, two sailings from Rotterdam, one sailing &ndash; from Bremerhaven and Antwerp as well as one weekly call at Ust-Luga. </span></p>\n<p>\n\t<span lang="EN-US">In St.Petersburg Unifeeder calls at the terminals FCT, PLP and Container Terminal of St. Petersburg (the Fourth Stevedoring). </span></p>\n<p>\n\t<span lang="EN-US">&nbsp;The new port rotation valid from the week 33, reads as follows. </span></p>\n<ul style="margin-top:0cm;" type="disc">\n\t<li>\n\t\t<span lang="EN-US">Loop 1: Rotterdam &ndash; Antwerp &ndash; Hamburg &ndash; Ust-Luga &ndash; FCT &ndash; PLP &ndash; Rotterdam, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 2: Bremerhaven &ndash; Hamburg &ndash; CT St.Pete &ndash; FCT &ndash; PLP &ndash; Klaipeda &ndash; Hamburg &ndash; Bremerhaven, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 3: Rotterdam &ndash; FCT &ndash; PLP &ndash; Rotterdam &ndash; Antwerp &ndash; Hamburg, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 4: Hamburg &ndash; PLP &ndash; Rotterdam &ndash; Hamburg, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 5: Rotterdam &ndash; Hamburg &ndash; PLP &ndash; Hamburg &ndash; Rotterdam. </span></li>\n</ul>\n	\N	\N	2012-07-30 09:00:00+04	1790	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Unifeeder has reviewed its services to St. Petersburg port	Владивостокский морской торговый порт ввел в строй два контейнерных крана STS.	<p>\n\t<span lang="EN-US">The common feeder operator Unifeeder has upgraded its services to Russia. The line has increased its capacity and frequency of calls at the terminals of St.Petersburg. </span></p>\n<p>\n\t<span lang="EN-US">According to Unifeeder the line now offers four sailings a week to St. Petersburg from Hamburg, two sailings from Rotterdam, one sailing &ndash; from Bremerhaven and Antwerp as well as one weekly call at Ust-Luga. </span></p>\n<p>\n\t<span lang="EN-US">In St.Petersburg Unifeeder calls at the terminals FCT, PLP and Container Terminal of St. Petersburg (the Fourth Stevedoring). </span></p>\n<p>\n\t<span lang="EN-US">&nbsp;The new port rotation valid from the week 33, reads as follows. </span></p>\n<ul style="margin-top:0cm;" type="disc">\n\t<li>\n\t\t<span lang="EN-US">Loop 1: Rotterdam &ndash; Antwerp &ndash; Hamburg &ndash; Ust-Luga &ndash; FCT &ndash; PLP &ndash; Rotterdam, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 2: Bremerhaven &ndash; Hamburg &ndash; CT St.Pete &ndash; FCT &ndash; PLP &ndash; Klaipeda &ndash; Hamburg &ndash; Bremerhaven, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 3: Rotterdam &ndash; FCT &ndash; PLP &ndash; Rotterdam &ndash; Antwerp &ndash; Hamburg, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 4: Hamburg &ndash; PLP &ndash; Rotterdam &ndash; Hamburg, </span></li>\n\t<li>\n\t\t<span lang="EN-US">Loop 5: Rotterdam &ndash; Hamburg &ndash; PLP &ndash; Hamburg &ndash; Rotterdam. </span></li>\n</ul>\n	<p>\n\tВладивостокский морской торговый порт (ВМТП ) ввел в эксплуатацию <a href="https://r.mail.yandex.net/url/MnXRSH2eimLptZIRjgGDpA,1343733181/www.seanews.ru%2Fnews%2Fnews%2Easp%3FnewsID%3D1015599" target="_blank">два новых STS Liebherr</a>, поставленных в апреле этого года из Ирландии.</p>\n<p>\n\tКраны проектировались специально с учетом технологических особенностей кордонной части причалов №14-15 контейнерного терминала ВМТП.</p>\n<p>\n\tТехника предназначена для обработки судов типа Panamax. Перегружатели на рельсовом ходу имеют грузоподъемность 60 тонн под спредером и максимальную производительность 40 контейнеров в час. Спредеры оборудованы системой twin lift, что позволяет обрабатывать одновременно два груженых 20&rsquo; контейнера.</p>\n<p>\n\tПокупка кранов обошлась ВМТП в сумму свыше 400 млн руб.</p>\n	<p>\n\t<span lang="EN-US">The common feeder operator Unifeeder has upgraded its services to Russia. The line has increased its capacity and frequency of calls at the terminals of St.Petersburg. </span></p>\n	<p>\n\tВладивостокский морской торговый порт (ВМТП ) ввел в эксплуатацию <a class="daria-goto-anchor" href="https://r.mail.yandex.net/url/MnXRSH2eimLptZIRjgGDpA,1343733181/www.seanews.ru%2Fnews%2Fnews%2Easp%3FnewsID%3D1015599" target="_blank"><span style="color:windowtext;text-decoration:none;">два новых STS Liebherr</span></a>, поставленных в апреле этого года из Ирландии.</p>\n
2	2012-08-06 18:29:58+04	t			The UFS feeder reviews its Black Sea services.	<p>\n\t&nbsp;Intra-Med feeder specialist United Feeder Services (UFS) will make a number of changes to its Turkey/</p>\n<p>\n\tBlack Sea feeder network<span lang="EN-US" style="font-size:12pt;">.</span></p>\n	fidernyij-operator-ufsizmenyaet-svoi-2012-08-06-092958	<p>\n\t&nbsp;Intra-Med feeder specialist United Feeder Services (UFS) will make a number of changes to its Turkey/</p>\n<p>\n\tBlack Sea feeder network, as follows:</p>\n<ul>\n\t<li>\n\t\tThe Turkey/Black Sea service will be operated by two vessels instead of one while frequency will be increased from one sailing every ten days to one every six.</li>\n\t<li>\n\t\tThe service will call at Mardas &ndash; Marport &ndash; Kumport &ndash; Constanta &ndash;Novorossiysk - Poti &ndash; Marport.</li>\n\t<li>\n\t\tTwo weekly Intra-Black Sea loop will be offered via slots from CMA CGM between Constantza and Novorossiysk as well as Constanta to Odessa and Varna.</li>\n\t<li>\n\t\tThe new intra-Marmara service will rotate weekly between a selection of the many container terminals bordering the Sea of Marmara: Kumport (Ambarli), Gemport (Gemlik), Kumport, Marport (Ambarli), Haydarpasa (Istanbul), Rodaport (Gemlik), Marport and back to Kumport.</li>\n\t<li>\n\t\tThe new Poti Shuttle will connect Kumport weekly with Poti.</li>\n</ul>\n	\N	\N	2012-08-02 09:00:00+04	1791	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	The UFS feeder reviews its Black Sea services.	Фидерный оператор UFSизменяет свои сервисы на Черном море	<p>\n\t&nbsp;Intra-Med feeder specialist United Feeder Services (UFS) will make a number of changes to its Turkey/</p>\n<p>\n\tBlack Sea feeder network, as follows:</p>\n<ul>\n\t<li>\n\t\tThe Turkey/Black Sea service will be operated by two vessels instead of one while frequency will be increased from one sailing every ten days to one every six.</li>\n\t<li>\n\t\tThe service will call at Mardas &ndash; Marport &ndash; Kumport &ndash; Constanta &ndash;Novorossiysk - Poti &ndash; Marport.</li>\n\t<li>\n\t\tTwo weekly Intra-Black Sea loop will be offered via slots from CMA CGM between Constantza and Novorossiysk as well as Constanta to Odessa and Varna.</li>\n\t<li>\n\t\tThe new intra-Marmara service will rotate weekly between a selection of the many container terminals bordering the Sea of Marmara: Kumport (Ambarli), Gemport (Gemlik), Kumport, Marport (Ambarli), Haydarpasa (Istanbul), Rodaport (Gemlik), Marport and back to Kumport.</li>\n\t<li>\n\t\tThe new Poti Shuttle will connect Kumport weekly with Poti.</li>\n</ul>\n	<p>\n\tСредиземноморский фидерный оператор UnitedFeederServices(UFS) производит ряд изменений на своих линейных сервисах на Черном море, которые будут выглядеть следующим образом:</p>\n<ul>\n\t<li>\n\t\t&nbsp;Сервис Turkey/BlackSeaбудет обслуживаться двумя судами, вместо одного как было ранее. При этом частота заходов увеличится с 10-дневной до 6-дневной.</li>\n\t<li>\n\t\tСервис будет заходить в порты Мардаш &ndash; Марпорт &ndash; Кумпорт &ndash; Констанца &ndash; Новороссийск &ndash; Поти - Марпорт.</li>\n\t<li>\n\t\tДва еженедельных сервиса на внутри-черноморских направлениях с использованием слота на судах CMA-CGM: один из Констанцы в Новороссийск, другой &ndash; из Констанцы в Одессу и Варну.</li>\n\t<li>\n\t\tНовый сервис intra-Marmaraбудет обслуживать перевозки между Турецкими портами Мраморного моря: Кумпорт (Амбарли), Гемпорт (Гемлик), Марпорт (Амбарли), Хайдарпаша (Стамбул), Родапорт (Гемлик), Марпорт и обратно в Кумпорт.</li>\n\t<li>\n\t\tНовый фидерный сервис Кумпорт &ndash; Поти - Кумпорт. .</li>\n</ul>\n	<p>\n\t&nbsp;Intra-Med feeder specialist United Feeder Services (UFS) will make a number of changes to its Turkey/</p>\n<p>\n\tBlack Sea feeder network<span lang="EN-US" style="font-size:12pt;">.</span></p>\n	<p>\n\tСредиземноморский фидерный оператор UnitedFeederServices(UFS) производит ряд изменений на своих линейных сервисах на Черном море.</p>\n
2	2012-08-20 19:42:15+04	t			A new direct service to St. Petersburg	<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of August, CMA CGM will extend its Europe-Caribbean Service (ECS) to St. Petersburg and</p>\n<p>\n\tTallinn.&nbsp;</p>\n	novyij-okeanskij-servis-na-2012-08-20-104215	<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of August, CMA CGM will extend its Europe-Caribbean Service (ECS) to St. Petersburg and</p>\n<p>\n\tTallinn. Consequently, the number of ships deployed will increase from six to</p>\n<p>\n\teight units of around 2,000 TEU each. The revised route will be: Rotterdam, Hamburg, St Petersburg,</p>\n<p>\n\tTallinn, Hamburg, Rotterdam, Antwerp, Le Havre, Kingston, Cartagena, Santo Tomas de Castilla, Puerto</p>\n<p>\n\tCortes, Puerto Limon, Kingston and back to Rotterdam.&nbsp;</p>\n<p>\n\tWith its ECS initiative, CMA CGM enters into direct competition to Maersk Line&rsquo;s Caribbean Express</p>\n<p>\n\t(CRX), which is currently the only other direct full container link between Central America and Russia&rsquo;s</p>\n<p>\n\tmain banana import port. Last June, MSC put a stop to its Central America-North Europe and direct Baltic</p>\n<p>\n\tlink, which it operated for about a year. Since early 2009, the Danish carrier has also called at St. Petersburg</p>\n<p>\n\twith its predominantly Ecuador-based Ecubex, which depending on the season, also includes Central</p>\n<p>\n\tAmerican ports en-route. However, the French line&rsquo;s direct deepsea box call at Tallinn (Estonia) is an absolute</p>\n<p>\n\tnovelty. As the ships it currently uses are not (more expensive) ice-class, it remains to be seen</p>\n<p>\n\twhether it will become a year-round operation.</p>\n	\N	\N	2012-08-17 09:00:00+04	1792	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	A new direct service to St. Petersburg	Новый океанский сервис на Санкт-Петербург	<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of August, CMA CGM will extend its Europe-Caribbean Service (ECS) to St. Petersburg and</p>\n<p>\n\tTallinn. Consequently, the number of ships deployed will increase from six to</p>\n<p>\n\teight units of around 2,000 TEU each. The revised route will be: Rotterdam, Hamburg, St Petersburg,</p>\n<p>\n\tTallinn, Hamburg, Rotterdam, Antwerp, Le Havre, Kingston, Cartagena, Santo Tomas de Castilla, Puerto</p>\n<p>\n\tCortes, Puerto Limon, Kingston and back to Rotterdam.&nbsp;</p>\n<p>\n\tWith its ECS initiative, CMA CGM enters into direct competition to Maersk Line&rsquo;s Caribbean Express</p>\n<p>\n\t(CRX), which is currently the only other direct full container link between Central America and Russia&rsquo;s</p>\n<p>\n\tmain banana import port. Last June, MSC put a stop to its Central America-North Europe and direct Baltic</p>\n<p>\n\tlink, which it operated for about a year. Since early 2009, the Danish carrier has also called at St. Petersburg</p>\n<p>\n\twith its predominantly Ecuador-based Ecubex, which depending on the season, also includes Central</p>\n<p>\n\tAmerican ports en-route. However, the French line&rsquo;s direct deepsea box call at Tallinn (Estonia) is an absolute</p>\n<p>\n\tnovelty. As the ships it currently uses are not (more expensive) ice-class, it remains to be seen</p>\n<p>\n\twhether it will become a year-round operation.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tС конца августа линия CMA CGM планирует продлить свой сервис ECS (Карибское море &ndash; Европа) до портов Санкт-Петербург и Таллинн.</p>\n<p>\n\tСоответственно, число задействованных судов будет увеличено с шести до девяти, вместимостью 2&nbsp;000 TEUкаждое.</p>\n<p>\n\tИзмененная ротация портов будет выглядеть следующим образом: Роттердам, Гамбург, Санкт-Петербург, Таллинн, Гамбург, Роттердам, Антверпен,</p>\n<p>\n\tГавр, Кингстон, Картахена, Санто Томас де Кастилья, Пуэрто Кортес, Пуэрто Лимон, Кингстон и обратно в Роттердам.</p>\n<p>\n\tПродлением сервиса ECSна Балтику CMACGMвступает в прямую конкуренцию с Карибским (CRX) сервисом Maersk, который до сих пор являлся единственной прямой океанской линией между портами Центральной Америки и Санкт-Петербургом. В июне другая линия - MSC&ndash; прекратила свой сервис из Центральной Америки в Северную Европу с его прямым заходом на Балтику, который она предлагала около года.</p>\n<p>\n\tРаботающий с начала 2009 &nbsp;года южноамериканский прямой сервис Ecubexлинии Maersk в период высокого сезона также предлагает попутные заходы в порты Центральной Америки. &nbsp;</p>\n<p>\n\tТем не менее, новый сервис линии CMA-CGM будет также заходить в Таллинн, что является абсолютным новшеством для балтийского рынка.</p>\n<p>\n\tПоскольку используемые в рамках ECSсуда не иеют ледового класса, вопрос круглогодичной работы сервиса на Балтике пока остается открытым.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tBy the end of August, CMA CGM will extend its Europe-Caribbean Service (ECS) to St. Petersburg and</p>\n<p>\n\tTallinn.&nbsp;</p>\n	<p>\n\tС конца августа линия&nbsp;CMA CGM&nbsp;планирует продлить свой сервис&nbsp;ECS (Карибское море&nbsp;&ndash;&nbsp;Европа)&nbsp;до портов Санкт-Петербург и Таллинн.</p>\n
2	2012-09-24 18:59:35+04	t			Третий сервис OOCL на Петербург	<p>\n\tOOCL открывает новый, третий сервис на Россию &ndash; SBX3. Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Бремерхафен. На обратном плече предусмотрен опциональный заход в Гдыню. В Петербурге суда будут заходить на ПКТ, первый судозаход намечен на 23 сентября.</p>\n	tretij-servis-oocl-na-2012-09-24-095935	<p>\n\tOOCL открывает новый, третий сервис на Россию &ndash; SBX3. Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Бремерхафен. На обратном плече предусмотрен опциональный заход в Гдыню. В Петербурге суда будут заходить на ПКТ, первый судозаход намечен на 23 сентября.</p>\n<p>\n\tНа SBX3 будут работать два судна ледового класса вместимостью по 1 тыс. TEU, &laquo;OOCLStPetersburg&raquo; и &laquo;ConmarBay&raquo;. Частота сервиса &ndash; еженедельно.</p>\n<p>\n\tОдновременно OOCL расширяет ротацию своего сервиса SBX2, вернув судозаход в Клайпеду. Этот порт временно обслуживался фидером Бремерхафен &ndash; Гамбург &ndash; Клайпеда, который теперь закрывается. Напомним, на SBX2 OOCL работает совместно с Team Lines.</p>\n	\N	\N	2012-09-21 09:00:00+04	1795	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	\N	Третий сервис OOCL на Петербург	\N	<p>\n\tOOCL открывает новый, третий сервис на Россию &ndash; SBX3. Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Бремерхафен. На обратном плече предусмотрен опциональный заход в Гдыню. В Петербурге суда будут заходить на ПКТ, первый судозаход намечен на 23 сентября.</p>\n<p>\n\tНа SBX3 будут работать два судна ледового класса вместимостью по 1 тыс. TEU, &laquo;OOCLStPetersburg&raquo; и &laquo;ConmarBay&raquo;. Частота сервиса &ndash; еженедельно.</p>\n<p>\n\tОдновременно OOCL расширяет ротацию своего сервиса SBX2, вернув судозаход в Клайпеду. Этот порт временно обслуживался фидером Бремерхафен &ndash; Гамбург &ndash; Клайпеда, который теперь закрывается. Напомним, на SBX2 OOCL работает совместно с Team Lines.</p>\n	\N	<p>\n\tOOCL открывает новый, третий сервис на Россию &ndash; SBX3. Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Бремерхафен. На обратном плече предусмотрен опциональный заход в Гдыню. В Петербурге суда будут заходить на ПКТ, первый судозаход намечен на 23 сентября.</p>\n
2	2012-10-11 03:47:13+04	t			Team Lines expands service to St.Petersburg	<p>\n\t<span lang="EN-US">From week 42 Team Lines is introducing the new rotation of the service to St.Petersburg. Henceforth the service RUS1 will include port Rauma in Finland. Calls there will be effected on Thursdays. </span></p>\n	team-lines-rasshiryaet-rotatsiyu-2012-10-10-184713	<p>\n\tFrom week 42 Team Lines is introducing the new rotation of the service to St.Petersburg. Henceforth the service RUS1 will include port Rauma in Finland. Calls there will be effected on Thursdays.</p>\n<p>\n\tThe new rotation will read as follows: &nbsp;Bremerhaven &ndash; Hamburg &ndash; Riga &ndash; Tallinn &ndash; St.Petersburg (FCT) &ndash; Rauma &ndash; Bremerhaven - Hamburg.</p>\n<p>\n\tThe service RUS2 (jointly run by Team Lines and OOCL) will make additional call at Kotka. The new rotation of RUS2 is going to be:&nbsp; Bremerhaven &ndash; Hamburg &ndash; Klaipeda &ndash; St.Petersburg (PLP) &ndash; Kotka &ndash; Hamburg.</p>\n<p>\n\tBesides of above Team Lines is about to launch a new service &ndash; SWE2, to serve Bremehaven &ndash; Hamburg &ndash; Havle (Sweden) &ndash; Bremerhaven.</p>\n	\N	\N	2012-10-10 09:00:00+04	1796	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Team Lines expands service to St.Petersburg	Team Lines расширяет ротацию на Петербург	<p>\n\tFrom week 42 Team Lines is introducing the new rotation of the service to St.Petersburg. Henceforth the service RUS1 will include port Rauma in Finland. Calls there will be effected on Thursdays.</p>\n<p>\n\tThe new rotation will read as follows: &nbsp;Bremerhaven &ndash; Hamburg &ndash; Riga &ndash; Tallinn &ndash; St.Petersburg (FCT) &ndash; Rauma &ndash; Bremerhaven - Hamburg.</p>\n<p>\n\tThe service RUS2 (jointly run by Team Lines and OOCL) will make additional call at Kotka. The new rotation of RUS2 is going to be:&nbsp; Bremerhaven &ndash; Hamburg &ndash; Klaipeda &ndash; St.Petersburg (PLP) &ndash; Kotka &ndash; Hamburg.</p>\n<p>\n\tBesides of above Team Lines is about to launch a new service &ndash; SWE2, to serve Bremehaven &ndash; Hamburg &ndash; Havle (Sweden) &ndash; Bremerhaven.</p>\n	<p>\n\tС 42 недели TeamLines работает на Петербург в новой ротации. В расписание сервиса RUS1 добавлен порт Раума в Финляндии. Заходы туда будут осуществляться по четвергам.</p>\n<p>\n\tНовая ротация: Бремерхафен &ndash; Гамбург &ndash; Рига &ndash; Таллин &ndash; Санкт-Петербург (ПКТ) &ndash; Раума &ndash; Бремерхафен &ndash; Гамбург.</p>\n<p>\n\tНа сервисе RUS2 (на нем TeamLinesработает совместно с OOCL) вводится дополнительный судозаход в Котку. Новая ротация: Бремерхафен &ndash; Гамбург &ndash; Клайпеда &ndash; Санкт-Петербург (ПЛП) &ndash; Котка &ndash; Гамбург.</p>\n<p>\n\tКроме того, TeamLines открывает новый сервис SWE2 Бремерхафен &ndash; Гамбург &ndash; Гавле (Швеция) &ndash; Бремерхафен.</p>\n	<p>\n\t<span lang="EN-US">From week 42 Team Lines is introducing the new rotation of the service to St.Petersburg. Henceforth the service RUS1 will include port Rauma in Finland. Calls there will be effected on Thursdays. </span></p>\n	<p>\n\tС 42 недели TeamLines работает на Петербург в новой ротации. В расписание сервиса RUS1 добавлен порт Раума в Финляндии. Заходы туда будут осуществляться по четвергам.</p>\n
2	2012-10-18 04:02:51+04	t			Arkas is upgrading services to Novorossiysk.	<p>\n\tArkas Line, short-sea operator in Mediterranean and Black Sea, has announced plans to split its East Med Russia Service (ERS) from November into two strings as follows.</p>\n	arkas-vnosit-sezonnyie-izmeneniya-2012-10-17-190251	<p>\n\tArkas Line, short-sea operator in Mediterranean and Black Sea, has announced plans to split its East Med Russia Service (ERS) from November into two strings as follows.</p>\n<p>\n\t&nbsp;ERS/ East-Med Russia Express &nbsp;Service will retain big part of its previous rotation: Alexandria &ndash; Mersin &ndash; Izmir &ndash; Marport &ndash; Novorossiysk &ndash; Marport&ndash; Alexandria. The vessels to be used : Jean Pierre A, Diana A of 1600 TEU each. The service will call at the NLE terminal in Novorossiysk on a weekly basis.</p>\n<p>\n\t&nbsp;ANS/ Anatalya Novo Service. The port rotation of the resumed ANS service will be Marport - Gemlik &ndash; Aliaga &ndash; Famagusta &ndash; Mersin &ndash; Antaliya &ndash; Evyap &ndash; Novorossiysk &ndash; Marport</p>\n<p>\n\tThe weekly service will be operated with two 1200 TEU vessels Martine A and Natalia A. The expected terminal of call in will be NLE.</p>\n	\N	\N	2012-10-18 09:00:00+04	1799	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Arkas is upgrading services to Novorossiysk.	Аркас вносит сезонные изменения в сервис на Новороссийск.	<p>\n\tArkas Line, short-sea operator in Mediterranean and Black Sea, has announced plans to split its East Med Russia Service (ERS) from November into two strings as follows.</p>\n<p>\n\t&nbsp;ERS/ East-Med Russia Express &nbsp;Service will retain big part of its previous rotation: Alexandria &ndash; Mersin &ndash; Izmir &ndash; Marport &ndash; Novorossiysk &ndash; Marport&ndash; Alexandria. The vessels to be used : Jean Pierre A, Diana A of 1600 TEU each. The service will call at the NLE terminal in Novorossiysk on a weekly basis.</p>\n<p>\n\t&nbsp;ANS/ Anatalya Novo Service. The port rotation of the resumed ANS service will be Marport - Gemlik &ndash; Aliaga &ndash; Famagusta &ndash; Mersin &ndash; Antaliya &ndash; Evyap &ndash; Novorossiysk &ndash; Marport</p>\n<p>\n\tThe weekly service will be operated with two 1200 TEU vessels Martine A and Natalia A. The expected terminal of call in will be NLE.</p>\n	<p>\n\tЛиния Arkas, оперирующая в Средиземном и Черном морях, объявила о планах с ноября разделить свой сервис EastMedRussiaService (ERS) на два.</p>\n<p>\n\t&nbsp;Ротация действующего сервиса ERS/ East-MedRussiaExpress &nbsp;останется почти без изменений: Александрия &ndash; Мерсин &ndash; Измир &ndash; Марпорт &ndash; Новороссийск &ndash; Марпорт &ndash; Александрия.</p>\n<p>\n\tНа сервисе планируется использовать два судна - JeanPierreA и DianaAвместимостью 1600 TEU каждое. Сервис будет заходить в Новороссийске на терминал НЛЭ на еженедельной основе.</p>\n<p>\n\t&nbsp;Одновременно будет возобновлен приостановленный в июне сервис ANS/ AnatalyaNovoService. Ротация портов на нем будет Марпорт &ndash; Гемлик &ndash; Алиага &ndash; Фамагуста &ndash; Мерсин &ndash; Анталия &ndash; Эвьяп &ndash; Новороссийск &ndash; Марпорт.</p>\n<p>\n\tНедельный сервис будет обеспечиваться двумя судами по 1200 TEUMartineAи NataliaA. Ожидаемый терминал захода в Новороссийске будет НЛЭ.</p>\n	<p>\n\tArkas Line, short-sea operator in Mediterranean and Black Sea, has announced plans to split its East Med Russia Service (ERS) from November into two strings as follows.</p>\n	<p>\n\tЛиния Arkas, оперирующая в Средиземном и Черном морях, объявила о планах с ноября разделить свой сервис EastMedRussiaService (ERS) на два.</p>\n
2	2012-10-25 21:52:51+04	t			MSC is launching Turkish reefer service to Novorossiysk	<p>\n\tMSC is launching seasonal reefer service between ports of Turkey and Novorossiysk. Service rotation looks as follows. Antliya (sailing on Fri) &ndash; Istanbul (sailing on Mon) &ndash; Novorossiysk (arrival on Tue) &ndash; Istanbul &nbsp;&ndash; Antaliya. The weekly service will be operated with two container ships:&nbsp; &nbsp;MSC Edith (1388 TEU) and San Vicente (1512 TEU), each equipped with 300 reefer plugs.</p>\n	msc-otkryivaet-turetskij-refservis-2012-10-25-125251	<p>\n\tMSC is launching seasonal reefer service between ports of Turkey and Novorossiysk. Service rotation looks as follows. Antliya (sailing on Fri) &ndash; Istanbul (sailing on Mon) &ndash; Novorossiysk (arrival on Tue) &ndash; Istanbul &nbsp;&ndash; Antaliya. The weekly service will be operated with two container ships:&nbsp; &nbsp;MSC Edith (1388 TEU) and San Vicente (1512 TEU), each equipped with 300 reefer plugs.</p>\n<p>\n\tThe new service will be calling at the NLE terminal in Novorossiysk. The first voyage sailed from Antatiya today, the first arrival to Novorossiysk is expected by m/v MSC Edith &nbsp;on Oct. 23rd.</p>\n<p>\n\tTransit time from Antaliya to Novorossiysk will make up four days.</p>\n<p>\n\tThe MSC expects that service will mainly compete with multimodal transportation of perishables by trucks and ferries via port Samsun (Turkey). &nbsp;The new service would complement the since four years established Egypt&amp;Israel to Novorossiysk express, which in the coming reefer season will cover ports Alexandria &ndash; Ashdod &ndash; Novorossiysk &ndash; Alexandria with the expected transit time to Novorossiysk &nbsp;five and four days respectively.</p>\n<p>\n\tEgypt &amp; Israel service is usually carrying pomegranates, citrus, potatoes, pepper and dry cargo. The new Turkish service will cater for the transportation of citrus, tomatoes, cucumbers as well as other miscellaneous dry cargo. The return voyages will deliver various Russian exports to Turkey, mainly paper.</p>\n	\N	\N	2012-10-19 09:00:00+04	1801	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MSC is launching Turkish reefer service to Novorossiysk	MSC открывает турецкий рефсервис на Новороссийск	<p>\n\tMSC is launching seasonal reefer service between ports of Turkey and Novorossiysk. Service rotation looks as follows. Antliya (sailing on Fri) &ndash; Istanbul (sailing on Mon) &ndash; Novorossiysk (arrival on Tue) &ndash; Istanbul &nbsp;&ndash; Antaliya. The weekly service will be operated with two container ships:&nbsp; &nbsp;MSC Edith (1388 TEU) and San Vicente (1512 TEU), each equipped with 300 reefer plugs.</p>\n<p>\n\tThe new service will be calling at the NLE terminal in Novorossiysk. The first voyage sailed from Antatiya today, the first arrival to Novorossiysk is expected by m/v MSC Edith &nbsp;on Oct. 23rd.</p>\n<p>\n\tTransit time from Antaliya to Novorossiysk will make up four days.</p>\n<p>\n\tThe MSC expects that service will mainly compete with multimodal transportation of perishables by trucks and ferries via port Samsun (Turkey). &nbsp;The new service would complement the since four years established Egypt&amp;Israel to Novorossiysk express, which in the coming reefer season will cover ports Alexandria &ndash; Ashdod &ndash; Novorossiysk &ndash; Alexandria with the expected transit time to Novorossiysk &nbsp;five and four days respectively.</p>\n<p>\n\tEgypt &amp; Israel service is usually carrying pomegranates, citrus, potatoes, pepper and dry cargo. The new Turkish service will cater for the transportation of citrus, tomatoes, cucumbers as well as other miscellaneous dry cargo. The return voyages will deliver various Russian exports to Turkey, mainly paper.</p>\n	<p>\n\tMSC запускает сезонный рефсервис между портами Турции и Новороссийском. Ротация: Анталья (выход по пятницам) &ndash; Стамбул (выход по понедельникам) &ndash; Новороссийск (прибытие во вторник) &ndash; Стамбул &ndash; Анталья. Сервис будет еженедельным. Обслуживать его будут два судна &ndash; MSC Edith (1388 TEU) и San Vicente (1512 TEU), на каждом имеется примерно 300 рефрозеток.</p>\n<p>\n\tОбслуживаться сервис будет на терминале Новорослесэкспорт. Первый рейс вышел из Антальи сегодня, первый судозаход в Новороссийск контейнеровоза &laquo;MSC Edith&raquo; намечен на 23 октября. Время транзита из Антальи на Новороссийск составит 4 дня.</p>\n<p>\n\tВ MSC рассчитывают, что сервис составит конкуренцию существующей мультимодальной схеме перевозок скоропортящихся грузов автотранспортом и паромом через порт Самсун. Он станет дополнением к существующему уже четыре года экспрессу Egypt&amp;Israel to Novorossiysk, который в начинающийся рефсезон будет работать в ротации Александрия &ndash; Ашдод &ndash; Новороссийск &ndash; Александрия с ожидаемым транзитным временем до Новороссийска 5 и 4 дня соответственно.</p>\n<p>\n\tЕгипетско-израильский сервис традиционно используется отправителями для перевозки граната, цитрусовых, картофеля, перца и сухих грузов. Новый турецкий сервис будет обслуживать импорт цитрусовых, а также томатов, огурцов и сухих грузов. Обратная загрузка также планируется, в частности, ожидается, что в экспорте в Турцию пойдет бумага.</p>\n	<p>\n\tMSC is launching seasonal reefer service between ports of Turkey and Novorossiysk. Service rotation looks as follows. Antliya (sailing on Fri) &ndash; Istanbul (sailing on Mon) &ndash; Novorossiysk (arrival on Tue) &ndash; Istanbul &nbsp;&ndash; Antaliya. The weekly service will be operated with two container ships:&nbsp; &nbsp;MSC Edith (1388 TEU) and San Vicente (1512 TEU), each equipped with 300 reefer plugs.</p>\n	<p>\n\tMSC запускает сезонный рефсервис между портами Турции и Новороссийском. Ротация: Анталья (выход по пятницам) &ndash; Стамбул (выход по понедельникам) &ndash; Новороссийск (прибытие во вторник) &ndash; Стамбул &ndash; Анталья. Сервис будет еженедельным. Обслуживать его будут два судна &ndash; MSC Edith (1388 TEU) и San Vicente (1512 TEU), на каждом имеется примерно 300 рефрозеток.</p>\n
2	2011-12-08 02:38:46+04	t			CMA CGM and MSC announced the formation of a broad-based partnership	Two of the world’s largest carriers, CMA CGM and\nMSC, announced the formation of a broad-based\npartnership agreement spanning several corridors,\nincluding the Far East-North Europe, Far East\nSouthern Africa and all South American trades.	partnerstvo-cma-cgm-i-msc-2011-12-07-163846	<p>Two of the world’s largest carriers, CMA CGM and\nMSC, announced the formation of a broad-based\npartnership agreement spanning several corridors,\nincluding the Far East-North Europe, Far East\nSouthern Africa and all South American trades.\nCollaboration between the two is not new, considering\ntheir close cooperation on the Transpacific,\ntogether with Maersk Line, and several Latin\nAmerica services, amongst others.\n<p>\nThe partnership will allow CMA CGM and MSC to deploy their best ships, while increasing the number of port calls and frequency of sailings.	\N	\N	2011-12-07 10:00:00+04	1726	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	CMA CGM and MSC announced the formation of a broad-based partnership	Партнерство CMA-CGM и MSC	<p>Two of the world’s largest carriers, CMA CGM and\nMSC, announced the formation of a broad-based\npartnership agreement spanning several corridors,\nincluding the Far East-North Europe, Far East\nSouthern Africa and all South American trades.\nCollaboration between the two is not new, considering\ntheir close cooperation on the Transpacific,\ntogether with Maersk Line, and several Latin\nAmerica services, amongst others.\n<p>\nThe partnership will allow CMA CGM and MSC to deploy their best ships, while increasing the number of port calls and frequency of sailings.	<p>\n\tДва крупнейших линейных перевозчика CMA-CGM и MSC сообщили о создании широкого партнёрства на ключевых транспортных коридорах, включая Дальний Восток &ndash; Северная Европа, Дальний Восток &ndash; Южная Африка, а также на всех южноамериканских трейдах. Две линии сотрудничают не впервые, учитывая их тесное взаимодействие на транс-тихоокеанском направлении вместе с Maersk, и в рамках латиноамериканских сервисов.</p>\n<p>\n\tПартнёрство позволит CMA-CGM и MSC максимально задействовать свои новые крупнотоннажные суда, увеличив при этом число портов и частоту заходов.</p>\n	Two of the world’s largest carriers, CMA CGM and\nMSC, announced the formation of a broad-based\npartnership agreement spanning several corridors,\nincluding the Far East-North Europe, Far East\nSouthern Africa and all South American trades.	<p>\n\tДве линии сотрудничают не впервые, учитывая их тесное взаимодействие на транс-тихоокеанском направлении вместе с Maersk, и в рамках латиноамериканских сервисов.</p>\n
2	2012-11-30 21:25:43+04	t			Unifeeder announced Russia service upgrade.	<p>\n\tUnifeeder intends to increase frequency of its calls at Ust-Luga port (St. Petersburg region) to twice a week.</p>\n	unifeeder-soobschil-ob-izmeneniyah-2012-11-30-112543	<p>\n\tUnifeeder intends to increase frequency of its calls at Ust-Luga port (St. Petersburg region) to twice a week.</p>\n<p>\n\tUst-Luga will be served with the Loop 2 (Rotterdam &ndash; Hamburg &ndash; Ust-Luga (Wed) &ndash; FCT &ndash; PLP &ndash; Hamburg) and Loop 5 (Antwerp &ndash; Rotterdam &ndash; Ust-Luga (Sun) &ndash; FCT &ndash; PLP &ndash; Hamburg) services of Unifeeder.</p>\n<p>\n\t&nbsp;Other changes in Russian services of the feeder specialist include adding Kotka at Loop 3 (Bremerhaven &ndash; Hamburg &ndash; A4 St.Pete &ndash; FCT &ndash; PLP &ndash; Kotka (Fri) &ndash; Hamburg &ndash; Bremerhaven) for empty units, and suspension of calls at Klaipeda.</p>\n<p>\n\tThe changes must into effect from week 49.</p>\n	\N	\N	2012-11-26 10:00:00+04	1805	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Unifeeder announced Russia service upgrade.	Unifeeder сообщил об изменениях на своих российских сервисах.	<p>\n\tUnifeeder intends to increase frequency of its calls at Ust-Luga port (St. Petersburg region) to twice a week.</p>\n<p>\n\tUst-Luga will be served with the Loop 2 (Rotterdam &ndash; Hamburg &ndash; Ust-Luga (Wed) &ndash; FCT &ndash; PLP &ndash; Hamburg) and Loop 5 (Antwerp &ndash; Rotterdam &ndash; Ust-Luga (Sun) &ndash; FCT &ndash; PLP &ndash; Hamburg) services of Unifeeder.</p>\n<p>\n\t&nbsp;Other changes in Russian services of the feeder specialist include adding Kotka at Loop 3 (Bremerhaven &ndash; Hamburg &ndash; A4 St.Pete &ndash; FCT &ndash; PLP &ndash; Kotka (Fri) &ndash; Hamburg &ndash; Bremerhaven) for empty units, and suspension of calls at Klaipeda.</p>\n<p>\n\tThe changes must into effect from week 49.</p>\n	<p>\n\tФидерный оператор <span lang="EN-US">Unifeeder </span>планирует увеличить частоту судозаходов на терминал Усть-Луга до двух раз в неделю.</p>\n<p>\n\tУсть-Луга включена в сервисы <span lang="EN-US">Loop</span> 2 (Роттердам &ndash; Гамбург &ndash; Усть-Луга (по средам) &ndash; ПКТ &ndash; ПЛП &ndash; Гамбург) и <span lang="EN-US">Loop</span> 5 (Антверпен &ndash; Роттердам &ndash; Усть-Луга (по воскресеньям) &ndash; ПКТ &ndash; ПЛП &ndash; Гамбург).</p>\n<p>\n\tПрочие изменения в российских сервисах <span lang="EN-US">Unifeeder</span> предполагают добавление захода в порт Котка в рамках сервиса <span lang="EN-US">Loop</span> 3 (Бремерхафен &ndash; Гамбург &ndash; Конт.терминал СПБ &ndash; ПКТ &ndash; ПЛП &ndash; Котка (по пятницам) &ndash; Гамбург &ndash; Бремерхафен) для эвакуации порожних, а также &ndash; прекращение заходов в порт Клайпеда.</p>\n<p>\n\tИзменения в расписании линии должны вступить в силу с 49 недели.</p>\n	<p>\n\tUnifeeder intends to increase frequency of its calls at Ust-Luga port (St. Petersburg region) to twice a week.</p>\n	<p>\n\tФидерный оператор <span lang="EN-US">Unifeeder </span>планирует увеличить частоту судозаходов на терминал Усть-Луга до двух раз в неделю.</p>\n
2	2011-08-23 20:21:09+04	t			Партнёрство Arkas с Turkon Line	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n	partnyorstvo-arkas-s-turkon-2011-08-23-112109	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n<p>\n\t<b>Расписание EMELS</b></p>\n<p>\n\tЧастота рейсов &ndash; 8 суток<br />\n\tПо одному судну от Arkas и Turkon, 1 900 TEU каждое<br />\n\tСтамбул/Эвьяп &ndash; Гемлик &ndash; Стамбул/Марпорт &ndash; Измир &ndash; Мерсин &ndash; Порт Саид &ndash; Дамьетта &ndash; Александрия &ndash; Бейрут &ndash; Латтакия &ndash; Стамбул/Эвьяп</p>\n<p>\n\t<b>Расписание ERS</b></p>\n<p>\n\tЧастота рейсов &ndash; 5 суток<br />\n\t4 судна Arkas по 1600 TEU<br />\n\tСтамбул/Марпорт &ndash; Новороссийск &ndash; Стамбул/Марпорт - Гемлик &ndash; Измир/Алиага &ndash; Александрия &ndash; Фамагуста &ndash; Мерсин &ndash; Измир/Алиага &ndash; Стамбул/Марпорт</p>\n	\N	\N	2011-08-18 09:00:00+04	1720	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Партнёрство Arkas с Turkon Line	Партнёрство Arkas с Turkon Line	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n<p>\n\t<b>Расписание EMELS</b></p>\n<p>\n\tЧастота рейсов &ndash; 8 суток<br />\n\tПо одному судну от Arkas и Turkon, 1 900 TEU каждое<br />\n\tСтамбул/Эвьяп &ndash; Гемлик &ndash; Стамбул/Марпорт &ndash; Измир &ndash; Мерсин &ndash; Порт Саид &ndash; Дамьетта &ndash; Александрия &ndash; Бейрут &ndash; Латтакия &ndash; Стамбул/Эвьяп</p>\n<p>\n\t<b>Расписание ERS</b></p>\n<p>\n\tЧастота рейсов &ndash; 5 суток<br />\n\t4 судна Arkas по 1600 TEU<br />\n\tСтамбул/Марпорт &ndash; Новороссийск &ndash; Стамбул/Марпорт - Гемлик &ndash; Измир/Алиага &ndash; Александрия &ndash; Фамагуста &ndash; Мерсин &ndash; Измир/Алиага &ndash; Стамбул/Марпорт</p>\n	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n<p>\n\t<b>Расписание EMELS</b></p>\n<p>\n\tЧастота рейсов &ndash; 8 суток<br />\n\tПо одному судну от Arkas и Turkon, 1 900 TEU каждое<br />\n\tСтамбул/Эвьяп &ndash; Гемлик &ndash; Стамбул/Марпорт &ndash; Измир &ndash; Мерсин &ndash; Порт Саид &ndash; Дамьетта &ndash; Александрия &ndash; Бейрут &ndash; Латтакия &ndash; Стамбул/Эвьяп</p>\n<p>\n\t<b>Расписание ERS</b></p>\n<p>\n\tЧастота рейсов &ndash; 5 суток<br />\n\t4 судна Arkas по 1600 TEU<br />\n\tСтамбул/Марпорт &ndash; Новороссийск &ndash; Стамбул/Марпорт - Гемлик &ndash; Измир/Алиага &ndash; Александрия &ndash; Фамагуста &ndash; Мерсин &ndash; Измир/Алиага &ndash; Стамбул/Марпорт</p>\n	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n	<p>\n\tС сентября 2011 линия ARKAS входит в партнёрство с Turkon Line по совместному оперированию сервиса EMELS (East Med Direct Egypt &amp; Lebanon &amp; Syria).&nbsp;Одновременно компания сокращает маршрут и увеличивает частоту на сервисе EMR (East Med/Russia), за счет исключения большинства портов захода в Леванте, которые будут обслуживаться совместно с Turkon.</p>\n
2	2011-09-07 07:47:05+04	t			Новый сервис Maersk на порт Восточый	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports).</p>\n	novyij-servis-maersk-na-2011-09-06-224705	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports). Судно Maersk Drammen, вместимостью 4 тыс. 389 TEU, совершило первый судозаход на терминал ВСК, далее суда нового сервиса будут заходить в терминал еженедельно. Ротация сервиса: Лазаро Карденас (Мексика) &ndash; Бальбоа (Панама) &ndash; Буэнавентура (Колумбия) &ndash; Лазаро Карденас (Мексика) &ndash; Восточный (Россия) &ndash; Циндао (Китай) &ndash; Пусан (Ю. Корея) &ndash; Кванъян (Ю. Корея) &ndash; Иокогама (Япония) &ndash; Лазаро Карденас (Мексика).</p>\n	\N	\N	2011-08-29 09:00:00+04	1725	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Новый сервис Maersk на порт Восточый	Новый сервис Maersk на порт Восточый	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports). Судно Maersk Drammen, вместимостью 4 тыс. 389 TEU, совершило первый судозаход на терминал ВСК, далее суда нового сервиса будут заходить в терминал еженедельно. Ротация сервиса: Лазаро Карденас (Мексика) &ndash; Бальбоа (Панама) &ndash; Буэнавентура (Колумбия) &ndash; Лазаро Карденас (Мексика) &ndash; Восточный (Россия) &ndash; Циндао (Китай) &ndash; Пусан (Ю. Корея) &ndash; Кванъян (Ю. Корея) &ndash; Иокогама (Япония) &ndash; Лазаро Карденас (Мексика).</p>\n	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports). Судно Maersk Drammen, вместимостью 4 тыс. 389 TEU, совершило первый судозаход на терминал ВСК, далее суда нового сервиса будут заходить в терминал еженедельно. Ротация сервиса: Лазаро Карденас (Мексика) &ndash; Бальбоа (Панама) &ndash; Буэнавентура (Колумбия) &ndash; Лазаро Карденас (Мексика) &ndash; Восточный (Россия) &ndash; Циндао (Китай) &ndash; Пусан (Ю. Корея) &ndash; Кванъян (Ю. Корея) &ndash; Иокогама (Япония) &ndash; Лазаро Карденас (Мексика).</p>\n	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports).</p>\n	<p>\n\tНовый регулярный морской контейнерный сервис компании Maersk &ndash; &laquo;AC-3&raquo; начал функционировать на контейнерном терминале ООО &laquo;Восточная стивидорная компания&raquo; (Global Ports).</p>\n
2	2013-02-07 18:02:13+04	t			Containerships is starting calls at Ust-Luga.	On Jan 29th the first Containerships’ vessel m/v Containerships IV made maiden call at terminal Yug-2 in Ust-Luga port. Total discharge from this call was 17 TEU, which arrived from Teesport and Rotterdam.\n	containerships-nachinaet-zahodyi-v-2013-02-07-080213	<p>\n\t&nbsp;</p>\n<p>\n\tOn Jan 29<sup>th</sup>&nbsp;the first Containerships&rsquo; vessel m/v Containerships IV made maiden call at terminal Yug-2 in Ust-Luga port. Total discharge from this call was 17 TEU, which arrived from Teesport and Rotterdam.</p>\n<p>\n\t&ldquo;The perspective cooperation between Ust-Luga port and Containerships will move towards regular liner service of the carrier from Northern Europe and UK&rdquo;, - believe in the port of Ust-Luga.</p>\n<p>\n\tThe regional director of Containerships Mr. Dmitriy Komov informed that call at the new terminal means access to more cargo and expansion of geographic coverage.</p>\n<p>\n\tThe maiden call at Ust-Luga delivered three flat-containers and seven 40&rsquo;s.</p>\n<p>\n\tSo far Containerships have been calling in Russia at Mobi Dik terminal in Kronstadt only.&nbsp; For a long time Containerships also was the single user of the terminal.</p>\n<p>\n\tIn winter 2011 it was joined in Mobi Dik by Maersk, Unifeeder and Hyundai Merchant Marine. Maersk and Unifeeder called at this terminal in the beginning of 2011 (due to sever congestion in the main port of Saint-Petersburg at that time). &nbsp;HMM continued calls at Mobi Dik into 2012, having made it is main gateway terminal in St.Petersburg area. In 2011 Containerships accounted for 84% of Mobi Dik turnover, while the share of Maersk was 5,4%, Unifeeder - 2,6%, Hyundai Merchant Marine - 8%.</p>\n<p>\n\tIn 2012 the turnover Containerships in St.Petersburg big port went down by 17%.</p>\n	\N	\N	2013-01-30 10:00:00+04	1807	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Containerships is starting calls at Ust-Luga.	Containerships начинает заходы в Усть-Лугу.	<p>\n\t&nbsp;</p>\n<p>\n\tOn Jan 29<sup>th</sup>&nbsp;the first Containerships&rsquo; vessel m/v Containerships IV made maiden call at terminal Yug-2 in Ust-Luga port. Total discharge from this call was 17 TEU, which arrived from Teesport and Rotterdam.</p>\n<p>\n\t&ldquo;The perspective cooperation between Ust-Luga port and Containerships will move towards regular liner service of the carrier from Northern Europe and UK&rdquo;, - believe in the port of Ust-Luga.</p>\n<p>\n\tThe regional director of Containerships Mr. Dmitriy Komov informed that call at the new terminal means access to more cargo and expansion of geographic coverage.</p>\n<p>\n\tThe maiden call at Ust-Luga delivered three flat-containers and seven 40&rsquo;s.</p>\n<p>\n\tSo far Containerships have been calling in Russia at Mobi Dik terminal in Kronstadt only.&nbsp; For a long time Containerships also was the single user of the terminal.</p>\n<p>\n\tIn winter 2011 it was joined in Mobi Dik by Maersk, Unifeeder and Hyundai Merchant Marine. Maersk and Unifeeder called at this terminal in the beginning of 2011 (due to sever congestion in the main port of Saint-Petersburg at that time). &nbsp;HMM continued calls at Mobi Dik into 2012, having made it is main gateway terminal in St.Petersburg area. In 2011 Containerships accounted for 84% of Mobi Dik turnover, while the share of Maersk was 5,4%, Unifeeder - 2,6%, Hyundai Merchant Marine - 8%.</p>\n<p>\n\tIn 2012 the turnover Containerships in St.Petersburg big port went down by 17%.</p>\n	<p>\n\t29&nbsp;января на МПК Юг&nbsp;2&nbsp;впервые пришел контейнеровоз&nbsp;Containerships &laquo;Containerships VI&raquo;. C&nbsp;борта судна выгрузили&nbsp;17 TEU.&nbsp;Груз пришел из портов Тизпорт и Роттердам.</p>\n<p>\n\t&laquo;В перспективе сотрудничества между ОАО &laquo;МТП Усть-Луга&raquo; и Containerships - развитие регулярного сервиса линии из портов северной Европы и Англии&raquo;, - отметили в МТП Усть-Луга.</p>\n<p>\n\tДиректор по российскому региону&nbsp;Containerships Дмитрий Комов сообщил, что для линии это расширение географии и новый груз. В Усть-Луге в первый заход было выгружено три флет-контейнера и семь 40 - футовых.</p>\n<p>\n\tРаньше Containerships ходил в России только на один терминал - &laquo;Моби Дик&raquo;, и долгое время был единственной линией на этом терминале.</p>\n<p>\n\tЗимой 2011 года к нему присоединились Maersk, Unifeeder и Hyundai Merchant Marine. Maersk и Unifeeder заходили на терминал только в начале 2011 года, когда в порту сохранялась сложная ледовая обстановка. HMM продолжил заходы и в 2012 году, сделав &laquo;Моби Дик&raquo; своим якорным терминалом. В 2011 году на долю Containerships пришлось 84% оборота &laquo;Моби Дика&raquo;, Maersk занял 5,4%, Unifeeder - 2,6%, Hyundai Merchant Marine - 8%.</p>\n<p>\n\tПо итогам 2012 года оборот Containerships в Петербурге снизился к показателю 2011 года на&nbsp;17%.</p>\n	On Jan 29th the first Containerships’ vessel m/v Containerships IV made maiden call at terminal Yug-2 in Ust-Luga port. Total discharge from this call was 17 TEU, which arrived from Teesport and Rotterdam.\n	29 января на МПК Юг 2 впервые пришел контейнеровоз Containerships «Containerships VI». C борта судна выгрузили 17 TEU. Груз пришел из портов Тизпорт и Роттердам.\n
2	2011-12-19 01:01:15+04	t			Maersk Line’s WCSA-North Europe Ecubex news	<p>\n\tMaersk Line&rsquo;s WCSA-North Europe Ecubex will operate as an almost dedicated Guayaquil-St. Petersburg shuttle, wayporting at Balboa (eastbound) and Moin (westbound) only.</p>\n	servis-ecubex-linii-maersk-2011-12-18-150115	<p>\n\tMaersk Line&rsquo;s WCSA-North Europe Ecubex will operate as an almost dedicated Guayaquil-St. Petersburg shuttle, wayporting at Balboa (eastbound) and Moin (westbound) only.</p>\n<p>\n\tThe new set-up reads: - Ecubex - 6x 2,600 TEU - St. Petersburg, Moin (Puerto Limon), Guayaquil, Balboa and back to St. Petersburg Sailing almost straight from Guayaquil (Ecuador) to St. Petersburg will further improve its transit-time from the main banana source to the main destination making it difficult for conventional reefer ships to compete.</p>\n	\N	\N	2011-12-18 10:00:00+04	1730	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Line’s WCSA-North Europe Ecubex news	Сервис ECUBEX линии Maersk сокращает число портов захода	<p>\n\tMaersk Line&rsquo;s WCSA-North Europe Ecubex will operate as an almost dedicated Guayaquil-St. Petersburg shuttle, wayporting at Balboa (eastbound) and Moin (westbound) only.</p>\n<p>\n\tThe new set-up reads: - Ecubex - 6x 2,600 TEU - St. Petersburg, Moin (Puerto Limon), Guayaquil, Balboa and back to St. Petersburg Sailing almost straight from Guayaquil (Ecuador) to St. Petersburg will further improve its transit-time from the main banana source to the main destination making it difficult for conventional reefer ships to compete.</p>\n	<p>\n\tСервис ECUBEX линии Maersk, работающий на направлении Зап.побережье Южной Америки &ndash; Северная Европа, сокращает число портов захода, повышая свою специализацию на направлении Гуаякиль (Эквадор) &ndash; Санкт-Петербург.</p>\n<p>\n\tПромежуточными портами захода сервиса остаются Балбоа, Панама (в восточном направлении) и Моин, Коста Рика (в западном). Измененный сервис будет выглядеть следующим образом: 6 х 2500 TEU Санкт &ndash; Петербург &ndash; Моин (Пуэрто Лимон) &ndash; Гуаякиль &ndash; Бальбоа и обратно в Санкт-Петербург Почти прямые рейсы из Гаякиля в Санкт-Петербург должны максимально сократить транзитное время из основного региона производства бананов в основной регион их потребления, существенно снижая конкурентоспособность на этом направлении неконтейнерных судов.</p>\n	<p>\n\tMaersk Line&rsquo;s WCSA-North Europe Ecubex will operate as an almost dedicated Guayaquil-St. Petersburg shuttle, wayporting at Balboa (eastbound) and Moin (westbound) only.</p>\n	<p>\n\tСервис ECUBEX линии Maersk, работающий на направлении Зап.побережье Южной Америки &ndash; Северная Европа, сокращает число портов захода, повышая свою специализацию на направлении Гуаякиль (Эквадор) &ndash; Санкт-Петербург.</p>\n
2	2012-01-19 03:07:06+04	t			Evergreen to Partner With CKYH Carrier Alliance	Evergreen Line is joining forces with the CKYH Alliance of Cosco, K-Line, Yang Ming and Hanjin Shipping on the Asia-Europe route in the latest partnership aimed at countering Maersk Line’s bid to dominate the world’s largest ocean container market.	partnyorstvo-chky-alyansa-i-2012-01-18-170706	<p>Evergreen Line is joining forces with the CKYH Alliance of Cosco, K-Line, Yang Ming and Hanjin Shipping on the Asia-Europe route in the latest partnership aimed at countering Maersk Line’s bid to dominate the world’s largest ocean container market.\n<p>\nThe five Asian carriers will operate 12 weekly services between Asia, the Mediterranean and North Europe, with ships of 8,000 to 13,000 20-foot equivalent units capacity starting in the second quarter of 2012.\n<p>\n“All parties intend to enhance highest frequency of service loops, expedition of delivery terms and full scale of port coverage in their services and agreed to strengthen co-operation among one another in Asia-Europe and Asia-Mediterranean trade lanes,“ the carriers said.\n<p>\nTaiwan’s Evergreen will not, however, become a member of the CKYH group, also known as the Green Alliance.\n<p>\n“Although Evergreen will not be joining CKYH, the carriers will co-ordinate with each other to provide more intensive sailings to the level of eight service loops from Asian ports to northern European base ports, and four service loops from Asian ports to Mediterranean ports every week,” the carriers said.\n<p>\nSource: JoC	\N	\N	2011-12-28 10:00:00+04	1733	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Evergreen to Partner With CKYH Carrier Alliance	Партнёрство CHKY альянса и  Evergreen	<p>Evergreen Line is joining forces with the CKYH Alliance of Cosco, K-Line, Yang Ming and Hanjin Shipping on the Asia-Europe route in the latest partnership aimed at countering Maersk Line’s bid to dominate the world’s largest ocean container market.\n<p>\nThe five Asian carriers will operate 12 weekly services between Asia, the Mediterranean and North Europe, with ships of 8,000 to 13,000 20-foot equivalent units capacity starting in the second quarter of 2012.\n<p>\n“All parties intend to enhance highest frequency of service loops, expedition of delivery terms and full scale of port coverage in their services and agreed to strengthen co-operation among one another in Asia-Europe and Asia-Mediterranean trade lanes,“ the carriers said.\n<p>\nTaiwan’s Evergreen will not, however, become a member of the CKYH group, also known as the Green Alliance.\n<p>\n“Although Evergreen will not be joining CKYH, the carriers will co-ordinate with each other to provide more intensive sailings to the level of eight service loops from Asian ports to northern European base ports, and four service loops from Asian ports to Mediterranean ports every week,” the carriers said.\n<p>\nSource: JoC	<p>Контейнерные линии продолжаю консолидировать ресурсы, флот и сервисы. О партнерстве на направлениях Азия – Европа и Азия – Средиземноморье объявили CKYH Alliance (входят COSCO, "K" Line, Yang Ming, Hanjin Shipping) и Evergreen.\n<p>\nСовместная работа начнется во втором квартале 2012 года. В сумме у линий-членов соглашения будет задействовано 8 сервисов между портами Азии и Северной Европы и 4 сервиса между портами Азии и Средиземного моря. На них работают суда вместимостью от 8 тыс. до 13 тыс. TEU.\n<p>\n \n\nИсточник: Seanews	Evergreen Line is joining forces with the CKYH Alliance of Cosco, K-Line, Yang Ming and Hanjin Shipping on the Asia-Europe route in the latest partnership aimed at countering Maersk Line’s bid to dominate the world’s largest ocean container market.	Контейнерные линии продолжаю консолидировать ресурсы, флот и сервисы. О партнерстве на направлениях Азия – Европа и Азия – Средиземноморье объявили CKYH Alliance (входят COSCO, "K" Line, Yang Ming, Hanjin Shipping) и Evergreen.
2	2012-01-23 19:18:49+04	t			Container Throughput in Ukraine	The ports of Ukraine in 2011 handled 759,695 TEU – a 16.1% growth on 2010.	perevalka-kontejnerov-v-ukrainskih-2012-01-23-091849	<p>\n\tThe ports of Ukraine in 2011 handled 759,695 TEU &ndash; a 16.1% growth on 2010.<br />\n\t&nbsp;<br />\n\tThe port of Odessa went up by 29.6% to 453,7 thousand TEU, while Ilyichevsk dropped by 0.9% to 300,5 thousand TEU.</p>\n<p>\n\tTIS terminal in Yuzhny, launched in the end of November 2011, handled just over 4,000 TEU serving Maersk&rsquo;s deep sea service Ecumed.<br />\n\tIn December 2011 all the Ukrainian ports were down, Odessa lost 7.1% month-on-month, Ilyichevsk 6.3% and Yuzhny 30.9%. The aggregate country ports&rsquo; result was 8.5% below that achieved in November.</p>\n<p>\n\tMarket sources explain the decrease by customs control constraints in ports, which led to some traffic diverting to either other countries&rsquo; ports or to land borders.</p>\n	\N	\N	2012-01-19 10:00:00+04	1734	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Container Throughput in Ukraine	Перевалка контейнеров в украинских портах	<p>\n\tThe ports of Ukraine in 2011 handled 759,695 TEU &ndash; a 16.1% growth on 2010.<br />\n\t&nbsp;<br />\n\tThe port of Odessa went up by 29.6% to 453,7 thousand TEU, while Ilyichevsk dropped by 0.9% to 300,5 thousand TEU.</p>\n<p>\n\tTIS terminal in Yuzhny, launched in the end of November 2011, handled just over 4,000 TEU serving Maersk&rsquo;s deep sea service Ecumed.<br />\n\tIn December 2011 all the Ukrainian ports were down, Odessa lost 7.1% month-on-month, Ilyichevsk 6.3% and Yuzhny 30.9%. The aggregate country ports&rsquo; result was 8.5% below that achieved in November.</p>\n<p>\n\tMarket sources explain the decrease by customs control constraints in ports, which led to some traffic diverting to either other countries&rsquo; ports or to land borders.</p>\n	<p>\n\tСовокупный контейнерооборот украинских терминалов в 2011г. по сравнению с показателем 2010г. вырос на 16,1% и составил 759 695 TEU.<br />\n\tОдесский порт по итогам года увеличил контейнерооборот на 29,6% до 453,7 тысяч TEU. Ильичевск, наоборот, снизил обработку контейнеров на 0,9% до уровня 300,5 тысяч TEU.&nbsp;<br />\n\tКроме того, с ноября прошлого года на Украине заработал новый контейнерный терминал &ndash; ТИС в порту Южный. По итогам года им было обработано более 4 тыс. TEU.<br />\n\t&nbsp;<br />\n\tВ декабре 2011г. совокупный контейнерооборот украинских портов снизился по сравнению с показателем ноября 2011г. на 8,5%. Отрицательную динамику показали все порты. Одесса в последний месяц года снизила обработку контейнеров на 7,1%, Ильичевск на 6,3% и Южный &ndash; на 30,9%.<br />\n\tУчастники рынка связывают сокращение грузопотока через основные контейнерные порты с ужесточением таможенных процедур, из-за которого часть грузов переориентировались на порты других стран или сухопутные погранпереходы.</p>\n	The ports of Ukraine in 2011 handled 759,695 TEU – a 16.1% growth on 2010.	<p>\n\tСовокупный контейнерооборот украинских терминалов в 2011г. по сравнению с показателем 2010г. вырос на 16,1% и составил 759 695 TEU.</p>\n
2	2012-01-23 19:20:10+04	t			New World Alliance Begins Third Trans-Atlantic Service	APL, MOL, Hyundai to begin North Europe-U.S. East Coast-Panama service in late February 	novyij-transatlanticheskij-servis-2012-01-23-092010	<p>\n\tAPL, MOL, Hyundai to begin North Europe-U.S. East Coast-Panama service in late February&nbsp;<br />\n\tThe New World Alliance, consisting of three Asian ocean container carriers, will begin a service connecting north Europe and the U.K. with the U.S. East Coast and Panama at the end of February.</p>\n<p>\n\tThe weekly Americas Europe Express service will deploy five ships with average capacities of 3,200 20-foot equivalent units each, including a high proportion of refrigerated containers. APL will provide three vessels and its partners Hyundai Merchant Marine and MOL will each contribute one ship to the New World&rsquo;s Alliance&rsquo;s third dedicated trans-Atlantic service.</p>\n<p>\n\tThe Alliance said the service offers shippers multiple weekly sailings between major U.S. and European ports, as well as competitive transit times from Latin America to North Europe via a&nbsp;<a href="http://www.joc.com/container-shipping/joc%E2%80%99s-szakonyi-tours-port-colon-free-trade-zone-video" target="_blank">transshipment hub in Panama</a>.</p>\n<p>\n\tThe Americas Europe Express port rotation is: Manzanillo, Charleston, New York, Rotterdam, Bremerhaven, Felixstowe, New York, Charleston and back to Manzanillo. The APL Shanghai will sail from Rotterdam Feb. 29 on the inaugural westbound voyage, and the APL Indonesia will launch the eastbound leg out of Manzanillo March 5.</p>\n	\N	\N	2012-01-20 10:00:00+04	1736	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	New World Alliance Begins Third Trans-Atlantic Service	Новый трансатлантический сервис	<p>\n\tAPL, MOL, Hyundai to begin North Europe-U.S. East Coast-Panama service in late February&nbsp;<br />\n\tThe New World Alliance, consisting of three Asian ocean container carriers, will begin a service connecting north Europe and the U.K. with the U.S. East Coast and Panama at the end of February.</p>\n<p>\n\tThe weekly Americas Europe Express service will deploy five ships with average capacities of 3,200 20-foot equivalent units each, including a high proportion of refrigerated containers. APL will provide three vessels and its partners Hyundai Merchant Marine and MOL will each contribute one ship to the New World&rsquo;s Alliance&rsquo;s third dedicated trans-Atlantic service.</p>\n<p>\n\tThe Alliance said the service offers shippers multiple weekly sailings between major U.S. and European ports, as well as competitive transit times from Latin America to North Europe via a&nbsp;<a href="http://www.joc.com/container-shipping/joc%E2%80%99s-szakonyi-tours-port-colon-free-trade-zone-video" target="_blank">transshipment hub in Panama</a>.</p>\n<p>\n\tThe Americas Europe Express port rotation is: Manzanillo, Charleston, New York, Rotterdam, Bremerhaven, Felixstowe, New York, Charleston and back to Manzanillo. The APL Shanghai will sail from Rotterdam Feb. 29 on the inaugural westbound voyage, and the APL Indonesia will launch the eastbound leg out of Manzanillo March 5.</p>\n	<p>\n\tЛинии в составе The New World Alliance &ndash; APL, HMM и MOL запускают новый трансатлантический сервис между портами Северной Европы, восточного побережья США и Панамы. Americas Europe Express (AEE) станет третьим сервисом альянса на трансатлантическом направлении.<br />\n\tРотация сервиса: Мансанильо &ndash; Чарльстон &ndash; Нью-Йорк &ndash; Роттердам &ndash; Бремерхафен &ndash; Феликстоу &ndash; Мансанильо.<br />\n\tПервое судно в западном направлении, &laquo;APL Shanghai&raquo; выйдет из Роттердама 29 февраля 2012 года. Первый рейс в восточном направлении начнется 5 марта из Мансанильо (т/х &laquo;APL Indonesia&raquo;).</p>\n	APL, MOL, Hyundai to begin North Europe-U.S. East Coast-Panama service in late February 	Линии в составе The New World Alliance – APL, HMM и MOL запускают новый трансатлантический сервис между портами Северной Европы, восточного побережья США и Панамы. Americas Europe Express (AEE) станет третьим сервисом альянса на трансатлантическом направлении.
2	2012-01-26 00:44:54+04	t			Atlantic Ro-Ro Launches Tampa-Russia Service	Multi-purpose service to St. Petersburg kicked off this week \nAtlantic Ro-Ro Carriers launched a general cargo service between the Port of Tampa and the Port of St. Petersburg..	novyij-amerikanskij-servis-na-2012-01-25-144454	<p>\n\tMulti-purpose service to St. Petersburg kicked off this week Atlantic Ro-Ro Carriers launched a general cargo service between the Port of Tampa and the Port of St. Petersburg..</p>\n<p>\n\tThe service kicked off this week with a call at Tampa by the Baltic Merkur, which was loaded at the Ports America terminal with containers, heavy equipment work vehicles and freight trucks.</p>\n<p>\n\tThe new monthly service uses a fleet of multi-purpose vessels that can carry a variety of general cargoes such as steel, containers, roll-on/roll-off traffic, project cargoes and bulk commodities. Transit time is 18 days, according to a company statement.</p>\n<p>\n\tBesides of Tampa Atlantic Ro-Ro also offers other base ports of call: New York and Baltimore in the East Coast and Houston and New Orleans &ndash; in the Gulf. The &ldquo;on-inducement&rdquo; ports of call are Altamira and Veracruz in the Gulf and Camden &ndash; in the East Coast.</p>\n	\N	\N	2012-01-24 10:00:00+04	1738	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Atlantic Ro-Ro Launches Tampa-Russia Service	Новый американский сервис на Петербург	<p>\n\tMulti-purpose service to St. Petersburg kicked off this week Atlantic Ro-Ro Carriers launched a general cargo service between the Port of Tampa and the Port of St. Petersburg..</p>\n<p>\n\tThe service kicked off this week with a call at Tampa by the Baltic Merkur, which was loaded at the Ports America terminal with containers, heavy equipment work vehicles and freight trucks.</p>\n<p>\n\tThe new monthly service uses a fleet of multi-purpose vessels that can carry a variety of general cargoes such as steel, containers, roll-on/roll-off traffic, project cargoes and bulk commodities. Transit time is 18 days, according to a company statement.</p>\n<p>\n\tBesides of Tampa Atlantic Ro-Ro also offers other base ports of call: New York and Baltimore in the East Coast and Houston and New Orleans &ndash; in the Gulf. The &ldquo;on-inducement&rdquo; ports of call are Altamira and Veracruz in the Gulf and Camden &ndash; in the East Coast.</p>\n	<p>\n\tAtlantic Ro-Ro Carriers добавили порт Тампа (США) в расписание своего сервиса на Петербург. Первый судозаход в Тампу состоялся 21 января (т/х &laquo;Baltic Mercur&raquo;). В Петербурге судно должно прийти в первой половине февраля. Сервис между Петербургом и Тампой будет осуществляться с частотой один раз в месяц. Время транзита &ndash; 18 суток.</p>\n<p>\n\tБазовыми портами на восточном побережье США являются Нью-Йорк и Балтимор, в Мексиканском заливе &ndash; Хьюстон и Нью-Орлеан. Тампа теперь также вошла в число базовых портов. Помимо базовых, судозаходы могут также осуществляться в факультативные порты &ndash; Альтамира и Веракрус в Мексиканском заливе или Кэмден на восточном побережье.</p>\n<p>\n\tОсновной грузопоток на Россию на сервисе составляет техника широкой номенклатуры &ndash; строительная, сельскохозяйственная, дорожная, нефтегазовое и медицинское оборудование, энергетические установки. В обратном направлении идут сырье, черные и цветные металлы, пиломатериалы, пакетированные грузы, грузы в биг-бэгах, трубы, рулоны. Базовыми терминалами в Петербурге являются Нева-Металл (по контейнерам) и Вторая стивидорная компания, факультативным &ndash; ЧСК.</p>\n	Multi-purpose service to St. Petersburg kicked off this week \nAtlantic Ro-Ro Carriers launched a general cargo service between the Port of Tampa and the Port of St. Petersburg..	Atlantic Ro-Ro Carriers добавили порт Тампа (США) в расписание своего сервиса на Петербург. Первый судозаход в Тампу состоялся 21 января (т/х «Baltic Mercur»). В Петербурге судно должно прийти в первой половине февраля. Сервис между Петербургом и Тампой будет осуществляться с частотой один раз в месяц. Время транзита – 18 суток.
2	2012-01-28 19:29:57+04	t			Queues at the Russian-Finnish border	Kilometers-long tails formed again at the Russian-Finnish border. The van-trucks have to await almost a whole day waiting for crossing it.	ochered-na-finsko-rossijskoj-granitse-2012-01-28-092957	<p>\n\tKilometers-long tails formed again at the Russian-Finnish border. The van-trucks have to await almost a whole day waiting for crossing it.<br />\n\t&nbsp;<br />\n\tThe &ldquo;Graniza on-line&rdquo; web-site informs about huge queues at Brusnichnoe and Torfyanovka cross-border points. &nbsp;At the Finnish side of a border in Vaalimaa day time speed of passage averaged 23 hours and 20 minutes.&nbsp;<br />\n\tBy the night time it improved a bit. In Torfyanovka over 100 of van-trucks waited for about three and a half hours. &nbsp;<br />\n\t<br />\n\tAccording to Suomiclub.ru no such delays were noticed with cars and tourist buses. The time it takes for passage of passenger vehicles does not exceed 3 to 15 minutes at various cross-border pointes.&nbsp;<br />\n\t<br />\n\tCustoms officials have recommended truck drivers to choose for the less occupied crossing points, in order to reduce congestion at Torfyanovka. In the meantime additional customs staff has been allocated to extra-shifts to manage with the long queue at the Russian border entrance.</p>\n	\N	\N	2012-01-26 10:00:00+04	1741	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Queues at the Russian-Finnish border	Очередь на финско-российской границе	<p>\n\tKilometers-long tails formed again at the Russian-Finnish border. The van-trucks have to await almost a whole day waiting for crossing it.<br />\n\t&nbsp;<br />\n\tThe &ldquo;Graniza on-line&rdquo; web-site informs about huge queues at Brusnichnoe and Torfyanovka cross-border points. &nbsp;At the Finnish side of a border in Vaalimaa day time speed of passage averaged 23 hours and 20 minutes.&nbsp;<br />\n\tBy the night time it improved a bit. In Torfyanovka over 100 of van-trucks waited for about three and a half hours. &nbsp;<br />\n\t<br />\n\tAccording to Suomiclub.ru no such delays were noticed with cars and tourist buses. The time it takes for passage of passenger vehicles does not exceed 3 to 15 minutes at various cross-border pointes.&nbsp;<br />\n\t<br />\n\tCustoms officials have recommended truck drivers to choose for the less occupied crossing points, in order to reduce congestion at Torfyanovka. In the meantime additional customs staff has been allocated to extra-shifts to manage with the long queue at the Russian border entrance.</p>\n	<p>\n\tНа финско-российской границе снова образовалась многокилометровая очередь. На этот раз почти сутки вынуждены простаивать на границе дальнобойщики<br />\n\t&nbsp;<br />\n\tГраница он-лайн сообщает об огромных очередях в Брусничном и Торфяновке. На контрольно-пропускном пункте в Ваалимаа днем скорость прохождения на территории Финляндии в среднем составляла 23 часа 20 минут. Тем не менее, к вечеру наметилась более позитивная тенденция. В Торфяновке более сотни большегрузных фур простаивали около трех с половиной часов.&nbsp;<br />\n\t<br />\n\tОднако никаких проблем, напоминающих затруднения с грузовиками, не возникает у туристических автобусов и легковых автомобилей, отмечает Suomiclub.ru. В зависимости от того, в каком контрольно-пропускном пункте проезжают данные автотранспортные средства, время ожидания варьируется от трех до пятнадцати минут.<br />\n\t<br />\n\tТаможенники уже обратились к водителям с призывом выбирать свободные пункты пропуска, чтобы как-то разгрузить &quot;Торфяновку, пишет Neva24. Сейчас представители Таможенного управления выходят на внеочередные смены, чтобы справиться с очередью на въезд в Россию на пункте пропуска.</p>\n	Kilometers-long tails formed again at the Russian-Finnish border. The van-trucks have to await almost a whole day waiting for crossing it.	На финско-российской границе снова образовалась многокилометровая очередь. На этот раз почти сутки вынуждены простаивать на границе дальнобойщики
2	2012-01-31 23:45:16+04	t			CMA CGM implements GRI from Baltic ports	CMA CGM announced the new GRI program	cma-cgm-vvodit-gri-2012-01-31-134516	CMA CGM announced the new GRI program.  From the March 1st, 2012 the rates for container transportation from ports in North-West Russia and Baltic states to Far East and South East Asia will be increased by USD100/TEU.   Same increased will be implemented for shipments from Russian and Baltic states ports to Middle East and Read Sea. For the ports of North Continent, Scandinavia and UK the GRI of USD200/container will be introduced from February 15th.  	\N	\N	2012-01-30 10:00:00+04	1742	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	CMA CGM implements GRI from Baltic ports	CMA CGM вводит GRI на Балтике	CMA CGM announced the new GRI program.  From the March 1st, 2012 the rates for container transportation from ports in North-West Russia and Baltic states to Far East and South East Asia will be increased by USD100/TEU.   Same increased will be implemented for shipments from Russian and Baltic states ports to Middle East and Read Sea. For the ports of North Continent, Scandinavia and UK the GRI of USD200/container will be introduced from February 15th.  	<p>\n\tCMA CGM объявила новую программу GRI. С 1 марта 2012 года ставки на перевозку из российских портов на Балтике и Прибалтики на Дальний Восток и ЮВА повышаются на 100 долл. с TEU. Аналогичное повышение вводится на перевозках из российских балтийских портов и Прибалтики на Ближний Восток и Красное море.Из портов Северной Европы, стран Скандинавии и Великобритании повышение на Дальний Восток и ЮВА вводится раньше &ndash; плюс 200 долл. за контейнер с 15 февраля.</p>\n	CMA CGM announced the new GRI program	CMA CGM объявила новую программу GRI.
2	2012-02-06 23:14:42+04	t			Team Lines commenced a new service in Baltic	Team Lines has started a new link from Hamburg and Bremerhaven to Sцdertдlje (Sweden, near Stockholm)\nand Klaipeda (Lithuania), styled SWB1	team-lines-otkryivaet-novyij-2012-02-06-131442	<p>\n\tTeam Lines has started a new link from Hamburg and Bremerhaven to Sцdertдlje (Sweden, near Stockholm) and Klaipeda (Lithuania), styled SWB1. The new 2x 700 TEU service will actually be offered in conjunction with POL2, with the full rotation reading: Bremerhaven, Hamburg, Sцdertдlje, Klaipeda, Hamburg, Bremerhaven Szczecin, Gdynia and back to Bremerhaven.</p>\n	\N	\N	2012-02-03 10:00:00+04	1747	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Team Lines commenced a new service in Baltic	Team Lines открывает новый сервис на Балтике	<p>\n\tTeam Lines has started a new link from Hamburg and Bremerhaven to Sцdertдlje (Sweden, near Stockholm) and Klaipeda (Lithuania), styled SWB1. The new 2x 700 TEU service will actually be offered in conjunction with POL2, with the full rotation reading: Bremerhaven, Hamburg, Sцdertдlje, Klaipeda, Hamburg, Bremerhaven Szczecin, Gdynia and back to Bremerhaven.</p>\n	Линия Team Lines запустила новый сервис SWB1 между портами Гамбург, Бремерхафен, Сёдерталье(Швеция, вблизи Стокгольма) и Клайпеда.  Klaipeda (Lithuania). Сервис, обслуживаемый двумя судами вместимостью 700 TEU будет работать в связи с уже существующим сервисом POL2. Итоговая ротация двух сервисов: Bremerhaven, Hamburg, Sodertalje, Klaipeda, Hamburg, Bremerhaven Szczecin, Gdynia и обратно в Bremerhaven.	Team Lines has started a new link from Hamburg and Bremerhaven to Sцdertдlje (Sweden, near Stockholm)\nand Klaipeda (Lithuania), styled SWB1	Линия Team Lines запустила новый сервис SWB1 между портами Гамбург, Бремерхафен, Сёдерталье(Швеция, вблизи Стокгольма) и Клайпеда.  Klaipeda (Lithuania)
2	2012-02-06 23:16:58+04	t			FESCO increased its share in Transcontainer JSC to 21,1%	The transportation holding FESCO of Mr. Sergey Generalov has increased its share in the Russia’s largest intermodal operator from 18,5% to 21,1%. 	fesco-uvelichila-dolyu-v-2012-02-06-131658	<p>\n\tThe transportation holding FESCO of Mr. Sergey Generalov has increased its share in the Russia&rsquo;s largest intermodal operator from 18,5% to 21,1%.</p>\n<p>\n\tThe main shareholder of Transcontainer JSC is stated owned Russian Railways with 50% plus 1 share. Other major shareholders are EBRD &ndash; around 9%, and pension fund &ldquo;Blagosostoyanie&rdquo; &ndash; 5,2%. &nbsp;FESCO originally purchased 12,5% of Transcontainer at its IPO in November 2010, then increased the share to 18,5% in the end of 2011.&nbsp;</p>\n<p>\n\tNowadays a Government decision is pending on the size of share package to be privatized: 25% or 50% - to be sold by Russian Railways. Intention to participate in the auction has been voiced by FESCO, Summa group of Ziyavudin Magomedov, Globaltrans and holding of Russian steel tycoon Mr. Vladimir Lisin.</p>\n	\N	\N	2012-02-02 10:00:00+04	1749	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	FESCO increased its share in Transcontainer JSC to 21,1%	FESCO увеличила долю в ТрансКонтейнере до 21,1%	<p>\n\tThe transportation holding FESCO of Mr. Sergey Generalov has increased its share in the Russia&rsquo;s largest intermodal operator from 18,5% to 21,1%.</p>\n<p>\n\tThe main shareholder of Transcontainer JSC is stated owned Russian Railways with 50% plus 1 share. Other major shareholders are EBRD &ndash; around 9%, and pension fund &ldquo;Blagosostoyanie&rdquo; &ndash; 5,2%. &nbsp;FESCO originally purchased 12,5% of Transcontainer at its IPO in November 2010, then increased the share to 18,5% in the end of 2011.&nbsp;</p>\n<p>\n\tNowadays a Government decision is pending on the size of share package to be privatized: 25% or 50% - to be sold by Russian Railways. Intention to participate in the auction has been voiced by FESCO, Summa group of Ziyavudin Magomedov, Globaltrans and holding of Russian steel tycoon Mr. Vladimir Lisin.</p>\n	<p>\n\tТранспортная группа FESCO Сергея Генералова увеличила свою долю в крупнейшем российском железнодорожном операторе ОАО &quot;ТрансКонтейнер&quot; до 21,1% с 18,5%, следует из материалов базовой компании группы ОАО &quot;Дальневосточное морское пароходство&quot; .</p>\n<p>\n\tНапомним, что крупнейшим акционером &quot;ТрансКонтейнера&quot; являются РЖД , владеющие 50% плюс одна акция. ЕБРР принадлежит около 9%, доверительному управляющему резервами НПФ &quot;Благосостояние&quot; - 5,2%. FESCO купила 12,5% акций &quot;ТрансКонтейнера&quot; во время его IPO в ноябре 2010 года, а увеличила пакет до 18,5% &nbsp;в конце 2011 года.</p>\n<p>\n\tВ настоящее время ожидается решение правительства РФ о том, какой пакет &quot;ТрансКонтейнера&quot; - 25% или 50% - будет выставлен на продажу РЖД. &nbsp;О желании купить пакет акций &quot;ТрансКонтейнера&quot; заявляли группа FESCO, &quot;Сумма&quot; Зиявудина Магомедова, Globaltrans и структуры Владимира Лисина.</p>\n	The transportation holding FESCO of Mr. Sergey Generalov has increased its share in the Russia’s largest intermodal operator from 18,5% to 21,1%. 	Транспортная группа FESCO Сергея Генералова увеличила свою долю в крупнейшем российском железнодорожном операторе ОАО "ТрансКонтейнер" до 21,1% с 18,5%, следует из материалов базовой компании группы ОАО "Дальневосточное морское пароходство" . 
2	2012-02-10 04:31:46+04	t			Atlantic Container Line to Launch US-Baltic Ro-Ro Service	Atlantic Container Line later this month will launch a weekly roll-on, roll-off service from the U.S. and Canada to Finland and Russia.	perevozchik-atlantic-container-line-2012-02-09-183146	<p>\n\tAtlantic Container Line later this month will launch a weekly roll-on, roll-off service from the U.S. and Canada to Finland and Russia.</p>\n<p>\n\tThe service will deploy ACL&rsquo;s trans-Atlantic vessels and ice class ships operated by Finnlines, a sister company in Italy&rsquo;s Grimaldi group. ACL said the service offers the fastest and most frequent link between North America and the Baltic Sea region.</p>\n<p>\n\tACL&rsquo;s ships arrive in Antwerp on Thursdays and will link up with Finnlines vessels, which sail on Saturdays to Helsinki, Kotka and St Petersburg. Cargo loaded in New York, Baltimore, Norfolk and Halifax will move under a single ACL through bill of lading to the Finnish and Russian ports.</p>\n<p>\n\t&ldquo;Our customers have been asking us for a better Baltic Sea connection for quite some time. This new service gives us another niche where we can do something better than anybody else,&rdquo; said ACL President and CEO Andrew Abbott.</p>\n	\N	\N	2012-02-08 10:00:00+04	1752	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Atlantic Container Line to Launch US-Baltic Ro-Ro Service	Перевозчик Atlantic Container Line запускает Ро-Ро сервис между США и Балтикой	<p>\n\tAtlantic Container Line later this month will launch a weekly roll-on, roll-off service from the U.S. and Canada to Finland and Russia.</p>\n<p>\n\tThe service will deploy ACL&rsquo;s trans-Atlantic vessels and ice class ships operated by Finnlines, a sister company in Italy&rsquo;s Grimaldi group. ACL said the service offers the fastest and most frequent link between North America and the Baltic Sea region.</p>\n<p>\n\tACL&rsquo;s ships arrive in Antwerp on Thursdays and will link up with Finnlines vessels, which sail on Saturdays to Helsinki, Kotka and St Petersburg. Cargo loaded in New York, Baltimore, Norfolk and Halifax will move under a single ACL through bill of lading to the Finnish and Russian ports.</p>\n<p>\n\t&ldquo;Our customers have been asking us for a better Baltic Sea connection for quite some time. This new service gives us another niche where we can do something better than anybody else,&rdquo; said ACL President and CEO Andrew Abbott.</p>\n	<p>\n\tПеревозчик Atlantic Container Line в конце февраля запускает еженедельный Ро-Ро сервис из США и Канады в порты Финляндии и России.</p>\n<p>\n\tНа сервисе будут задействованы транс-атлантические судна ACL и Ро-Ро суда ледового класса компании Finnlines, входящей в итальянскую Grimaldi group. По информации ACL, новый сервис будет обеспечивать кратчайшее транзитное время и наилучшую частоту рейсов между Северной Америкой и портами Балтики.</p>\n<p>\n\tОкеанские суда ACL будут приходить по четвергам в Антверпен, где будут стыковаться с сервисом Finnlines, отправляющимся по субботам в Хельсинки, Котку и Санкт-Петербург. Грузы из Нью-Йорка, Балтимора, Норфолка и Галифакса будут перевозиться по единому сквозному коносаменту ACL до финских и российского портов.</p>\n<p>\n\t&laquo;Наши клиенты уже давно нуждаются в улучшенном сервисе на Балтику. Новая линия создаст для нас ещё одну нишу, где мы сможем обслужить клиентов лучше, чем кто-либо другой&raquo;, - сообщил президент и генеральный директор ACL &nbsp;Эндрю Абботт.</p>\n	Atlantic Container Line later this month will launch a weekly roll-on, roll-off service from the U.S. and Canada to Finland and Russia.	Перевозчик Atlantic Container Line запускает Ро-Ро сервис между США и Балтикой  
2	2012-02-14 22:39:58+04	t			Hapag-Llloyd expands its intra-Baltic feeder	<p>\n\tHapag-Lloyd more than doubled capacity of its Baltic Feeder Service (BSF), from Hamburg and Bremerhaven to Tallinn, Riga and Klaipeda, by replacing its current 400 TEU vessel with one of 900 TEU.</p>\n	hapag-lloyd-rasshiryaet-fidernyie-vozmozhnosti-2012-02-14-123958	<p>\n\tHapag-Lloyd more than doubled capacity of its Baltic Feeder Service (BSF), from Hamburg and Bremerhaven</p>\n<p>\n\tto Tallinn, Riga and Klaipeda, by replacing its current 400 TEU vessel with one of 900 TEU.</p>\n	\N	\N	2012-02-10 10:00:00+04	1756	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Llloyd expands its intra-Baltic feeder	Hapag-Lloyd расширяет фидерные возможности на Балтике	<p>\n\tHapag-Lloyd more than doubled capacity of its Baltic Feeder Service (BSF), from Hamburg and Bremerhaven</p>\n<p>\n\tto Tallinn, Riga and Klaipeda, by replacing its current 400 TEU vessel with one of 900 TEU.</p>\n	<p>\n\tЛиния более, чем удвоила провозную способность своего фидерного сервиса&nbsp;BalticFeederService&nbsp;(BSF). Задействованный сейчас контейнеровоз вместимостью 400&nbsp;TEU будет заменён на более крупное судно размером 900&nbsp;TEU.</p>\n<p>\n\tBSF работает между портами Гамбург, Бремерхафен, Таллинн , Рига и Клайпеда. &nbsp;&nbsp;</p>\n	<p>\n\tHapag-Lloyd more than doubled capacity of its Baltic Feeder Service (BSF), from Hamburg and Bremerhaven to Tallinn, Riga and Klaipeda, by replacing its current 400 TEU vessel with one of 900 TEU.</p>\n	<p>\n\tЛиния более, чем удвоила провозную способность своего фидерного сервиса BalticFeederService (BSF).</p>\n
2	2012-02-28 03:44:28+04	t			Maersk Hikes Asia-Europe Westbound Rates $400	<p>\n\tThe second increase of the year will increase shipping costs $1,175 from April</p>\n	maersk-povyishaet-stavki-na-2012-02-27-174428	<p>\n\tThe second increase of the year will increase shipping costs $1,175 from April</p>\n<p>\n\tMaersk Line will hike westbound rates on the Asia-Europe trade lane a further $400 in April, as the world&rsquo;s largest carrier announced on Friday the second rate increase of the year on the depressed route.</p>\n<p>\n\tThe rate increase, which will apply to dry and refrigerated cargo moving from all Asian ports to all destinations in north Europe and the Mediterranean, will raise the cost of shipping $1,175 from April. The latest increase comes just days before the&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-line-adds-775-asia-europe-rates" target="_blank">Danish carrier announced plans to increase westbound rates by $775 per TEU</a> on March 1.</p>\n<p>\n\tMaersk signaled its determination to push through the higher rates with an announcement on Feb. 17 that it is <a href="http://www.joc.com/trade-lanes/asia-europe-rates-rise-3-percent-maersk-capacity-cut" target="_blank"> cutting capacity on the Asia-Europe trade by 9 percent via a vessel sharing agreement</a> with rival French carrier CMA CGM.</p>\n<p>\n\tAll major carriers on the Asia-Europe trade are poised to raise rates by $750 to $800 per TEU on March 1. But it is uncertain whether they will follow Maersk&rsquo;s latest move, apply smaller increases or stick with the March 1 hikes to boost market share.</p>\n<p>\n\tMaersk has vowed to maintain its leading market share on the Asia-Europe trade, <a href="http://www.joc.com/trade-lanes/shippers-doubt-asia-europe-rate-push-will-take" target="_blank"> fuelling skepticism that carriers can implement the latest round of rate hikes</a>, especially as cargo growth is expected to slow to 1.5 percent in 2012 from 2.8 percent in 2011.</p>\n<p>\n\tWestbound spot rates have risen over the past week, however, following Maersk&rsquo;s announcement that it will reduce capacity. And shares in Maersk parent A.P. Moller-Maersk were the bigger gainer in the Copenhagen 20 Index today, rising 4.2 percent on the announcement of the April 1 rate hike. Maersk releases its 2011 financial results Monday.</p>\n<p>\n\t&ldquo;A week ago I would have said that it would be impossible for Maersk Line to make a profit in 2012. However, if they get [the April rate increase] through, we have a completely different starting point for 2012 and 2013,&rdquo; Ricky Rasmussen, an analyst at Nykredit Markets, told Danish daily newspaper Berlingske Tidende.</p>\n	\N	\N	2012-02-24 10:00:00+04	1761	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Hikes Asia-Europe Westbound Rates $400	Maersk повышает ставки на направлении Азия – Европа на USD 400	<p>\n\tThe second increase of the year will increase shipping costs $1,175 from April</p>\n<p>\n\tMaersk Line will hike westbound rates on the Asia-Europe trade lane a further $400 in April, as the world&rsquo;s largest carrier announced on Friday the second rate increase of the year on the depressed route.</p>\n<p>\n\tThe rate increase, which will apply to dry and refrigerated cargo moving from all Asian ports to all destinations in north Europe and the Mediterranean, will raise the cost of shipping $1,175 from April. The latest increase comes just days before the&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-line-adds-775-asia-europe-rates" target="_blank">Danish carrier announced plans to increase westbound rates by $775 per TEU</a> on March 1.</p>\n<p>\n\tMaersk signaled its determination to push through the higher rates with an announcement on Feb. 17 that it is <a href="http://www.joc.com/trade-lanes/asia-europe-rates-rise-3-percent-maersk-capacity-cut" target="_blank"> cutting capacity on the Asia-Europe trade by 9 percent via a vessel sharing agreement</a> with rival French carrier CMA CGM.</p>\n<p>\n\tAll major carriers on the Asia-Europe trade are poised to raise rates by $750 to $800 per TEU on March 1. But it is uncertain whether they will follow Maersk&rsquo;s latest move, apply smaller increases or stick with the March 1 hikes to boost market share.</p>\n<p>\n\tMaersk has vowed to maintain its leading market share on the Asia-Europe trade, <a href="http://www.joc.com/trade-lanes/shippers-doubt-asia-europe-rate-push-will-take" target="_blank"> fuelling skepticism that carriers can implement the latest round of rate hikes</a>, especially as cargo growth is expected to slow to 1.5 percent in 2012 from 2.8 percent in 2011.</p>\n<p>\n\tWestbound spot rates have risen over the past week, however, following Maersk&rsquo;s announcement that it will reduce capacity. And shares in Maersk parent A.P. Moller-Maersk were the bigger gainer in the Copenhagen 20 Index today, rising 4.2 percent on the announcement of the April 1 rate hike. Maersk releases its 2011 financial results Monday.</p>\n<p>\n\t&ldquo;A week ago I would have said that it would be impossible for Maersk Line to make a profit in 2012. However, if they get [the April rate increase] through, we have a completely different starting point for 2012 and 2013,&rdquo; Ricky Rasmussen, an analyst at Nykredit Markets, told Danish daily newspaper Berlingske Tidende.</p>\n	<p>\n\tВторое повышение ставок с начала года, увеличит в апреле расходы клиентов на перевозку контейнеров по сравнению с началом 2012 на USD 1,175 года за 20&rsquo; контейнер и на USD 2,350 за 40&rsquo;.&nbsp;</p>\n<p>\n\tСогласно сообщению крупнейшей мировой линии в пятницу, Maerskс апреля повысит ставки фрахта на западном направлении Азия &ndash; Европа ещё на USD400. &nbsp;</p>\n<p>\n\tПовышение ставок, которое будет распространяться на стандартные и рефрижераторные контейнеры, следующие из портов Азии на все порты Северной Европы и Средиземного моря, увеличит расходы грузовладельцев по сравнению с началом года на USD1,175/TEU. Это заявление датской линии последовало спустя считанные дни после её объявления о повышении фрахтовых ставок в западном направлении на USD&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-line-adds-775-asia-europe-rates" target="_blank">775 за TEU</a> с 1 марта.</p>\n<p>\n\tMaersk четко обозначил свою решимость повысить ставки своим сообщением от 17 февраля, в котором заявил о сокращении тоннажа на азиатско-европейском трейде на 9% с началом совместного использования ряда сервисов с французской линией CMA-CGM.</p>\n<p>\n\tВсе основные перевозчики также подготовились к повышению ставок с 1 марта на USD750 - USD800 за TEU.</p>\n<p>\n\tТем не менее, пока не ясно: последуют ли они новому повышению Maersk, повысят ставки на меньшую сумму либо удержит их на уровне 1 марта для увеличения своей доли рынка.</p>\n<p>\n\tMaersk тем временем обещал продолжить предпринимать все усилия для сохранение своей доли рынка на направлении Азия &ndash; Европа, подпитывая тем самым скептицизм относительно успешности объявленных повышений, особенно в свете ожидаемого замедления роста спроса до 1,5% в 2012 по сравнению с 2,8% в 2011.&nbsp;</p>\n<p>\n\tТем не менее, ставки фрахта на перевозку контейнеров в западном направлении возросли в течении прошлой недели, вслед за заявлением Maersk&nbsp; о сокращении задействованного тоннажа. При этом котировки акций владельца датской линии &nbsp;A.P. Moller-Maersk сегодня показали наилучший рост в Копенгагенском биржевом индексе 20 крупнейших компаний, увеличившись на 4,2% после заявления о повышении с 1 апреля. Ожидается, что Maersk опубликует свои результаты за 2011 год в понедельник.&nbsp;</p>\n<p>\n\t&ldquo;Неделю назад я бы сказал, что Maerskне сможет показать прибыли в 2012 году. Однако если они смогут добиться апрельского повышения ставок, у нас будет совсем другая отправная точка для прогнозов на 2012 и 2013 годы&raquo;, - заявил Рики Расмуссен (Ricky Rasmussen), аналитик NykreditMarkets, как сообщила датская газета BerlingskeTidende.</p>\n	<p>\n\tThe second increase of the year will increase shipping costs $1,175 from April</p>\n	<p>\n\tВторое повышение ставок с начала года, увеличит в апреле расходы клиентов на перевозку контейнеров по сравнению с началом 2012 на USD 1,175 года за 20&rsquo; контейнер и на USD 2,350 за 40&rsquo;.</p>\n
2	2012-03-11 18:53:00+04	t			Daily Maersk May Add Routes	<p>\n\tJust four months after launching its Daily Maersk liner service in the Asia-Europe trade, Maersk Line says it could expand the highly popular &ldquo;conveyor belt&rdquo; offering to other trade routes later this year.</p>\n	dailymaersk-mozhet-dobavit-novyie-2012-03-11-095300	<p>\n\tJust four months after launching its Daily Maersk liner service in the Asia-Europe trade, Maersk Line says it could expand the highly popular &ldquo;conveyor belt&rdquo; offering to other trade routes later this year.</p>\n<p>\n\tThe carrier will be in position to decide in the third quarter whether the Daily Maersk service would work on other trade lanes, CEO said Soren Skou, adding, &ldquo;There are no concrete plans for now.&rdquo;</p>\n<p>\n\tThe Daily Maersk would transfer most easily to the Asia-U.S. market, according to former CEO Eivind Kolding, who launched the Asia-Europe service in late October.</p>\n<p>\n\tThe Daily Maersk played a key role in boosting Maersk&rsquo;s Asia-Europe market share to a record high of 19.4 percent by the end of 2011, Skou said. Maersk&rsquo;s market share increased only after the launch of Daily Maersk, &ldquo;a good sign customers like it,&rdquo; he said.</p>\n<p>\n\tOnly six containers shipped last week from Asia on Daily Maersk services failed to arrive in Europe at the guaranteed delivery time.</p>\n<p>\n\tThe Daily Maersk, which compensates shippers in cash for late delivery, covers 17,000 to 18,000 20-foot equivalent units out of Maersk&rsquo;s total weekly traffic of 35,000 TEUs on the Asia-Europe trade.</p>\n<p>\n\tThe service, originally from four Asian ports to Felixstowe, Rotterdam and Bremerhaven, was extended to Le Havre, Hamburg and Zeebrugge in February, though there is no compensation for late delivery to these ports.</p>\n<p>\n\tSkou said Maersk has got sufficient market share to fill the capacity of the carrier&rsquo;s 70 largest ships that operate the Daily Maersk and is now focusing on increasing profitability.</p>\n<p>\n\tMaersk can charge a premium for reliability, the most important factor for its customers because it removes uncertainty from their supply chains. Customer satisfaction is at an all-time high of 6.1 on a 7-point scale, and its 25-net promoter score, a customer loyalty metric, is similar to large car manufacturers. &ldquo;An improved service will allow us to charge more,&rdquo; Skou said.&nbsp;</p>\n	\N	\N	2012-03-06 10:00:00+04	1763	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Daily Maersk May Add Routes	DailyMaersk может добавить новые маршруты	<p>\n\tJust four months after launching its Daily Maersk liner service in the Asia-Europe trade, Maersk Line says it could expand the highly popular &ldquo;conveyor belt&rdquo; offering to other trade routes later this year.</p>\n<p>\n\tThe carrier will be in position to decide in the third quarter whether the Daily Maersk service would work on other trade lanes, CEO said Soren Skou, adding, &ldquo;There are no concrete plans for now.&rdquo;</p>\n<p>\n\tThe Daily Maersk would transfer most easily to the Asia-U.S. market, according to former CEO Eivind Kolding, who launched the Asia-Europe service in late October.</p>\n<p>\n\tThe Daily Maersk played a key role in boosting Maersk&rsquo;s Asia-Europe market share to a record high of 19.4 percent by the end of 2011, Skou said. Maersk&rsquo;s market share increased only after the launch of Daily Maersk, &ldquo;a good sign customers like it,&rdquo; he said.</p>\n<p>\n\tOnly six containers shipped last week from Asia on Daily Maersk services failed to arrive in Europe at the guaranteed delivery time.</p>\n<p>\n\tThe Daily Maersk, which compensates shippers in cash for late delivery, covers 17,000 to 18,000 20-foot equivalent units out of Maersk&rsquo;s total weekly traffic of 35,000 TEUs on the Asia-Europe trade.</p>\n<p>\n\tThe service, originally from four Asian ports to Felixstowe, Rotterdam and Bremerhaven, was extended to Le Havre, Hamburg and Zeebrugge in February, though there is no compensation for late delivery to these ports.</p>\n<p>\n\tSkou said Maersk has got sufficient market share to fill the capacity of the carrier&rsquo;s 70 largest ships that operate the Daily Maersk and is now focusing on increasing profitability.</p>\n<p>\n\tMaersk can charge a premium for reliability, the most important factor for its customers because it removes uncertainty from their supply chains. Customer satisfaction is at an all-time high of 6.1 on a 7-point scale, and its 25-net promoter score, a customer loyalty metric, is similar to large car manufacturers. &ldquo;An improved service will allow us to charge more,&rdquo; Skou said.&nbsp;</p>\n	<p>\n\tВсего четыре месяца после запуска сервиса DailyMaersk&nbsp;на направлении Азия &ndash; Европа, линия Maersk&nbsp;сообщила о возможном расширении уже снискавшего высокую популярность &laquo;конвейерного&raquo; сервиса на другие направления в 2012 году.</p>\n<p>\n\tПеревозчик может принять решение о распространении DailyMaersk&nbsp;на новые трейды в третьем квартале, - сообщил CEO&nbsp;компании SorenSkou, добавив ,что &nbsp;&ldquo;конкретных планов пока ещё нет&rdquo;.</p>\n<p>\n\tПо словам бывшего руководителя Maersk- EivindKolding, который инициировал DailyMaersk&nbsp;в конце октября прошлого года, данная концепция линейного сервиса может быть наиболее легко введена на рынке перевозок Азия &ndash; США.</p>\n<p>\n\tDailyMaersk&nbsp;сыграл ключевую роль в увеличении доли рынка Maersk на направлении Азия &ndash; Европа до рекордного уровня 19.4% в конце 2011 года, - сообщил Skou. Доля Maersk&nbsp;выросла только после запуска сервиса DailyMaersk, &ldquo;что свидетельствует о позитивной реакции клиентов&rdquo;, - сказал он.</p>\n<p>\n\tТолько шесть контейнеров прибывших на прошлой неделе из Азии по DailyMaersk превысили гарантированный срок доставки. &nbsp;</p>\n<p>\n\tDailyMaersk, который компенсирует потери клиентов за позднюю доставку, сейчас перевозит 17,000 -18,000 TEU&nbsp;из примерно 35,000 TEU перевозимых Maersk&nbsp;из Азии в Европу еженедельно. &nbsp;</p>\n<p>\n\tЭтот сервис, изначально предлагавший перевозку из четырех портов в Азии в европейские порты Felixstowe, Rotterdam&nbsp;и Bremerhaven, в феврале был продлен на порты LeHavre, Hamburg&nbsp;и Zeebrugge, но пока без компенсаций за опоздание. &nbsp;</p>\n<p>\n\tSkou&nbsp;сообщил, что Maersk&nbsp;достиг достаточно высокой доли рынка чтобы заполнить имеющийся флот из 70 крупнейших контейнеровозов, задействованных в DailyMaersk, и сейчас концентрируется на повышении прибыльности перевозок. &nbsp;</p>\n<p>\n\tMaersk&nbsp;может применить повышенные ставки за надежность сервиса, которая позволяет исключить неопределенность из цепочки поставок клиента. &nbsp;&laquo;Уровень удовлетворенности клиентов линии сейчас на рекордно высоком уровне, поэтому наш качественный сервис позволит продавать более высокие ставки&raquo;, - сказал Skou.&nbsp;</p>\n	<p>\n\tJust four months after launching its Daily Maersk liner service in the Asia-Europe trade, Maersk Line says it could expand the highly popular &ldquo;conveyor belt&rdquo; offering to other trade routes later this year.</p>\n	<p>\n\tВсего четыре месяца после запуска сервиса DailyMaersk&nbsp;на направлении Азия &ndash; Европа, линия Maersk&nbsp;сообщила о возможном расширении уже снискавшего высокую популярность &laquo;конвейерного&raquo; сервиса на другие направления в 2012 году.</p>\n
2	2012-03-22 00:55:48+04	t			ZIM changes rotation on its EMX Black Sea service	<p>\n\tThe itinerary of ZIM&rsquo;s East Med Black Sea Express (EMX), connecting to the Far East, will as from mid- April also include Odessa in addition to the other Black sea ports of Novorossiysk and Constantza.</p>\n	zim-izmenyaet-rotatsiyu-na-2012-03-21-155548	<p>\n\tThe itinerary of ZIM&rsquo;s East Med Black Sea Express (EMX), connecting to the Far East, will as from mid- April also include Odessa in addition to the other Black sea ports of Novorossiysk and Constantza. Further, destinations in the Mediterranean are Istanbul, Gemlik, Haifa and Ashdod</p>\n	\N	\N	2012-03-16 09:00:00+04	1767	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	ZIM changes rotation on its EMX Black Sea service	ZIM изменяет ротацию на черноморском сервисе EMX	<p>\n\tThe itinerary of ZIM&rsquo;s East Med Black Sea Express (EMX), connecting to the Far East, will as from mid- April also include Odessa in addition to the other Black sea ports of Novorossiysk and Constantza. Further, destinations in the Mediterranean are Istanbul, Gemlik, Haifa and Ashdod</p>\n	<p>\n\tВ расписание сервиса EMX линии ZIM, осуществляющего контейнерные перевозки напрямую между портами Дальнего Востока и Черным морем, с середины апреля будет включена Одесса.</p>\n<p>\n\tДругими портами захода линии в Черном море являются Новороссийск и Констанца, в Средиземном и Мраморном морях &ndash; Стамбул, Гемлик, Хайфа и Ашдод.</p>\n	<p>\n\tThe itinerary of ZIM&rsquo;s East Med Black Sea Express (EMX), connecting to the Far East, will as from mid- April also include Odessa in addition to the other Black sea ports of Novorossiysk and Constantza.</p>\n	В расписание сервиса EMX линии ZIM, осуществляющего контейнерные перевозки напрямую между портами Дальнего Востока и Черным морем, с середины апреля будет включена Одесса. 
2	2012-03-29 18:50:26+04	t			G6 Alliance to Skip Gdansk Calls on Loop 3	<p>\n\tThe G6 Alliance&rsquo;s Loop 3 Asia-Europe service will not include a call at the port of Gdansk, Poland, OOCL said.</p>\n	maersk-priostanavlivaet-priem-k-2012-03-29-095026	<p>\n\t&nbsp;</p>\n<p>\n\tThe G6 Alliance&rsquo;s Loop 3 Asia-Europe service will not include a call at the port of Gdansk, Poland, OOCL said.</p>\n<p>\n\tThe Hong Kong-based carrier said the decision not to call at Gdansk was due to &ldquo;unforeseen circumstances of securing a berthing window.&rdquo;</p>\n<p>\n\tCargo bound for Poland and other destinations in Baltic including Russia will continue to be accepted on G6 Alliance services that call German ports as it will be discharged at either Hamburg or Bremerhaven before being relayed by feeder to the destination.</p>\n<p>\n\tThe new Loop 3 port rotation will be: Shanghai, Ningbo, Shekou, Singapore, Tangier, Rotterdam, Bremerhaven, Gothenburg, Rotterdam, Jeddah, Singapore, Shekou, Hong Kong and back to Shanghai.</p>\n<p>\n\tThe G6 alliance was formed last December <a href="http://www.joc.com/trade-lanes/g6-alliance-speeds-asia-europe-service-launch" target="_blank"> to combine services on the Asia-Europe trade lane</a> by the carriers that belong to the Grand Alliance, Hapag-Lloyd, NYK and OOCL, and the New World Alliance, APL, Hyundai Merchant Marine and MOL.</p>\n	\N	\N	2012-03-23 09:00:00+04	1769	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	G6 Alliance to Skip Gdansk Calls on Loop 3	Maersk приостанавливает прием к перевозке экспортных грузов на направлении Сев. Европа – Азия.	<p>\n\t&nbsp;</p>\n<p>\n\tThe G6 Alliance&rsquo;s Loop 3 Asia-Europe service will not include a call at the port of Gdansk, Poland, OOCL said.</p>\n<p>\n\tThe Hong Kong-based carrier said the decision not to call at Gdansk was due to &ldquo;unforeseen circumstances of securing a berthing window.&rdquo;</p>\n<p>\n\tCargo bound for Poland and other destinations in Baltic including Russia will continue to be accepted on G6 Alliance services that call German ports as it will be discharged at either Hamburg or Bremerhaven before being relayed by feeder to the destination.</p>\n<p>\n\tThe new Loop 3 port rotation will be: Shanghai, Ningbo, Shekou, Singapore, Tangier, Rotterdam, Bremerhaven, Gothenburg, Rotterdam, Jeddah, Singapore, Shekou, Hong Kong and back to Shanghai.</p>\n<p>\n\tThe G6 alliance was formed last December <a href="http://www.joc.com/trade-lanes/g6-alliance-speeds-asia-europe-service-launch" target="_blank"> to combine services on the Asia-Europe trade lane</a> by the carriers that belong to the Grand Alliance, Hapag-Lloyd, NYK and OOCL, and the New World Alliance, APL, Hyundai Merchant Marine and MOL.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tВывод судов из эксплуатации после китайского нового года привел к затовариванию складов европейских контейнерных терминалов.</p>\n<p>\n\tЛиния Maerskприостановила прием контейнеров к перевозке на направлении из Сев. ЕвропывАзиюдляразгрузкизатоваренныхевропейскихтерминаловтрансшипмента.</p>\n<p>\n\tMaerskсообщил, что ожидает возобновления букировок в начале мая, после того, как удастся устранить беспрецедентные заторы, возникшие из-за нехватки океанских судов для вывоза экспорта после китайского нового года .</p>\n<p>\n\t&ldquo;Сейчас степень использования терминалов приближается к максимуму их вместимости&raquo;, сообщил датский перевозчик. &ldquo;Если бы прием грузов не был остановлен, это могло бы отрицательно сказаться на скорости грузовых работ и привести к снижению возможностей линии по вывозу задержавшихся грузов, а также возникновению заторов в адрес других направлений&raquo;. &nbsp;&nbsp;</p>\n<p>\n\t&nbsp;Низкий спрос на перевозки из Азии в западном направлении после китайского нового года вынудил нескольких линейных перевозчиков сократить число рейсов из Азии и, соответственно, обратно из Европы. Несмотря на кризис в еврозоне и общие повышения ставок в феврале, марте и апреле, спрос на европейские товары в Азии продолжает расти, - сообщил Maersk.</p>\n<p>\n\t&laquo;Остановка экспортных букировок &ndash; временная, мы стремимся как можно быстрее вывезти наши простаивающие грузы из портов трансшипмента для того, чтобы возобновить нормальную отправку экспорта&raquo;, заявил Maersk в своём нотисе для клиентов. &laquo;Мы были вынуждены применить данную меру для того, чтобы в приоритетном порядке выполнить доставку по ранее принятым отправкам&raquo;.</p>\n<p>\n\t&nbsp;&ldquo;По информации от наших клиентов, другие линии также приостановили прием экспортных букировок до мая&raquo;, - сказал представитель Maersk. &laquo;Вполне очевидно, что экспортеры огорчены временной нехваткой места по их грузы, но точно оценивать масштаб последствий для их логистических цепочек пока ещё рано&raquo;.&nbsp;</p>\n<p>\n\tMaerskтакже отметил, что &laquo;продолжает рассматривать различные варианты&raquo;, включая дополнительные порты захода, дополнительные рейсы вне основного расписания из Северной Европы и другие меры для снижения загруженности портов и скорейшего возобновления приема экспортных букингов.</p>\n<p>\n\tПриостановка экспортных букингов никак не повлияла на отправки в гораздо более активном обратном направлении из Азии в Европу, в т.ч. на ежедневном сервисе DailyMaersk.</p>\n<p>\n\tMaerskявляется лидером и обслуживает более 19% объемов перевозок на этом крупнейшем в мире транспортном направлении.&nbsp;</p>\n	<p>\n\tThe G6 Alliance&rsquo;s Loop 3 Asia-Europe service will not include a call at the port of Gdansk, Poland, OOCL said.</p>\n	<p>\n\tВывод судов из эксплуатации после китайского нового года привел к затовариванию складов европейских контейнерных терминалов</p>\n
2	2012-04-07 02:27:28+04	t			Hapag-Lloyd launches the new feeder service to St.Petersburg	<p>\n\tHapag-Lloyd starts its new dedicated feeder service Russia Express Service (REX). Port rotation will be as follows. Bremehaven &ndash; Hamburg &ndash; St.Petersburg &ndash; Helsinki &ndash; Gdynia- Bremerhaven.</p>\n	hapag-lloyd-zapuskaet-svoj-servis-2012-04-06-172728	<p>\n\tHapag-Lloyd starts its new dedicated feeder service Russia Express Service (REX). Port rotation will be as follows. Bremehaven &ndash; Hamburg &ndash; St.Petersburg &ndash; Helsinki &ndash; Gdynia- Bremerhaven.</p>\n<p>\n\tThe service will use two chartered ice-class ladies of 1400 TEU. In St.Petersburg the service will be handled at the FCT and PLP terminals.</p>\n<p>\n\tREX will provide weekly fix-day calls, the first calls at St.Petersburg is expected in early May.</p>\n	\N	\N	2012-04-05 09:00:00+04	1772	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Lloyd launches the new feeder service to St.Petersburg	Hapag-Lloyd запускает свой сервис на Петербург	<p>\n\tHapag-Lloyd starts its new dedicated feeder service Russia Express Service (REX). Port rotation will be as follows. Bremehaven &ndash; Hamburg &ndash; St.Petersburg &ndash; Helsinki &ndash; Gdynia- Bremerhaven.</p>\n<p>\n\tThe service will use two chartered ice-class ladies of 1400 TEU. In St.Petersburg the service will be handled at the FCT and PLP terminals.</p>\n<p>\n\tREX will provide weekly fix-day calls, the first calls at St.Petersburg is expected in early May.</p>\n	<p>\n\tHapag-Lloyd открывает новый сервис Russia Express Service (REX). Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Хельсинки &ndash; Гдыня &ndash; Бремерхафен.</p>\n<p>\n\tНа сервисе будут работать два зафрахтованных судна ледового класса по 1,4 тыс. TEU. В Петербурге судозаходы будут осуществляться на терминалы ПКТ и ПЛП.</p>\n<p>\n\tСервис будет еженедельным, по фиксированному расписанию. Первый рейс из Германии намечен на начало мая.</p>\n	<p>\n\tHapag-Lloyd starts its new dedicated feeder service Russia Express Service (REX). Port rotation will be as follows. Bremehaven &ndash; Hamburg &ndash; St.Petersburg &ndash; Helsinki &ndash; Gdynia- Bremerhaven.</p>\n	<p>\n\tHapag-Lloyd открывает новый сервис Russia Express Service (REX). Ротация: Бремерхафен &ndash; Гамбург &ndash; Санкт-Петербург &ndash; Хельсинки &ndash; Гдыня &ndash; Бремерхафен.</p>\n
2	2012-04-07 02:31:26+04	t			Deep Sea Zim to Odessa and Iliychevsk	<p>\n\tZIM hasupgradeditsBlackSeaservicenetwork. The liner joins a new deep-sea service and commenced direct calls of the existing service to Odessa.</p>\n	deep-sea-zim-na-2012-04-06-173126	<p>\n\tZIM hasupgradeditsBlackSeaservicenetwork. The liner joins a new deep-sea service and commenced direct calls of the existing service to Odessa. &nbsp;</p>\n<p>\n\tOdessa has been included into rotation of the East Med/Black Sea Express Service (EMX). The upgraded rotation reads Pusan &ndash; Shanghai &ndash; Ningbo &ndash; Dachan Bay &ndash; Kelang &ndash; Haifa &ndash; Ashdod &ndash; Istanbul &ndash; Odessa &ndash; Novorossiysk &ndash; Gemlik &ndash; Istanbul &ndash; Haifa &ndash; Mundra &ndash; Colombo &ndash; Kelang &ndash; Pusan. ZIM considers Odessa as important gateway to Ukrainian and CIS markets in addition to Novorossiysk. The EMX deploys 10 ships, including 8 x 4250 TEU and 2 x 3429 TEU.</p>\n<p>\n\tThe new deep-sea service the ZIM have taken slots on is Asia-Black Sea (ABS), &nbsp;offering rotation as follows. Shanghai&ndash; Ningbo &ndash; Shekou &ndash; Singapore &ndash; Kelang &ndash; Piraeus &ndash; Istanbul&ndash; Constanta &ndash; Iliychevsk &ndash; Kelang &nbsp;&ndash; Shanghai.</p>\n<p>\n\tBesides of these two deep-seas, ZIM operates in Black Sea the dedicated feeder services, including Black Sea Ukraine Service (BSU) and Constanta Poti Shuttle</p>\n	\N	\N	2012-04-05 09:00:00+04	1774	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Deep Sea Zim to Odessa and Iliychevsk	Deep Sea Zim на Одессу и Ильичевск	<p>\n\tZIM hasupgradeditsBlackSeaservicenetwork. The liner joins a new deep-sea service and commenced direct calls of the existing service to Odessa. &nbsp;</p>\n<p>\n\tOdessa has been included into rotation of the East Med/Black Sea Express Service (EMX). The upgraded rotation reads Pusan &ndash; Shanghai &ndash; Ningbo &ndash; Dachan Bay &ndash; Kelang &ndash; Haifa &ndash; Ashdod &ndash; Istanbul &ndash; Odessa &ndash; Novorossiysk &ndash; Gemlik &ndash; Istanbul &ndash; Haifa &ndash; Mundra &ndash; Colombo &ndash; Kelang &ndash; Pusan. ZIM considers Odessa as important gateway to Ukrainian and CIS markets in addition to Novorossiysk. The EMX deploys 10 ships, including 8 x 4250 TEU and 2 x 3429 TEU.</p>\n<p>\n\tThe new deep-sea service the ZIM have taken slots on is Asia-Black Sea (ABS), &nbsp;offering rotation as follows. Shanghai&ndash; Ningbo &ndash; Shekou &ndash; Singapore &ndash; Kelang &ndash; Piraeus &ndash; Istanbul&ndash; Constanta &ndash; Iliychevsk &ndash; Kelang &nbsp;&ndash; Shanghai.</p>\n<p>\n\tBesides of these two deep-seas, ZIM operates in Black Sea the dedicated feeder services, including Black Sea Ukraine Service (BSU) and Constanta Poti Shuttle</p>\n	<p>\n\tZIM провел апгрейд своих черноморских сервисов. Линия открывает обслуживание на новом совместном deep sea и вводит прямые заходы в Одессу на существующем сервисе.</p>\n<p>\n\tОдесса включается в расписание East Med/Black Sea Express Service (EMX). Новая ротация: Пусан &ndash; Шанхай &ndash; Нинбо &ndash; Дачан-Бей &ndash; Порт-Келанг &ndash; Хайфа &ndash; Ашдод &ndash; Стамбул &ndash; Одесса &ndash; Новороссийск &ndash; Гемлик &ndash; Стамбул &ndash; Хайфа &ndash; Мундра &ndash; Коломбо &ndash; Порт-Келанг &ndash; Пусан. В ZIM рассматривают Одессу как выход на рынки России и СНГ в дополнение к Новороссийску. На EMX работает 10 судов, в том числе 8 вместимостью 4250 TEU и два 3429 TEU.</p>\n<p>\n\tНовый deep sea сервис, Asia-Black Sea (ABS), будет работать в ротации: Шанхай &ndash; Нинбо &ndash; Шекоу &ndash; Сингапур &ndash; Порт-Келанг &ndash; Пирей &ndash; Стамбул &ndash; Констанца &ndash; Ильичевск &ndash; Порт-Келанг &ndash; Шанхай.</p>\n<p>\n\tПомимо deep sea, у ZIM на Черном море работают фидерные сервисы, в том числе Black Sea Ukraine Service (BSU) и Constanta Poti Shuttle</p>\n	<p>\n\tZIM hasupgradeditsBlackSeaservicenetwork. The liner joins a new deep-sea service and commenced direct calls of the existing service to Odessa.</p>\n	<p>\n\t<span style="font-size: 11pt; font-family: Calibri,sans-serif;">ZIM провел апгрейд своих черноморских сервисов. Линия открывает обслуживание на новом совместном deep sea и вводит прямые заходы в Одессу на существующем сервисе. </span></p>\n
2	2012-05-10 19:39:47+04	t			Hanjin reenters Black Sea.	<p>\n\tHanjin will join Coscon and ZIM as a slot charterer on the 9x 5,700 TEU Far East-Black Sea ABX service of China Shipping (5 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 vessel each), which calls at: Piraeus, Istanbul (Ambarli), Constantza, Illichevsk, Port Kelang, Shanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang and back to Piraeus.</p>\n	perevalka-kontejnerov-v-pribaltijskih-2012-05-10-103947	<p>\n\tHanjin will join Coscon and ZIM as a slot charterer on the 9x 5,700 TEU Far East-Black Sea ABX service of China Shipping (5 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 vessel each), which calls at: Piraeus, Istanbul (Ambarli), Constantza, Illichevsk, Port Kelang, Shanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang and back to Piraeus.</p>\n	\N	\N	2012-05-05 09:00:00+04	1777	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hanjin reenters Black Sea.	Перевалка контейнеров в прибалтийских портах	<p>\n\tHanjin will join Coscon and ZIM as a slot charterer on the 9x 5,700 TEU Far East-Black Sea ABX service of China Shipping (5 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 vessel each), which calls at: Piraeus, Istanbul (Ambarli), Constantza, Illichevsk, Port Kelang, Shanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang and back to Piraeus.</p>\n	<p>\n\tВ первом квартале т.г. контейнерооборот портов Прибалтики вырос на 16,7% и составил 236 266 <span lang="EN-US">TEU</span>.</p>\n<p>\n\t<span lang="EN-US">В том числе Клайпеда перевалила 91,1 тыс. TEU (+0,1%), Рига &ndash; 86,9 тыс. TEU (+30,5%). Через Таллин за январь-март т.г. прошло чуть менее 57 тыс. TEU, что превышает аналогичный показатель прошлого года на 28,5%. Лиепая увеличила оборот на 76,2%, объем перевалки составил 962 TEU.</span></p>\n<p>\n\t<span lang="EN-US">Кроме того, вернулись контейнеры в Вентспилс &ndash; 360 TEU. Напомним, в прошлом году порт с контейнерами не работал.</span></p>\n	<p>\n\tHanjin will join Coscon and ZIM as a slot charterer on the 9x 5,700 TEU Far East-Black Sea ABX service of China Shipping (5 ships), &ldquo;K&rdquo; Line, PIL, Wan Hai and Yang Ming (1 vessel each), which calls at: Piraeus, Istanbul (Ambarli), Constantza, Illichevsk, Port Kelang, Shanghai, Ningbo, Shenzhen (Shekou), Singapore, Port Kelang and back to Piraeus.</p>\n	<p>\n\tВ первом квартале т.г. контейнерооборот портов Прибалтики вырос на 16,7% и составил 236 266 <span lang="EN-US">TEU</span>.</p>\n
2	2012-05-13 03:03:51+04	t			Major Carriers Set Asia-Europe Peak-Season Surcharges	<p>\n\t<span style="font-size: 11pt; font-family: Calibri,sans-serif;">Freight rates on westbound trades from Asia to Europe will go up June 1 following peak-season surcharge announcements by major ocean carriers.</span></p>\n	osnovnyie-linejnyie-perevozchiki-soobschili-2012-05-12-180351	<p>\n\tFreight rates on westbound trades from Asia to Europe will go up June 1 following peak-season surcharge announcements by major ocean carriers.</p>\n<p>\n\tMediterranean Shipping Company said it will impose a surcharge of $350 per 20-foot equivalent unit on services from Asia to ports in North Europe, the Mediterranean, Black Sea and North Africa.</p>\n<p>\n\tOrient Overseas Container Line will implement a $300 per TEU surcharge on the same trade routes.</p>\n<p>\n\tIsraeli carrier Zim Integrated Shipping Services will push its rates up with a surcharge of $375 per TEU on all cargo shipped from Asia and the Indian Subcontinent to North Europe and the Mediterranean.</p>\n	\N	\N	2012-05-11 09:00:00+04	1778	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Major Carriers Set Asia-Europe Peak-Season Surcharges	Основные линейные перевозчики сообщили о планах ввода сезонной надбавки на направлении Азия – Европа.	<p>\n\tFreight rates on westbound trades from Asia to Europe will go up June 1 following peak-season surcharge announcements by major ocean carriers.</p>\n<p>\n\tMediterranean Shipping Company said it will impose a surcharge of $350 per 20-foot equivalent unit on services from Asia to ports in North Europe, the Mediterranean, Black Sea and North Africa.</p>\n<p>\n\tOrient Overseas Container Line will implement a $300 per TEU surcharge on the same trade routes.</p>\n<p>\n\tIsraeli carrier Zim Integrated Shipping Services will push its rates up with a surcharge of $375 per TEU on all cargo shipped from Asia and the Indian Subcontinent to North Europe and the Mediterranean.</p>\n	<p>\n\tСогласно сообщениям ряда ведущих контейнерных перевозчиков, с &nbsp;1 июня фрахтовые ставки из Азии в Европу должны увеличится на сумму сезонной надбавки (peak-seasonsurcharge).</p>\n<p>\n\tЛиния MediterraneanShippingCompany сообщила о введении надбавки в размере USD350 за TEUна сервисах из Азии в порты Сев.Европы, Средиземного и Черного морей, и Сев.Африки.</p>\n<p>\n\tOrient Overseas Container Line применит сезонную надбавку USD300 за TEU на тех же направлениях.</p>\n<p>\n\tИзраильская линия Zim поднимет ставки на USD375 за TEU на грузы отправляемые из портов Азиии Индостана на Сев. Европу и Средиземноеморе.</p>\n	<p>\n\t<span style="font-size: 11pt; font-family: Calibri,sans-serif;">Freight rates on westbound trades from Asia to Europe will go up June 1 following peak-season surcharge announcements by major ocean carriers.</span></p>\n	<p style="margin: 0cm 0cm 0.0001pt; background: none repeat scroll 0% 0% white;">\n\t<span style="font-size: 11pt; font-family: Calibri,sans-serif;">Согласно сообщениям ряда ведущих контейнерных перевозчиков, с &nbsp;1 июня фрахтовые ставки из Азии в Европу должны увеличится на сумму сезонной надбавки (</span><span lang="EN-US" style="font-size: 11pt; font-family: Calibri,sans-serif;">peak</span><span style="font-size: 11pt; font-family: Calibri,sans-serif;">-</span><span lang="EN-US" style="font-size: 11pt; font-family: Calibri,sans-serif;">season</span><span lang="EN-US" style="font-size: 11pt; font-family: Calibri,sans-serif;">surcharge</span><span style="font-size: 11pt; font-family: Calibri,sans-serif;">).</span></p>\n
2	2012-06-08 20:51:04+04	t			The new rotation of Ecubex service	<p>\n\tMaersk Line has modified the rotation of its Ecubex service to St.Petersburg. Rotterdam and Bremerhafen have reentered the scope of ports of call, which they left last winter. Moreover direct calls at Antwerp west-bound and in South America at Santa-Marta, Colombia both ways have been added.&nbsp;</p>\n	ecubex-v-novoj-rotatsii-2012-06-08-115104	<p>\n\tMaersk Line has modified the rotation of its Ecubex service to St.Petersburg. Rotterdam and Bremerhafen have reentered the scope of ports of call, which they left last winter. Moreover direct calls at Antwerp west-bound and in South America at Santa-Marta, Colombia both ways have been added. &nbsp;&nbsp;</p>\n<p>\n\tThe new rotation of Ecubex started from May 31st and reads as follows. Guayaquil &ndash; Balboa &ndash; Manzanillo &ndash; Santa-Marta &ndash; Rotterdam &ndash; Hamburg &ndash; Bremehafen &ndash; Saint-Petersburg &ndash; Bremerhafen &ndash; Rotterdam &ndash; Antwerp &ndash; Santa Marta &ndash; Manzanillo &ndash; Balboa &ndash; Guayaquil.</p>\n	\N	\N	2012-06-07 09:00:00+04	1780	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	The new rotation of Ecubex service	Ecubex в новой ротации	<p>\n\tMaersk Line has modified the rotation of its Ecubex service to St.Petersburg. Rotterdam and Bremerhafen have reentered the scope of ports of call, which they left last winter. Moreover direct calls at Antwerp west-bound and in South America at Santa-Marta, Colombia both ways have been added. &nbsp;&nbsp;</p>\n<p>\n\tThe new rotation of Ecubex started from May 31st and reads as follows. Guayaquil &ndash; Balboa &ndash; Manzanillo &ndash; Santa-Marta &ndash; Rotterdam &ndash; Hamburg &ndash; Bremehafen &ndash; Saint-Petersburg &ndash; Bremerhafen &ndash; Rotterdam &ndash; Antwerp &ndash; Santa Marta &ndash; Manzanillo &ndash; Balboa &ndash; Guayaquil.</p>\n	<p>\n\tMaerskLine изменил ротацию своего deepsea сервиса Ecubex на Петербург. В ротацию вернули Роттердам и Бремерхафен, заходы в которые были <a href="https://r.mail.yandex.net/url/oCQhzYZ_Vg1LQm-EpX-7eg,1339143529/www.seanews.ru%2Fnews%2Fnews%2Easp%3FnewsID%3D1014146" target="_blank">отменены зимой</a>. Добавлен судозаход в Антверпен. В маршрут включен новый порт захода в Южной Америке &ndash; Санта-Марта в Колумбии.&nbsp;</p>\n<p>\n\tНовая ротация: Гуаякиль &ndash; Бальбоа &ndash; Мансанильо &ndash; Санта-Марта &ndash; Роттердам &ndash; Гамбург &ndash; Бремерхафен &ndash; Санкт-Петербург &ndash; Бремерхафен &ndash; Роттердам &ndash; Антверпен &ndash; Санта-Марта &ndash; Мансанильо &ndash; Бальбоа &ndash; Гуаякиль.</p>\n<p>\n\tВ новой ротации Ecubex работает с 31 мая.</p>\n	<p>\n\tMaersk Line has modified the rotation of its Ecubex service to St.Petersburg. Rotterdam and Bremerhafen have reentered the scope of ports of call, which they left last winter. Moreover direct calls at Antwerp west-bound and in South America at Santa-Marta, Colombia both ways have been added.&nbsp;</p>\n	<p>\n\tMaerskLine изменил ротацию своего deepsea сервиса Ecubex на Петербург. В ротацию вернули Роттердам и Бремерхафен, заходы в которые были <a href="https://r.mail.yandex.net/url/oCQhzYZ_Vg1LQm-EpX-7eg,1339143529/www.seanews.ru%2Fnews%2Fnews%2Easp%3FnewsID%3D1014146" target="_blank">отменены зимой</a>. Добавлен судозаход в Антверпен. В маршрут включен новый порт захода в Южной Америке &ndash; Санта-Марта в Колумбии.</p>\n
2	2012-07-18 23:01:26+04	t			MSC Sets Peak-Season Surcharge in Asia-Europe Trade	<p>\n\tMediterranean Shipping Co. will impose a peak-season surcharge on westbound trade from Asia to Europe, starting Aug. 1.</p>\n	linii-msc-obyavila-o-2012-07-18-140126	<p>\n\tMediterranean Shipping Co. will impose a peak-season surcharge on westbound trade from Asia to Europe, starting Aug. 1.</p>\n<p>\n\tThe Geneva-based carrier will charge $350 per 20-foot equivalent unit on cargo from Asia to North Europe and the Mediterranean.<br />\n\tThe move follows a similar surcharge announcement by Hapag-Lloyd on Asia-Europe trade lanes, which takes effect Aug. 1 and lasts until Sept. 30.</p>\n<p>\n\tSeparately, MSC said it would apply a $300 per TEU peak-season surcharge on shipments from Asia to Australia, effective Aug. 15.</p>\n	\N	\N	2012-07-13 09:00:00+04	1784	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MSC Sets Peak-Season Surcharge in Asia-Europe Trade	Линии MSC объявила о Сезонной надбавке на направлении Азия – Европа	<p>\n\tMediterranean Shipping Co. will impose a peak-season surcharge on westbound trade from Asia to Europe, starting Aug. 1.</p>\n<p>\n\tThe Geneva-based carrier will charge $350 per 20-foot equivalent unit on cargo from Asia to North Europe and the Mediterranean.<br />\n\tThe move follows a similar surcharge announcement by Hapag-Lloyd on Asia-Europe trade lanes, which takes effect Aug. 1 and lasts until Sept. 30.</p>\n<p>\n\tSeparately, MSC said it would apply a $300 per TEU peak-season surcharge on shipments from Asia to Australia, effective Aug. 15.</p>\n	<p>\n\tMSC собирается применить Сезонную надбавку к грузам следующим из Азии в Европу с 1 августа.</p>\n<p>\n\tЛиния намерена увеличить свои ставки на USD350 за TEU для грузов из портов Дальнего Востока на порты Европы&nbsp; и Средиземного моря.</p>\n<p>\n\tДанное решение последовало после аналогичного заявления линии Hapag-Lloyd о введении надбавки с 1 августа до 30 сентября.</p>\n<p>\n\tДополнительно линия MSC сообщила о применении Сезонной надбавки USD 300 за TEU для отправок из Азии в Австралию, начиная с 15 августа.</p>\n	<p>\n\tMediterranean Shipping Co. will impose a peak-season surcharge on westbound trade from Asia to Europe, starting Aug. 1.</p>\n	<p>\n\tMSC собирается применить Сезонную надбавку к грузам следующим из Азии в Европу с 1 августа.</p>\n
2	2012-07-18 23:03:51+04	t			Container handling results of St.Petersburg port in the H1 2012	<p>\n\tIn the first half of 2012 the largest container port of Russia - St. Petersburg &ndash; handled 1&nbsp;211&nbsp;623 TEU (+1,4% on 2011 YoY).</p>\n	itogi-perevalki-kontejnerov-v-2012-07-18-140351	<p>\n\tIn the first half of 2012 the largest container port of Russia - St. Petersburg &ndash; handled 1&nbsp;211&nbsp;623 TEU (+1,4% on 2011 YoY).</p>\n<p>\n\tThe volume of imported containers went up by 5,2% to 603&nbsp;590 TEU, exports grew to 273&nbsp;058 TEU by 12,5%.</p>\n<p>\n\tContainer throughput of the main terminals in St. Petersburg port was as follows.</p>\n<p>\n\tFCT 524&nbsp;635 TEU (-12,2%)</p>\n<p>\n\tPLP 408&nbsp;857 (+3,4%)</p>\n<p>\n\tCT StP. 128&nbsp;544 TEU (x3,3 times)</p>\n<p>\n\tMobi Dik &nbsp;108&nbsp;848 TEU (-4,6%)</p>\n	\N	\N	2012-07-17 09:00:00+04	1786	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Container handling results of St.Petersburg port in the H1 2012	Итоги перевалки контейнеров в Большом порту Санкт-Петербурга за 1 полугодие 2012.	<p>\n\tIn the first half of 2012 the largest container port of Russia - St. Petersburg &ndash; handled 1&nbsp;211&nbsp;623 TEU (+1,4% on 2011 YoY).</p>\n<p>\n\tThe volume of imported containers went up by 5,2% to 603&nbsp;590 TEU, exports grew to 273&nbsp;058 TEU by 12,5%.</p>\n<p>\n\tContainer throughput of the main terminals in St. Petersburg port was as follows.</p>\n<p>\n\tFCT 524&nbsp;635 TEU (-12,2%)</p>\n<p>\n\tPLP 408&nbsp;857 (+3,4%)</p>\n<p>\n\tCT StP. 128&nbsp;544 TEU (x3,3 times)</p>\n<p>\n\tMobi Dik &nbsp;108&nbsp;848 TEU (-4,6%)</p>\n	<p>\n\tВ первом полугодии 2012 года Санкт-Петербургский порт обработал 1&nbsp;211&nbsp;623 TEU (+1,4% к 1 пг 2012).</p>\n<p>\n\tОбъем импорта через Петербург вырос на 5,2% до 603&nbsp;590 TEU, в то время как экспорт увеличился до 273&nbsp;058 TEU, на 12,5% по сравнению с 2011 годом.</p>\n<p>\n\tПеревалка контейнеров на терминалах Санкт-Петербурга составила в первом полугодии:</p>\n<p>\n\tПКТ 524&nbsp;635 TEU (-12,2%)</p>\n<p>\n\tПЛП 408 857 (+3,4%)</p>\n<p>\n\tКТСПб 128&nbsp;544 TEU (x 3,3 раза)</p>\n<p>\n\tМоби Дик 108&nbsp;848 TEU (-4,6%)</p>\n	<p>\n\tIn the first half of 2012 the largest container port of Russia - St. Petersburg &ndash; handled 1&nbsp;211&nbsp;623 TEU (+1,4% on 2011 YoY).</p>\n	<p>\n\tВ первом полугодии 2012 года Санкт-Петербургский порт обработал 1&nbsp;211&nbsp;623 TEU (+1,4% к 1 пг 2012).</p>\n
2	2012-07-19 03:24:36+04	t			Another GRI of Maersk	<p>\n\tMaersk Line is going to implement another round of GRIs on Asia-N.Continent/Mediterranean. As per announcement of the line the increase must take place from the August 1st, by USD250 for 20&rsquo; and USD500 for 40&rsquo; and 45&rsquo; containers.</p>\n	novyij-gri-maersk-2012-07-18-182436	<p>\n\tMaersk Line is going to implement another round of GRIs on Asia-N.Continent/Mediterranean. As per announcement of the line the increase must take place from the August 1st, by USD250 for 20&rsquo; and USD500 for 40&rsquo; and 45&rsquo; containers. &nbsp;</p>\n<p>\n\tA month later, from September 1st, the carrier is going to increase its freight rates from Middle East and Indian Sub-cont to N.Continent and Mediterranean ports. The quantum of this increase will be USD200 per 20&rsquo; and USD400 per 40&rsquo;.</p>\n	\N	\N	2012-07-18 09:00:00+04	1788	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Another GRI of Maersk	Новый GRI Maersk	<p>\n\tMaersk Line is going to implement another round of GRIs on Asia-N.Continent/Mediterranean. As per announcement of the line the increase must take place from the August 1st, by USD250 for 20&rsquo; and USD500 for 40&rsquo; and 45&rsquo; containers. &nbsp;</p>\n<p>\n\tA month later, from September 1st, the carrier is going to increase its freight rates from Middle East and Indian Sub-cont to N.Continent and Mediterranean ports. The quantum of this increase will be USD200 per 20&rsquo; and USD400 per 40&rsquo;.</p>\n	<p>\n\tMaersk Line вводит очередной GRI на перевозках из Азии на Северную Европу и Средиземноморье. Как сообщили в компании, ставки повышаются с 1 августа. Повышение составит 250 долл. c 20&rsquo; и 500 долл. с 40&rsquo; и 45&#39; high cube контейнера.</p>\n<p>\n\tМесяцем позже, с 1 сентября, линия повышает ставки на Северную Европу и Средиземноморье с Ближнего Востока и Индийского субконтинента. Размер GRI составит 200 долл. с 20&rsquo; и 400 долл. с 40&rsquo; контейнера.</p>\n	<p>\n\tMaersk Line is going to implement another round of GRIs on Asia-N.Continent/Mediterranean. As per announcement of the line the increase must take place from the August 1st, by USD250 for 20&rsquo; and USD500 for 40&rsquo; and 45&rsquo; containers.</p>\n	<p>\n\tMaersk Line вводит очередной GRI на перевозках из Азии на Северную Европу и Средиземноморье. Как сообщили в компании, ставки повышаются с 1 августа. Повышение составит 250 долл. c 20&rsquo; и 500 долл. с 40&rsquo; и 45&#39; high cube контейнера.</p>\n
2	2012-08-21 21:09:56+04	t			Evergreen launches new Asia-Europe service	<p>\n\tEvergreen has confirmed that its new CEM service between Asia and Northern Europe will start this week.</p>\n	liniya-evergreen-zapuskaet-novyij-2012-08-21-120956	<p>\n\t&nbsp;</p>\n<p>\n\tEvergreen has confirmed that its new CEM service between Asia and Northern Europe will start this week.</p>\n<p>\n\tIt will be run in partnership with Hanjin instead of CSCL, and Evergreen will simultaneously withdraw from its joint CEM/AEX1 service with CSCL.<br />\n\t<br />\n\tThis will leave CSCL to run the AEX1 service on its own, along with its present slot charterers Zim Line and CMA CGM, which was the situation that existed last year prior to the merger of Evergreen&rsquo;s CEM service with it.<br />\n\t<br />\n\tThe net effect is that a whole new string is coming back into the tradelane at a time when it least needs it. Approximately 4% westbound capacity will be added to that on offer from all carriers on 1 July, despite cargo growth remaining flat, and average westbound vessel utilisation sitting uncomfortably at around 84% beforehand.<br />\n\t<br />\n\tNot surprisingly, ocean carriers&rsquo; have been struggling with their latest attempts to increase westbound freight rates again on 1 August.<br />\n\t<br />\n\tEvergreen could, presumably, find no other home for its new 8,000 teu vessels currently being delivered. According to its latest schedules, the new CEM service (named CUS by Hanjin) will continue calling at Shanghai, Ningbo, Yantian, Felixstowe, Hamburg, Rotterdam, Hong Kong and Shanghai and deploy nine vessels. Evergreen will provide five of these averaging 8,000 teu&nbsp;plus two averaging 10,100 teu&nbsp;chartered from Zim Line, and Hanjin will provide two averaging 10,000 teu.<br />\n\t<br />\n\tAs Hanjin operates within the CKYH alliance, with which Evergreen has a vessel sharing agreement, it seems safe to assume that fellow alliance members Coscon, K Line and Yang Ming will also share space on the new service.<br />\n\t<br />\n\tNo details are yet available on CSCL&rsquo;s intentions, but according to reliable sources, no change in its current AEX1 schedule is planned.</p>\n	\N	\N	2012-08-20 09:00:00+04	1793	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Evergreen launches new Asia-Europe service	Линия Evergreen запускает новый сервис на направлении Азия – Европа	<p>\n\t&nbsp;</p>\n<p>\n\tEvergreen has confirmed that its new CEM service between Asia and Northern Europe will start this week.</p>\n<p>\n\tIt will be run in partnership with Hanjin instead of CSCL, and Evergreen will simultaneously withdraw from its joint CEM/AEX1 service with CSCL.<br />\n\t<br />\n\tThis will leave CSCL to run the AEX1 service on its own, along with its present slot charterers Zim Line and CMA CGM, which was the situation that existed last year prior to the merger of Evergreen&rsquo;s CEM service with it.<br />\n\t<br />\n\tThe net effect is that a whole new string is coming back into the tradelane at a time when it least needs it. Approximately 4% westbound capacity will be added to that on offer from all carriers on 1 July, despite cargo growth remaining flat, and average westbound vessel utilisation sitting uncomfortably at around 84% beforehand.<br />\n\t<br />\n\tNot surprisingly, ocean carriers&rsquo; have been struggling with their latest attempts to increase westbound freight rates again on 1 August.<br />\n\t<br />\n\tEvergreen could, presumably, find no other home for its new 8,000 teu vessels currently being delivered. According to its latest schedules, the new CEM service (named CUS by Hanjin) will continue calling at Shanghai, Ningbo, Yantian, Felixstowe, Hamburg, Rotterdam, Hong Kong and Shanghai and deploy nine vessels. Evergreen will provide five of these averaging 8,000 teu&nbsp;plus two averaging 10,100 teu&nbsp;chartered from Zim Line, and Hanjin will provide two averaging 10,000 teu.<br />\n\t<br />\n\tAs Hanjin operates within the CKYH alliance, with which Evergreen has a vessel sharing agreement, it seems safe to assume that fellow alliance members Coscon, K Line and Yang Ming will also share space on the new service.<br />\n\t<br />\n\tNo details are yet available on CSCL&rsquo;s intentions, but according to reliable sources, no change in its current AEX1 schedule is planned.</p>\n	<p>\n\t&nbsp;</p>\n<p>\n\tEvergreen подтвердил, что&nbsp;новый&nbsp;сервис&nbsp;СEM между Азией и Северной Европой запускается на этой неделе.</p>\n<p>\n\tСервис будет обслуживаться в партнерстве с линией Hanjin &nbsp;при этом Evergreen&nbsp;одновременно прекращает свое участие в совместном с линией CSCL сервисе CEM/AEX1.<br />\n\t<br />\n\tЭто фактически оставит СSCLв одиночку обеспечивать работу AEX1, вместе лишь со слот-операторами ZIM и CMACGM. Таким образом для CSCLситуация вернется к прошлогодней, до объединения с сервисом CEMЭвергрина. &nbsp;<br />\n\t<br />\n\tВ совокупном результате на рынок возвращается новый полноценный сервис, в момент когда он там наименее востребован. При этом провозная способность на направлении Азия &ndash; Европа увеличится на 4% при фактически нулевом росте рынка и достаточно невысокой степени использования флота &ndash; около 84% - на данном направлении.<br />\n\t<br />\n\tНе удивительно при этом, что океанские перевозчики не смогли реализовать ранее объявленные повышения ставок фрахта с 1 августа.</p>\n<p>\n\t<br />\n\tНаиболее вероятно, что Evergreen не мог найти лучшего применения своим новым судам вместимостью 8,000 TEU, принимаемым сейчас в эксплуатацию. Согласно последним расписаниям, новый сервис CEM (CUSу Hanjin) продолжит заходить в Шанхай, Нингбо, Яньтянь, Феликстоу, Гамбург, Роттердам, Гонконг и Шанхай, используя девять судов. Evergreen&nbsp;предоставит пять из них со средней вместимостью 8,000 teu&nbsp;и ещё два &ndash; с вместимостью 10,100 teu&nbsp;(зафрахтованных у ZimLine), Hanjinпоставит два судна вместимостью 10,000 teu.<br />\n\t<br />\n\tПоскольку Hanjin&nbsp;работает в составе альянса CKYH, с которым в рамках ряде сервисов также сотрудничает Evergreen, не сложно предположить, что другие члены данного альянса - Coscon, KLineи YangMing&ndash; также воспользуются слотами на новом сервисе. &nbsp;<br />\n\t<br />\n\tОтносительно дальнейших планов CSCL информация отсутствует, однако согласно имеющимся источникам сервис AEX1 останется без изменений.</p>\n	<p>\n\tEvergreen has confirmed that its new CEM service between Asia and Northern Europe will start this week.</p>\n	<p>\n\tEvergreen&nbsp;подтвердил,&nbsp;что&nbsp;новый&nbsp;сервис&nbsp;СEM между Азией и Северной Европой запускается на этой неделе.</p>\n
2	2012-09-24 18:58:21+04	t			New feeder operator in Novorossiysk	<p>\n\tX-Press Feeders has launched its Black Sea Xpress (BSX) feeder service. The service is joint operation of X-Press and Evergreen, each providing one vessel.</p>\n	novyij-fidernyij-operator-v-2012-09-24-095821	<p>\n\tX-Press Feeders has launched its Black Sea Xpress (BSX) feeder service. The service is joint operation of X-Press and Evergreen, each providing one vessel.</p>\n<p>\n\tPort rotation is Piraeus &ndash; Novorossiysk &ndash; Odessa &ndash; Constanta &ndash; Varna &ndash; Istanbul &ndash; Piraeus. The service offers fixed day weekly calls at the NUTEP terminal.</p>\n<p>\n\tThe service is manned with m/v &ldquo;Calisto&rdquo; and m/v &ldquo;CS.Star&rdquo;, capacity 1600 TEU and 1100 TEU respectively.</p>\n<p>\n\tThe agent of X-Press in Russia is Russian Container Company (RCC) Ltd. The first called at Novorossiysk was made on Sept. 13th.</p>\n	\N	\N	2012-09-12 09:00:00+04	1794	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	New feeder operator in Novorossiysk	Новый фидерный оператор в Новороссийске	<p>\n\tX-Press Feeders has launched its Black Sea Xpress (BSX) feeder service. The service is joint operation of X-Press and Evergreen, each providing one vessel.</p>\n<p>\n\tPort rotation is Piraeus &ndash; Novorossiysk &ndash; Odessa &ndash; Constanta &ndash; Varna &ndash; Istanbul &ndash; Piraeus. The service offers fixed day weekly calls at the NUTEP terminal.</p>\n<p>\n\tThe service is manned with m/v &ldquo;Calisto&rdquo; and m/v &ldquo;CS.Star&rdquo;, capacity 1600 TEU and 1100 TEU respectively.</p>\n<p>\n\tThe agent of X-Press in Russia is Russian Container Company (RCC) Ltd. The first called at Novorossiysk was made on Sept. 13th.</p>\n	<p>\n\tX-PressFeeders запускает черноморский фидерный сервис BSX. По сути, речь идет о совместном оперировании на сервисе BSF линии Evergreen, на который X-Press ставит второе судно.</p>\n<p>\n\tРотация: Пирей &ndash; Новороссийск &ndash; Одесса &ndash; Констанца &ndash; Варна &ndash; Стамбул. Частота судозаходов &ndash; еженедельно по фиксированным дням.</p>\n<p>\n\tВ новом раскладе сервис работает с 8 сентября. На сервисе заняты контейнеровозы &laquo;Calisto&raquo; и &laquo;C.S.Star&raquo; номинальной грузовместимостью 1600 и 1100 TEU соответственно.</p>\n<p>\n\tАгентом X-Press в России выступает X-Press Feeders Russian Container Company (RCC) Ltd. Первый судозаход (т/х &laquo;Calisto&raquo;) в Новороссийск намечен на 13 сентября. Суда будут обрабатываться на терминале НУТЭП.</p>\n	<p>\n\tX-Press Feeders has launched its Black Sea Xpress (BSX) feeder service. The service is joint operation of X-Press and Evergreen, each providing one vessel.</p>\n	<p>\n\tX-PressFeeders запускает черноморский фидерный сервис BSX. По сути, речь идет о совместном оперировании на сервисе BSF линии Evergreen, на который X-Press ставит второе судно.</p>\n
2	2012-10-18 03:18:31+04	t			CMA CGM launches a dedicated citrus service to Novorossiysk	<p style="margin:0cm;margin-bottom:0.0001pt;">\n\tCMA CGM announced about start of the new citrus services CITRUS EXPRESS to the port of Novorossiysk.</p>\n	cma-cgm-otkryivaet-tsitrusovyij-2012-10-17-181831	<p>\n\tCMA CGM announced about start of the new citrus services CITRUS EXPRESS to the port of Novorossiysk.</p>\n<p>\n\tThe service will provide for transportation of citrus fruits form Turkey and Egypt. The weekly fixed-day service will use three 1100 TEU vessels.</p>\n<p>\n\t&nbsp;Rotation from the first call on Nov. 2nd will be as follows. Port Said &ndash; Mersin &ndash; Istanbul &ndash; Novorossiysk &ndash; Gemlik &ndash; Port Said. From mid-February when export season of citrus in Turkey is expected to end, while it starts in Egypt, the service rotation can be revised to &nbsp;Damietta &ndash; Istanbul &ndash; Novorossiysk &ndash; Gemlik &ndash; Port Said.&nbsp; It will take five days to deliver container from Mersin to Novorossiysk, and seven days - from Damietta to Novorossiysk.</p>\n	\N	\N	2012-10-12 09:00:00+04	1797	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	CMA CGM launches a dedicated citrus service to Novorossiysk	CMA CGM открывает цитрусовый сервис на Новороссийск	<p>\n\tCMA CGM announced about start of the new citrus services CITRUS EXPRESS to the port of Novorossiysk.</p>\n<p>\n\tThe service will provide for transportation of citrus fruits form Turkey and Egypt. The weekly fixed-day service will use three 1100 TEU vessels.</p>\n<p>\n\t&nbsp;Rotation from the first call on Nov. 2nd will be as follows. Port Said &ndash; Mersin &ndash; Istanbul &ndash; Novorossiysk &ndash; Gemlik &ndash; Port Said. From mid-February when export season of citrus in Turkey is expected to end, while it starts in Egypt, the service rotation can be revised to &nbsp;Damietta &ndash; Istanbul &ndash; Novorossiysk &ndash; Gemlik &ndash; Port Said.&nbsp; It will take five days to deliver container from Mersin to Novorossiysk, and seven days - from Damietta to Novorossiysk.</p>\n	<p>\n\tCMA CGM запускает новый сезонный цитрусовый сервис Citrus Express на Новороссийск.</p>\n<p>\n\tCервис будет обеспечивать поставки цитрусовых из Турции и Египта. На еженедельном сервисе с фиксированными судозаходами будет работать три судна вместимостью 1100 TEU.</p>\n<p>\n\tРотация со 2 ноября 2012 будет следующей: Порт-Саид &ndash; Мерсин &ndash; Стамбул (Амбарли) &ndash; Новороссийск &ndash; Гемлик &ndash; Порт-Саид. C середины февраля, когда в Турции сезон экспорта цитрусовых заканчивается, а в Египте начинается, планируется переориентировать сервис на следующую ротацию: Дамьетта &ndash; Стамбул &ndash; Новороссийск &ndash; Гемлик &ndash; Порт-Саид &ndash; Дамьетта. Время транзита из Мерсина на Новороссийск составит 5 дней, из Дамьетты на Новороссийск &ndash; 7 дней.</p>\n	<p style="margin:0cm;margin-bottom:0.0001pt;">\n\tCMA CGM announced about start of the new citrus services CITRUS EXPRESS to the port of Novorossiysk.</p>\n	<p>\n\tCMA CGM запускает новый сезонный цитрусовый сервис Citrus Express на Новороссийск.</p>\n
2	2012-10-18 04:01:55+04	t			Maersk launches a dedicated reefer service to Novorossiysk	<p>\n\tSeago Line, the regional carrier within Maersk structure, is going to launch a dedicated reefer service to the port of Novorossiysk.</p>\n	maersk-zapuskaet-refservis-na-2012-10-17-190155	<p>\n\tSeago Line, the regional carrier within Maersk structure, is going to launch a dedicated reefer service to the port of Novorossiysk.</p>\n<p>\n\tThe service is going to cater for seasonal volumes of fresh fruits from Israel and citrus from Turkey, as well as dry cargoes from the same regions.</p>\n<p>\n\t&nbsp;The service will be manned with two 600 TEU ships. Port rotation will be: Ashdod &ndash; Mersin &ndash; Novorossiysk &ndash; Ashdod. In Novorossiysk Seago vessels will be calling at the NUTEP terminal.</p>\n<p>\n\tThe maiden call of the service is scheduled on Nov. 14th.</p>\n<p>\n\tIn the previous season of 2011/until June 2012 Seago operated another dedicated reefer service to Novorossiysk, covering at that time Ashdod and Port Said.</p>\n	\N	\N	2012-10-16 09:00:00+04	1798	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk launches a dedicated reefer service to Novorossiysk	Maersk запускает рефсервис на Новороссийск	<p>\n\tSeago Line, the regional carrier within Maersk structure, is going to launch a dedicated reefer service to the port of Novorossiysk.</p>\n<p>\n\tThe service is going to cater for seasonal volumes of fresh fruits from Israel and citrus from Turkey, as well as dry cargoes from the same regions.</p>\n<p>\n\t&nbsp;The service will be manned with two 600 TEU ships. Port rotation will be: Ashdod &ndash; Mersin &ndash; Novorossiysk &ndash; Ashdod. In Novorossiysk Seago vessels will be calling at the NUTEP terminal.</p>\n<p>\n\tThe maiden call of the service is scheduled on Nov. 14th.</p>\n<p>\n\tIn the previous season of 2011/until June 2012 Seago operated another dedicated reefer service to Novorossiysk, covering at that time Ashdod and Port Said.</p>\n	<p>\n\tSeago Line, региональный перевозчик в составе Maersk, запускает рефсервис на Новороссийск. Сервис будет сезонным, основной грузопоток составят овощи и фрукты из Израиля и цитрусовые из Турции, кроме того, планируются стандартные грузы из Турции и Израиля.</p>\n<p>\n\tНа сервисе будет задействовано два судна вместимостью 600 TEU каждое. Ротация: Ашдод &ndash; Мерсин &ndash; Новороссийск &ndash; Ашдод. В Новороссийске суда будут заходить на терминал НУТЭП. Первый судозаход планируется 14 ноября.</p>\n<p>\n\tВ прошлом сезоне 2011/12 годов, до июня Seago также оперировал рефсервиса на Новороссийск, который работал в другой ротации &ndash; через Ашдод и Порт-Саид.</p>\n	<p>\n\tSeago Line, the regional carrier within Maersk structure, is going to launch a dedicated reefer service to the port of Novorossiysk.</p>\n	<p>\n\tSeago Line, региональный перевозчик в составе Maersk, запускает рефсервис на Новороссийск. Сервис будет сезонным, основной грузопоток составят овощи и фрукты из Израиля и цитрусовые из Турции, кроме того, планируются стандартные грузы из Турции и Израиля.</p>\n
2	2012-10-25 21:50:48+04	t			Hapag-Lloyd has announced winter surcharge to the ports of St.Petersburg and Ust-Luga	<p>\n\tHapag-Lloyd is one of the first carriers to have announced Winter surcharge to St.Petersburg and Ust-Luga in the new season.</p>\n	hapag-lloyd-obyavil-zimnyuyu-nadbavku-2012-10-25-125048	<p>\n\tHapag-Lloyd is one of the first carriers to have announced Winter surcharge to St.Petersburg and Ust-Luga in the new season.</p>\n<p>\n\tThe surcharge will amount to USD100 per TEU in the USD denominated trades, and EUR75 per TEU in the Euro-denominated ones.</p>\n<p>\n\tThe Winter surcharge will be valid for the period from Dec. 1st 2012 till Apr. 30rd 2013.</p>\n	\N	\N	2012-10-19 09:00:00+04	1800	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Lloyd has announced winter surcharge to the ports of St.Petersburg and Ust-Luga	Hapag-Lloyd объявил зимнюю надбавку на Санкт-Петербург и Усть-Лугу	<p>\n\tHapag-Lloyd is one of the first carriers to have announced Winter surcharge to St.Petersburg and Ust-Luga in the new season.</p>\n<p>\n\tThe surcharge will amount to USD100 per TEU in the USD denominated trades, and EUR75 per TEU in the Euro-denominated ones.</p>\n<p>\n\tThe Winter surcharge will be valid for the period from Dec. 1st 2012 till Apr. 30rd 2013.</p>\n	<p>\n\tHapag-Lloyd, одной из первых линий в новом сезоне, объявил зимнюю надбавку на Петербург &ndash; и на Усть-Лугу.</p>\n<p>\n\tРазмер надбавки составит 100 долл. с TEU на трейдах, где ставки рассчитываются в долларах, и 75 евро с TEU на тех трейдах, где расчет ведется в евро.</p>\n<p>\n\tСрок действия надбавки &ndash; с 1 декабря 2012 по 30 апреля 2013.</p>\n	<p>\n\tHapag-Lloyd is one of the first carriers to have announced Winter surcharge to St.Petersburg and Ust-Luga in the new season.</p>\n	<p>\n\tHapag-Lloyd, одной из первых линий в новом сезоне, объявил зимнюю надбавку на Петербург &ndash; и на Усть-Лугу.</p>\n
2	2012-11-16 23:12:33+04	t			Maersk Line has announced Winter Surcharge for St.Petersburg and Ust-Luga ports.	<p>\n\tMaersk has announced Winter Surcharge for shipments to the ports of St.Petersburg and Ust-Luga. The surcharge will apply from December 1st&nbsp; and will amount to USD 125 per 20&rsquo; and USD 250 per 40&rsquo; container.</p>\n	maersk-winter-surcharge-na-2012-11-16-131233	<p>\n\tMaersk has announced Winter Surcharge for shipments to the ports of St.Petersburg and Ust-Luga. The surcharge will apply from December 1st&nbsp; and will amount to USD 125 per 20&rsquo; and USD 250 per 40&rsquo; container.</p>\n<p>\n\tThe winter surcharge has already been introduced by Delta Shipping, Team Lines, Unifeeder, Seago Line and other carriers too.</p>\n	\N	\N	2012-11-13 10:00:00+04	1802	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Maersk Line has announced Winter Surcharge for St.Petersburg and Ust-Luga ports.	Maersk Winter Surcharge на СПб и Усть-Лугу	<p>\n\tMaersk has announced Winter Surcharge for shipments to the ports of St.Petersburg and Ust-Luga. The surcharge will apply from December 1st&nbsp; and will amount to USD 125 per 20&rsquo; and USD 250 per 40&rsquo; container.</p>\n<p>\n\tThe winter surcharge has already been introduced by Delta Shipping, Team Lines, Unifeeder, Seago Line and other carriers too.</p>\n	<p>\n\tMaersk объявил зимнюю надбавку на Санкт-Петербург и Усть-Лугу. Надбавка будет действовать с 1 декабря и составит 125 долларов с 20-футового и 250 долларов с 40-футового контейнера.</p>\n<p>\n\tРанее зимнюю надбавку ввели Delta Shipping, Team Lines, Unifeeder, Seago Line и другие линии.</p>\n	<p>\n\tMaersk has announced Winter Surcharge for shipments to the ports of St.Petersburg and Ust-Luga. The surcharge will apply from December 1st&nbsp; and will amount to USD 125 per 20&rsquo; and USD 250 per 40&rsquo; container.</p>\n	<p>\n\tMaersk объявил зимнюю надбавку на Санкт-Петербург и Усть-Лугу. Надбавка будет действовать с 1 декабря и составит 125 долларов с 20-футового и 250 долларов с 40-футового контейнера.</p>\n
2	2012-11-30 21:23:59+04	t			Service of Samskip to St.Petersburg	<p>\n\tSamskip Multimodal Container Logistics has launched a short-sea&nbsp;service from Rotterdam to Russia. Regular calls are offered to the FCT terminals, other ports on rotation include Stockholm, Sundsvall and Umea.</p>\n	sovmestnyij-servis-samskip-na-2012-11-30-112359	<p>\n\tSamskip Multimodal Container Logistics has launched a short-sea&nbsp;service from Rotterdam to Russia. Regular calls are offered to the FCT terminals, other ports on rotation include Stockholm, Sundsvall and Umea. &nbsp;</p>\n<p>\n\tThe service is jointly run by Samskip and SCA Transforest and is manned with two chartered ships of 1000 TEU.</p>\n<p>\n\tBy launching the new service Samskip starts offering the only in the market direct call from Stockholm to St.Petersburg.</p>\n<p>\n\tTransit time from Rotterdam to St.Petersburg is 5 days, from Stockholm to St.Petersburg &ndash; 1 day. Frequency of calls &ndash; weekly.</p>\n	\N	\N	2012-11-22 10:00:00+04	1804	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Service of Samskip to St.Petersburg	Совместный сервис Samskip на Петербург	<p>\n\tSamskip Multimodal Container Logistics has launched a short-sea&nbsp;service from Rotterdam to Russia. Regular calls are offered to the FCT terminals, other ports on rotation include Stockholm, Sundsvall and Umea. &nbsp;</p>\n<p>\n\tThe service is jointly run by Samskip and SCA Transforest and is manned with two chartered ships of 1000 TEU.</p>\n<p>\n\tBy launching the new service Samskip starts offering the only in the market direct call from Stockholm to St.Petersburg.</p>\n<p>\n\tTransit time from Rotterdam to St.Petersburg is 5 days, from Stockholm to St.Petersburg &ndash; 1 day. Frequency of calls &ndash; weekly.</p>\n	<p>\n\tSamskip Multimodal Container Logistics открыл short sea&nbsp;сервис из Роттердама на Россию. Cудозаходы в Петербурге в регулярном режиме осуществляются на ПКТ. В ротацию входят также шведские порты Стокгольм, Сундсваль и Умео.</p>\n<p>\n\tСервис является совместным с партнером, компанией SCA Transforest. На нем заняты два зафрахтованных судна вместимостью 1 тыс. TEU.</p>\n<p>\n\tНовый сервис является единственным на рынке, предлагающим прямые заходы&nbsp;из Стокгольма&nbsp;в Петербург. Время транзита&nbsp;из Роттердама до Петербурга составляет 5 дней, из Стокгольма до Петербурга &ndash; один день. Частота судозаходов &ndash; еженедельно.</p>\n	<p>\n\tSamskip Multimodal Container Logistics has launched a short-sea&nbsp;service from Rotterdam to Russia. Regular calls are offered to the FCT terminals, other ports on rotation include Stockholm, Sundsvall and Umea.</p>\n	<p>\n\tSamskip Multimodal Container Logistics открыл short sea&nbsp;сервис из Роттердама на Россию. Cудозаходы в Петербурге в регулярном режиме осуществляются на ПКТ. В ротацию входят также шведские порты Стокгольм, Сундсваль и Умео.</p>\n
2	2013-02-07 18:01:26+04	t			The Novorossiysk service of Seago is changing rotation.	<p>\n\tThe regional carrier Seago Line, belonging to Maersk group, is changing rotation of its Black Sea reefer service.</p>\n	novorossijskij-servis-seago-izmenyaet-2013-02-07-080126	<p>\n\t&nbsp;</p>\n<p>\n\tThe regional carrier Seago Line, belonging to Maersk group, is changing rotation of its Black Sea reefer service.</p>\n<p>\n\tMersin port is suspended from the rotation, while a call at Port Said is added.</p>\n<p>\n\tThe changes are caused by the end of reefer season in Turkey and its start from Egypt.</p>\n<p>\n\tThe new rotation of the service looks as follows: Port Said &ndash; Ashdod &ndash; Novorossiysk &ndash; Port Said.</p>\n<p>\n\tThe first sailing from Port Said accordingly to official notice of the line is expected on Feb. 11<sup>th</sup>, first arrival to Novorossiysk &ndash; on Feb. 17<sup>th</sup>.</p>\n	\N	\N	2013-01-30 10:00:00+04	1806	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	The Novorossiysk service of Seago is changing rotation.	Новороссийский сервис Seago изменяет ротацию	<p>\n\t&nbsp;</p>\n<p>\n\tThe regional carrier Seago Line, belonging to Maersk group, is changing rotation of its Black Sea reefer service.</p>\n<p>\n\tMersin port is suspended from the rotation, while a call at Port Said is added.</p>\n<p>\n\tThe changes are caused by the end of reefer season in Turkey and its start from Egypt.</p>\n<p>\n\tThe new rotation of the service looks as follows: Port Said &ndash; Ashdod &ndash; Novorossiysk &ndash; Port Said.</p>\n<p>\n\tThe first sailing from Port Said accordingly to official notice of the line is expected on Feb. 11<sup>th</sup>, first arrival to Novorossiysk &ndash; on Feb. 17<sup>th</sup>.</p>\n	<p>Seago Line, региональный перевозчик в составе Maersk, меняет ротацию своего черноморского рефсервиса. Снимается судозаход в турецкий Мерсин, добавляется судозаход в египетский Порт-Саид. Изменения связаны с завершением цитрусового сезона в Турции и началом сезона в Египте.\n<p>\nНовая ротация: Порт-Саид – Ашдод – Новороссийск – Порт-Саид. Первое отправление из Порт-Саида, согласно официальному нотису, ориентировочно намечено на 11 февраля, прибытие в Новороссийск – 17 февраля.\n	<p>\n\tThe regional carrier Seago Line, belonging to Maersk group, is changing rotation of its Black Sea reefer service.</p>\n	Seago Line, региональный перевозчик в составе Maersk, меняет ротацию своего черноморского рефсервиса. Снимается судозаход в турецкий Мерсин, добавляется судозаход в египетский Порт-Саид. Изменения связаны с завершением цитрусового сезона в Турции и началом сезона в Египте.\n
2	2012-02-06 18:25:55+04	t			MSC to Raise Asia-Europe Charges By $775	Mediterranean Shipping raised the stakes in the container ship carrier bid to pump up rates on depressed Asia-Europe lanes on Thursday, adding $775 to its charges effective March 1. 	msc-povyishaet-stavki-na-2012-02-06-082555	<p>\n\tMediterranean Shipping raised the stakes in the container ship carrier bid to pump up rates on depressed Asia-Europe lanes on Thursday, adding $775 to its charges effective March 1.</p>\n<p>\n\tMSC said what it called a rate surcharge included a $525 emergency bunker surcharge to cover rising fuel costs and a $225 &ldquo;emergency rate restoration&rdquo; charge.</p>\n<p>\n\tThe total $775 increase would more than&nbsp;<a href="http://www.joc.com/trade-lanes/asia-europe-rates-fourth-week-straight" target="_blank">double the latest spot market rates on Asia-Europe lanes</a>, measured by various rate indexes, mirroring a&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-hikes-india-middle-east-europe-rates" target="_blank">general rate increase Maersk Line announced this week</a>&nbsp;that takes effect March 1.</p>\n<p>\n\tMSC&rsquo;s rate hikes apply to shipments from Japan, Korea, China, Hong Kong, Taiwan, Singapore, Indonesia, Thailand, Vietnam, Malaysia and Bangladesh, to destinations in Europe, including the U.K., the Baltic, Adriatic, Mediterranean, Black Sea and North Africa.</p>\n	\N	\N	2012-02-02 10:00:00+04	1745	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	MSC to Raise Asia-Europe Charges By $775	MSC повышает ставки на направлении Азия – Европа на $775	<p>\n\tMediterranean Shipping raised the stakes in the container ship carrier bid to pump up rates on depressed Asia-Europe lanes on Thursday, adding $775 to its charges effective March 1.</p>\n<p>\n\tMSC said what it called a rate surcharge included a $525 emergency bunker surcharge to cover rising fuel costs and a $225 &ldquo;emergency rate restoration&rdquo; charge.</p>\n<p>\n\tThe total $775 increase would more than&nbsp;<a href="http://www.joc.com/trade-lanes/asia-europe-rates-fourth-week-straight" target="_blank">double the latest spot market rates on Asia-Europe lanes</a>, measured by various rate indexes, mirroring a&nbsp;<a href="http://www.joc.com/trade-lanes/maersk-hikes-india-middle-east-europe-rates" target="_blank">general rate increase Maersk Line announced this week</a>&nbsp;that takes effect March 1.</p>\n<p>\n\tMSC&rsquo;s rate hikes apply to shipments from Japan, Korea, China, Hong Kong, Taiwan, Singapore, Indonesia, Thailand, Vietnam, Malaysia and Bangladesh, to destinations in Europe, including the U.K., the Baltic, Adriatic, Mediterranean, Black Sea and North Africa.</p>\n	<p>\n\tЛиния MSC повысила шансы на успех в попытке контейнерных перевозчиков значительно увеличить ставки на направлении Азия &ndash; Европа, заявив о введении надбавки к фрахтах в размере $775 с 1 марта 2012.</p>\n<p>\n\tПо сообщению компании, $525 в составе этой надбавки придётся на т.н. экстренную топливную надбавку, для компенсации возросших топливных расходов, и $225 - на &ldquo;экстренную компенсационную надбавку&rdquo;.</p>\n<p>\n\tОбщее повышение $775 &nbsp;за TEU должно более, чем удвоить текущие ставки рынка на направлении Азия &ndash; Европа, и отражает общее повышение ставок фрахта ранее инициированное линией Maersk, которое должно начаться с 1 марта.</p>\n<p>\n\tПовышение по линии MSC будет распространяться на отправки из Японии, Кореи, Китая, Гонконга, Тайваня, Сингапура, Индонезии, Тайланда, Вьетнама, Малайзии и Бангладеш на порты Европы, в т.ч. Великобритании, Балтийского, Адриатического, Средиземного и Черного морей, а также Северной Африки.</p>\n	Mediterranean Shipping raised the stakes in the container ship carrier bid to pump up rates on depressed Asia-Europe lanes on Thursday, adding $775 to its charges effective March 1. 	Линия MSC повысила шансы на успех в попытке контейнерных перевозчиков значительно увеличить ставки на направлении Азия – Европа, заявив о введении надбавки к фрахтах в размере $775 с 1 марта 2012. 
2	2013-02-26 16:37:29.14537+04	t			Hapag-Lloyd запускает новый фидер на Финский залив	<p>\r\n\tHapag-Lloyd запускает новый сервис на Финляндию и Россию. Finland Express (FIX) будет открыт в конце марта &ndash; начале апреля 2013. Планируется, что сервис будет еженедельным</p>\r\n	hapag-lloyd-zapuskaet-novyij-fider-2013-02-13-183900	<p>\r\n\tHapag-Lloyd запускает новый сервис на Финляндию и Россию. Finland Express (FIX) будет открыт в конце марта – начале апреля 2013. Планируется, что сервис будет еженедельным.</p>\r\n<p>\r\n\tРотация портов: Бремерхафен – Гамбург – российский порт в районе Санкт Петербурга (вероятнее всего – Усть-Луга)&#160; –Котка – Раума – Евле (Швеция).</p>\r\n<p>\r\n\tТаким образом, после запуска Finland Express Hapag-Lloyd будет ходить в Петербург дважды в неделю: в мае 2012 года Hapag-Lloyd запустил Russia Express Service (REX).</p>\r\n	\N	\N	2013-02-11 10:00:00+04	1808	t	f		entry_detail.html	f	0	0	0	t	zinnia/_entry_detail.html	Hapag-Lloyd is launching the new feeder service to the Gulf of Finland	Hapag-Lloyd запускает новый фидер на Финский залив	<p>\r\n\tHapag-Lloyd will launch the Finland Express (FIX), a fixed-day, weekly service connecting German hubs with ports in the Gulf of Finland and the Gulf of Bothnia, starting at the end of March and beginning of April.</p>\r\n<p>\r\n\tTwo vessels will cover the following rotation: Bremerhaven, Germany; Hamburg, Germany; ports surrounding the St. Petersburg, Russia area – allegedly Ust-Luga; Kotka, Finland; Rauma, Finland; and Gaevle, Sweden.</p>\r\n<p>\r\n\tIn combination with the Russia Express (REX) launched in May 2012, the FIX will provide a second weekly sailing to and from Russian ports, as well as Finnish ports.</p>\r\n	<p>\r\n\tHapag-Lloyd запускает новый сервис на Финляндию и Россию. Finland Express (FIX) будет открыт в конце марта – начале апреля 2013. Планируется, что сервис будет еженедельным.</p>\r\n<p>\r\n\tРотация портов: Бремерхафен – Гамбург – российский порт в районе Санкт Петербурга (вероятнее всего – Усть-Луга)&#160; –Котка – Раума – Евле (Швеция).</p>\r\n<p>\r\n\tТаким образом, после запуска Finland Express Hapag-Lloyd будет ходить в Петербург дважды в неделю: в мае 2012 года Hapag-Lloyd запустил Russia Express Service (REX).</p>\r\n	<p>\r\n\tHapag-Lloyd will launch the Finland Express (FIX), a fixed-day, weekly service connecting German hubs with ports in the Gulf of Finland and the Gulf of Bothnia, starting at the end of March and beginning of April.</p>\r\n	<p>\r\n\tHapag-Lloyd запускает новый сервис на Финляндию и Россию. Finland Express (FIX) будет открыт в конце марта &ndash; начале апреля 2013. Планируется, что сервис будет еженедельным</p>\r\n
\.


--
-- Data for Name: zinnia_entry_authors; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_authors (id, entry_id, author_id) FROM stdin;
59	1808	1
\.


--
-- Name: zinnia_entry_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_authors_id_seq', 62, true);


--
-- Data for Name: zinnia_entry_categories; Type: TABLE DATA; Schema: public; Owner: django_login
--

COPY zinnia_entry_categories (id, entry_id, category_id) FROM stdin;
1859	1720	3
1860	1721	3
1861	1722	3
1862	1723	3
1863	1725	3
1864	1724	3
1865	1726	3
1866	1727	3
1867	1728	3
1868	1729	3
1869	1730	3
1870	1731	3
1871	1732	3
1872	1733	3
1873	1734	3
1874	1735	3
1875	1736	3
1876	1737	3
1877	1738	3
1878	1739	3
1879	1740	3
1880	1741	3
1881	1742	3
1882	1743	3
1883	1744	3
1884	1745	3
1885	1746	3
1886	1747	3
1887	1748	3
1888	1749	3
1889	1750	3
1890	1751	3
1891	1752	3
1892	1753	3
1893	1754	3
1894	1755	3
1895	1756	3
1896	1757	3
1897	1758	3
1898	1759	3
1899	1760	3
1900	1761	3
1901	1762	3
1902	1763	3
1903	1764	3
1904	1765	3
1905	1766	3
1906	1767	3
1907	1768	3
1908	1769	3
1909	1771	3
1910	1772	3
1911	1773	3
1912	1774	3
1913	1770	3
1914	1777	3
1915	1776	3
1916	1775	3
1917	1778	3
1918	1779	3
1919	1780	3
1920	1781	3
1921	1782	3
1922	1783	3
1923	1784	3
1924	1785	3
1925	1786	3
1926	1787	3
1927	1788	3
1928	1789	3
1929	1790	3
1930	1791	3
1931	1792	3
1932	1793	3
1933	1794	3
1934	1795	3
1935	1796	3
1936	1797	3
1937	1798	3
1938	1799	3
1939	1800	3
1940	1801	3
1941	1802	3
1942	1803	3
1943	1804	3
1944	1805	3
1955	1816	2
1956	1817	2
1957	1818	2
1958	1819	2
1959	1820	2
1960	1821	2
1945	1806	3
1946	1807	3
1947	1808	3
\.


--
-- Name: zinnia_entry_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_categories_id_seq', 1960, true);


--
-- Name: zinnia_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_id_seq', 1821, true);


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
1612	1808	1
1622	1816	1
1623	1817	1
1624	1818	1
1625	1819	1
1626	1820	1
1627	1821	1
1523	1720	1
1524	1721	1
1525	1722	1
1526	1723	1
1527	1724	1
1528	1725	1
1529	1726	1
1530	1727	1
1531	1728	1
1532	1729	1
1533	1730	1
1534	1731	1
1535	1732	1
1536	1733	1
1537	1734	1
1538	1735	1
1539	1736	1
1540	1737	1
1541	1738	1
1542	1739	1
1543	1740	1
1544	1741	1
1545	1742	1
1546	1743	1
1547	1744	1
1548	1745	1
1549	1746	1
1550	1747	1
1551	1748	1
1552	1749	1
1553	1750	1
1554	1751	1
1555	1752	1
1556	1753	1
1557	1754	1
1558	1755	1
1559	1756	1
1560	1757	1
1561	1758	1
1562	1759	1
1563	1760	1
1564	1761	1
1565	1762	1
1566	1763	1
1567	1764	1
1568	1765	1
1569	1766	1
1570	1767	1
1571	1768	1
1572	1769	1
1573	1770	1
1574	1771	1
1575	1772	1
1576	1773	1
1577	1774	1
1578	1775	1
1579	1776	1
1580	1777	1
1581	1778	1
1582	1779	1
1583	1780	1
1584	1781	1
1585	1782	1
1586	1783	1
1587	1784	1
1588	1785	1
1589	1786	1
1590	1787	1
1591	1788	1
1592	1789	1
1593	1790	1
1594	1791	1
1595	1792	1
1596	1793	1
1597	1794	1
1598	1795	1
1599	1796	1
1600	1797	1
1601	1798	1
1602	1799	1
1603	1800	1
1604	1801	1
1605	1802	1
1606	1803	1
1607	1804	1
1608	1805	1
1609	1806	1
1610	1807	1
\.


--
-- Name: zinnia_entry_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_login
--

SELECT pg_catalog.setval('zinnia_entry_sites_id_seq', 1627, true);


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
-- Name: cmsplugin_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_contact
    ADD CONSTRAINT cmsplugin_contact_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_customcontact_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_customcontact
    ADD CONSTRAINT cmsplugin_customcontact_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_file_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_file
    ADD CONSTRAINT cmsplugin_file_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filer_image_thumbnailoption_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filer_image_thumbnailoption
    ADD CONSTRAINT cmsplugin_filer_image_thumbnailoption_pkey PRIMARY KEY (id);


--
-- Name: cmsplugin_filerfolder_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT cmsplugin_filerfolder_pkey PRIMARY KEY (cmsplugin_ptr_id);


--
-- Name: cmsplugin_filerimage_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_filerimage_pkey PRIMARY KEY (cmsplugin_ptr_id);


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
-- Name: cmsplugin_teaser_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT cmsplugin_teaser_pkey PRIMARY KEY (cmsplugin_ptr_id);


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
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_568f887377db5752_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_568f887377db5752_uniq UNIQUE (site_id, old_path);


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
-- Name: easy_thumbnails_source_name_39229697_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_name_39229697_uniq UNIQUE (name, storage_hash);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_source_id_47e6eb80_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_source_id_47e6eb80_uniq UNIQUE (source_id, name, storage_hash);


--
-- Name: filer_clipboard_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT filer_clipboard_pkey PRIMARY KEY (id);


--
-- Name: filer_clipboarditem_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT filer_clipboarditem_pkey PRIMARY KEY (id);


--
-- Name: filer_file_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT filer_file_pkey PRIMARY KEY (id);


--
-- Name: filer_folder_parent_id_4d901e49_uniq; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_parent_id_4d901e49_uniq UNIQUE (parent_id, name);


--
-- Name: filer_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT filer_folder_pkey PRIMARY KEY (id);


--
-- Name: filer_folderpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT filer_folderpermission_pkey PRIMARY KEY (id);


--
-- Name: filer_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django_login; Tablespace: 
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT filer_image_pkey PRIMARY KEY (file_ptr_id);


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
-- Name: cmsplugin_filerfolder_folder_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_filerfolder_folder_id ON cmsplugin_filerfolder USING btree (folder_id);


--
-- Name: cmsplugin_filerimage_file_link_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_file_link_id ON cmsplugin_filerimage USING btree (file_link_id);


--
-- Name: cmsplugin_filerimage_image_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_image_id ON cmsplugin_filerimage USING btree (image_id);


--
-- Name: cmsplugin_filerimage_page_link_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_page_link_id ON cmsplugin_filerimage USING btree (page_link_id);


--
-- Name: cmsplugin_filerimage_thumbnail_option_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_filerimage_thumbnail_option_id ON cmsplugin_filerimage USING btree (thumbnail_option_id);


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
-- Name: cmsplugin_teaser_page_link_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX cmsplugin_teaser_page_link_id ON cmsplugin_teaser USING btree (page_link_id);


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
-- Name: django_redirect_old_path; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_redirect_old_path ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_old_path_like; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_redirect_old_path_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_redirect_site_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_redirect_site_id ON django_redirect USING btree (site_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: easy_thumbnails_source_name; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_storage_hash; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_source_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_source_id ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: filer_clipboard_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_clipboard_user_id ON filer_clipboard USING btree (user_id);


--
-- Name: filer_clipboarditem_clipboard_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_clipboarditem_clipboard_id ON filer_clipboarditem USING btree (clipboard_id);


--
-- Name: filer_clipboarditem_file_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_clipboarditem_file_id ON filer_clipboarditem USING btree (file_id);


--
-- Name: filer_file_folder_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_file_folder_id ON filer_file USING btree (folder_id);


--
-- Name: filer_file_owner_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_file_owner_id ON filer_file USING btree (owner_id);


--
-- Name: filer_file_polymorphic_ctype_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_file_polymorphic_ctype_id ON filer_file USING btree (polymorphic_ctype_id);


--
-- Name: filer_folder_level; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_level ON filer_folder USING btree (level);


--
-- Name: filer_folder_lft; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_lft ON filer_folder USING btree (lft);


--
-- Name: filer_folder_owner_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_owner_id ON filer_folder USING btree (owner_id);


--
-- Name: filer_folder_parent_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_parent_id ON filer_folder USING btree (parent_id);


--
-- Name: filer_folder_rght; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_rght ON filer_folder USING btree (rght);


--
-- Name: filer_folder_tree_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folder_tree_id ON filer_folder USING btree (tree_id);


--
-- Name: filer_folderpermission_folder_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folderpermission_folder_id ON filer_folderpermission USING btree (folder_id);


--
-- Name: filer_folderpermission_group_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folderpermission_group_id ON filer_folderpermission USING btree (group_id);


--
-- Name: filer_folderpermission_user_id; Type: INDEX; Schema: public; Owner: django_login; Tablespace: 
--

CREATE INDEX filer_folderpermission_user_id ON filer_folderpermission USING btree (user_id);


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
-- Name: clipboard_id_refs_id_46496bc2; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT clipboard_id_refs_id_46496bc2 FOREIGN KEY (clipboard_id) REFERENCES filer_clipboard(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_ptr_id_refs_id_1c5135f; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_customcontact
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_1c5135f FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_ptr_id_refs_id_3f873c7a; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_3f873c7a FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_4c030ec612cc9f9c; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_selectedentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_4c030ec612cc9f9c FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_4c50eb22; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_4c50eb22 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_5b5bb680225ec8c8; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_latestentriesplugin
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_5b5bb680225ec8c8 FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_ptr_id_refs_id_6d2d8b7a; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_contact
    ADD CONSTRAINT cmsplugin_ptr_id_refs_id_6d2d8b7a FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: cmsplugin_teaser_cmsplugin_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT cmsplugin_teaser_cmsplugin_ptr_id_fkey FOREIGN KEY (cmsplugin_ptr_id) REFERENCES cms_cmsplugin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cmsplugin_teaser_page_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_teaser
    ADD CONSTRAINT cmsplugin_teaser_page_link_id_fkey FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: file_id_refs_id_3533711; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_clipboarditem
    ADD CONSTRAINT file_id_refs_id_3533711 FOREIGN KEY (file_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_link_id_refs_id_5ec3672c; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT file_link_id_refs_id_5ec3672c FOREIGN KEY (file_link_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: file_ptr_id_refs_id_273c421f; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_image
    ADD CONSTRAINT file_ptr_id_refs_id_273c421f FOREIGN KEY (file_ptr_id) REFERENCES filer_file(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_46416074; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerfolder
    ADD CONSTRAINT folder_id_refs_id_46416074 FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_5276dead; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT folder_id_refs_id_5276dead FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: folder_id_refs_id_565b7e06; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT folder_id_refs_id_565b7e06 FOREIGN KEY (folder_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: group_id_refs_id_6e300e3b; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT group_id_refs_id_6e300e3b FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_file_ptr_id_6f5059d6; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT image_id_refs_file_ptr_id_6f5059d6 FOREIGN KEY (image_id) REFERENCES filer_image(file_ptr_id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: owner_id_refs_id_4709f467; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT owner_id_refs_id_4709f467 FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_6abe8089; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT owner_id_refs_id_6abe8089 FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_id_refs_id_b22baae5; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cms_page_placeholders
    ADD CONSTRAINT page_id_refs_id_b22baae5 FOREIGN KEY (page_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_link_id_refs_id_3d7fd63c; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT page_link_id_refs_id_3d7fd63c FOREIGN KEY (page_link_id) REFERENCES cms_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_1fffa484ce18ab03; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_category
    ADD CONSTRAINT parent_id_refs_id_1fffa484ce18ab03 FOREIGN KEY (parent_id) REFERENCES zinnia_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_60f1d8bd; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folder
    ADD CONSTRAINT parent_id_refs_id_60f1d8bd FOREIGN KEY (parent_id) REFERENCES filer_folder(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: polymorphic_ctype_id_refs_id_29c16935; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_file
    ADD CONSTRAINT polymorphic_ctype_id_refs_id_29c16935 FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: site_id_refs_id_1009347a4aa27aa6; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT site_id_refs_id_1009347a4aa27aa6 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_id_refs_id_250ed0b2ebd96f36; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_sites
    ADD CONSTRAINT site_id_refs_id_250ed0b2ebd96f36 FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: source_id_refs_id_5bffe8f5; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT source_id_refs_id_5bffe8f5 FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: thumbnail_option_id_refs_id_917a93; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY cmsplugin_filerimage
    ADD CONSTRAINT thumbnail_option_id_refs_id_917a93 FOREIGN KEY (thumbnail_option_id) REFERENCES cmsplugin_filer_image_thumbnailoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: to_entry_id_refs_id_233a09ab4d833995; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY zinnia_entry_related
    ADD CONSTRAINT to_entry_id_refs_id_233a09ab4d833995 FOREIGN KEY (to_entry_id) REFERENCES zinnia_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_16137c20; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_clipboard
    ADD CONSTRAINT user_id_refs_id_16137c20 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: user_id_refs_id_4ab53c64; Type: FK CONSTRAINT; Schema: public; Owner: django_login
--

ALTER TABLE ONLY filer_folderpermission
    ADD CONSTRAINT user_id_refs_id_4ab53c64 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

