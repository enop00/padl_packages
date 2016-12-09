--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-12-09 23:22:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 8 (class 2615 OID 28664)
-- Name: app; Type: SCHEMA; Schema: -; Owner: kuningan
--

CREATE SCHEMA app;


ALTER SCHEMA app OWNER TO [nama_daerah] ;

--
-- TOC entry 9 (class 2615 OID 28666)
-- Name: pad; Type: SCHEMA; Schema: -; Owner: [nama_daerah] 
--

CREATE SCHEMA pad;


ALTER SCHEMA pad OWNER TO [nama_daerah] ;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = pad, pg_catalog;

--
-- TOC entry 279 (class 1255 OID 28670)
-- Name: format_tgl(date, boolean, boolean); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION format_tgl(tgl date, pendek boolean, tanpatgl boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

declare 
    tgl_out varchar;
    nbln_out varchar;
    ntgl integer;
    nbln integer;
    nthn integer;
begin

select extract(day from tgl) into ntgl;
select extract(month from tgl)::int into nbln;
select extract(year from tgl) into nthn;

/*
1 januari 2014 
1 jan 2014
januari 2014
jan 2014
*/

if pendek then
  if nbln=1 then 
    nbln_out:='Jan ';
  elseif nbln=2 then 
    nbln_out:='Peb ';
  elseif nbln=3 then 
    nbln_out:='Mar ';
  elseif nbln=4 then 
    nbln_out:='Apr ';
  elseif nbln=5 then 
    nbln_out:='Mei ';
  elseif nbln=6 then 
    nbln_out:='Jun ';
  elseif nbln=7 then 
    nbln_out:='Jul ';
  elseif nbln=8 then 
    nbln_out:='Agt ';
  elseif nbln=9 then 
    nbln_out:='Sep ';
  elseif nbln=10 then 
    nbln_out:='Okt ';
  elseif nbln=11 then 
    nbln_out:='Nop ';
  elseif nbln=12 then 
    nbln_out:='Des ';
  end if;
else
  if nbln=1 then 
    nbln_out:='Januari ';
  elseif nbln=2 then 
    nbln_out:='Pebruari ';
  elseif nbln=3 then 
    nbln_out:='Maret ';
  elseif nbln=4 then 
    nbln_out:='April ';
  elseif nbln=5 then 
    nbln_out:='Mei ' ;
  elseif nbln=6 then 
    nbln_out:='Juni ';
  elseif nbln=7 then 
    nbln_out:='Juli ';
  elseif nbln=8 then 
    nbln_out:='Agustus ';
  elseif nbln=9 then 
    nbln_out:='September ';
  elseif nbln=10 then 
    nbln_out:='Oktober ';
  elseif nbln=11 then 
    nbln_out:='Nopember ';
  elseif nbln=12 then 
    nbln_out:='Desember ';
  end if;
end if;

if tanpatgl then
    select nbln_out||nthn into tgl_out;
else
    select ntgl||' '||nbln_out||nthn into tgl_out;
end if;

return tgl_out;   
end
$$;


ALTER FUNCTION pad.format_tgl(tgl date, pendek boolean, tanpatgl boolean) OWNER TO [nama_daerah] ;

--
-- TOC entry 281 (class 1255 OID 28671)
-- Name: format_tgl(timestamp without time zone, boolean, boolean); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION format_tgl(tgl timestamp without time zone, pendek boolean, tanpatgl boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

declare 
    tgl_out varchar;
    nbln_out varchar;
    ntgl integer;
    nbln integer;
    nthn integer;
begin

select extract(day from tgl) into ntgl;
select extract(month from tgl)::int into nbln;
select extract(year from tgl) into nthn;


if pendek then
  if nbln=1 then 
    nbln_out:='Jan ';
  elseif nbln=2 then 
    nbln_out:='Peb ';
  elseif nbln=3 then 
    nbln_out:='Mar ';
  elseif nbln=4 then 
    nbln_out:='Apr ';
  elseif nbln=5 then 
    nbln_out:='Mei ';
  elseif nbln=6 then 
    nbln_out:='Jun ';
  elseif nbln=7 then 
    nbln_out:='Jul ';
  elseif nbln=8 then 
    nbln_out:='Agt ';
  elseif nbln=9 then 
    nbln_out:='Sep ';
  elseif nbln=10 then 
    nbln_out:='Okt ';
  elseif nbln=11 then 
    nbln_out:='Nop ';
  elseif nbln=12 then 
    nbln_out:='Des ';
  end if;
else
  if nbln=1 then 
    nbln_out:='Januari ';
  elseif nbln=2 then 
    nbln_out:='Pebruari ';
  elseif nbln=3 then 
    nbln_out:='Maret ';
  elseif nbln=4 then 
    nbln_out:='April ';
  elseif nbln=5 then 
    nbln_out:='Mei ' ;
  elseif nbln=6 then 
    nbln_out:='Juni ';
  elseif nbln=7 then 
    nbln_out:='Juli ';
  elseif nbln=8 then 
    nbln_out:='Agustus ';
  elseif nbln=9 then 
    nbln_out:='September ';
  elseif nbln=10 then 
    nbln_out:='Oktober ';
  elseif nbln=11 then 
    nbln_out:='Nopember ';
  elseif nbln=12 then 
    nbln_out:='Desember ';
  end if;
end if;

if tanpatgl then
    select nbln_out||nthn into tgl_out;
else
    select ntgl||' '||nbln_out||nthn into tgl_out;
end if;

return tgl_out;   
end
$$;


ALTER FUNCTION pad.format_tgl(tgl timestamp without time zone, pendek boolean, tanpatgl boolean) OWNER TO [nama_daerah] ;

--
-- TOC entry 282 (class 1255 OID 28672)
-- Name: get_bayarno(bigint); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_bayarno(spt_id bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare bayarno_out character varying;
begin

select tahun||lpad(sptno::text, 6, '0') into bayarno_out
from pad_spt s where s.id=$1;

return bayarno_out;
   
end
$_$;


ALTER FUNCTION pad.get_bayarno(spt_id bigint) OWNER TO [nama_daerah] ;

--
-- TOC entry 283 (class 1255 OID 28673)
-- Name: get_bulan(integer, boolean); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_bulan(bulan integer, short boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
DECLARE 
  bulan_out character varying;
begin

if $2 then
  if bulan=1 then 
    bulan_out:='Jan ';
  elseif bulan=2 then 
    bulan_out:='Peb ';
  elseif bulan=3 then 
    bulan_out:='Mar ';
  elseif bulan=4 then 
    bulan_out:='Apr ';
  elseif bulan=5 then 
    bulan_out:='Mei ';
  elseif bulan=6 then 
    bulan_out:='Jun ';
  elseif bulan=7 then 
    bulan_out:='Jul ';
  elseif bulan=8 then 
    bulan_out:='Agt ';
  elseif bulan=9 then 
    bulan_out:='Sep ';
  elseif bulan=10 then 
    bulan_out:='Okt ';
  elseif bulan=11 then 
    bulan_out:='Nop ';
  elseif bulan=12 then 
    bulan_out:='Des ';
  end if;
else
  if bulan=1 then 
    bulan_out:='Januari ';
  elseif bulan=2 then 
    bulan_out:='Pebruari ';
  elseif bulan=3 then 
    bulan_out:='Maret ';
  elseif bulan=4 then 
    bulan_out:='April ';
  elseif bulan=5 then 
    bulan_out:='Mei ' ;
  elseif bulan=6 then 
    bulan_out:='Juni ';
  elseif bulan=7 then 
    bulan_out:='Juli ';
  elseif bulan=8 then 
    bulan_out:='Agustus ';
  elseif bulan=9 then 
    bulan_out:='September ';
  elseif bulan=10 then 
    bulan_out:='Oktober ';
  elseif bulan=11 then 
    bulan_out:='Nopember ';
  elseif bulan=12 then 
    bulan_out:='Desember ';
  end if;
end if;

return bulan_out;
   
end
$_$;


ALTER FUNCTION pad.get_bulan(bulan integer, short boolean) OWNER TO [nama_daerah] ;

--
-- TOC entry 284 (class 1255 OID 28674)
-- Name: get_kohirno(bigint); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_kohirno(spt_id bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare kohirno_out character varying;
begin

select k.tahun||'-'||lpad(kohirno::text, 5, '0') into kohirno_out
from pad_kohir k
inner join pad_spt s on s.id=k.spt_id
where s.id=$1;

return kohirno_out;
   
end
$_$;


ALTER FUNCTION pad.get_kohirno(spt_id bigint) OWNER TO [nama_daerah] ;

--
-- TOC entry 285 (class 1255 OID 28675)
-- Name: get_nopd(bigint, boolean); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_nopd(id bigint, formatted boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare nopd_out character varying;
begin


--menyesuaikan npwpd [nama_daerah] , NOPD: P.xxxxxx.3208.aaa.bbb.uu.kk

if $2 then
select c.rp||'.'||lpad( c.formno::text, 6, '0')||'.3208.'||k.kecamatankd||'.'||l.kelurahankd||'.'||lpad(u.id::text, 2, '0')||'.'||lpad(cu.konterid::text, 2, '0') into nopd_out
from pad_customer_usaha cu 
inner join pad_customer c on c.id=cu.customer_id
inner join tblkelurahan l on cu.kelurahan_id=l.id
inner join tblkecamatan k on l.kecamatan_id=k.id
inner join pad_usaha u on u.id=cu.usaha_id
where cu.id=$1;

else

select c.rp||lpad( c.formno::text, 6, '0')||'3208'||k.kecamatankd||l.kelurahankd||lpad(u.id::text, 2, '0')||lpad(cu.konterid::text, 2, '0') into nopd_out
from pad_customer_usaha cu 
inner join pad_customer c on c.id=cu.customer_id
inner join tblkelurahan l on cu.kelurahan_id=l.id
inner join tblkecamatan k on l.kecamatan_id=k.id
inner join pad_usaha u on u.id=cu.usaha_id
where cu.id=$1;

end if;

return nopd_out;
   
end
$_$;


ALTER FUNCTION pad.get_nopd(id bigint, formatted boolean) OWNER TO [nama_daerah] ;

--
-- TOC entry 280 (class 1255 OID 28676)
-- Name: get_npwpd(bigint, boolean); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_npwpd(id bigint, formatted boolean) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare npwpd_out character varying;
begin

/* 
NPWPD: P.xxxxxx.3208.aaa.bbb

ket : 
xxxxxx adalah kodefikasi nomor urut wp terdaftar
3208 adalah kodefikasi propinsi dan kabupaten/kota
aaa adalah kodefikasi nomor kode kecamatan
bbb adalah kodefikasi nomor kode kelurahan

nb untuk kec=LUAR KOTA:
jika pilihan kel = Luar Jawa Barat(000)
NPWPD = P.xxxxxx.0000.xxx.xxx
jika pilihan kel = Jawa Barat(001) 
NPWPD = P.xxxxxx.3200.xxx.xxx

*/

if $2 then

select c.rp||'.'||lpad( c.formno::text, 6, '0')||
case 
when k.kecamatankd='000' and l.kelurahankd='000' then '.0000.'
when k.kecamatankd='000' and l.kelurahankd='001' then '.3200.' else '.3208.' 
end
||k.kecamatankd||'.'||l.kelurahankd into npwpd_out
from pad_customer c
inner join tblkelurahan l on c.kelurahan_id=l.id
inner join tblkecamatan k on l.kecamatan_id=k.id
where c.id=$1;

else

select c.rp||lpad( c.formno::text, 6, '0')||
case 
when k.kecamatankd='000' and l.kelurahankd='000' then '0000'
when k.kecamatankd='000' and l.kelurahankd='001' then '3200' else '3208'
end
||k.kecamatankd||l.kelurahankd into npwpd_out
from pad_customer c
inner join tblkelurahan l on c.kelurahan_id=l.id
inner join tblkecamatan k on l.kecamatan_id=k.id
where c.id=$1;

end if;

return npwpd_out;
   
end
$_$;


ALTER FUNCTION pad.get_npwpd(id bigint, formatted boolean) OWNER TO [nama_daerah] ;

--
-- TOC entry 286 (class 1255 OID 28677)
-- Name: get_rekening(character varying); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_rekening(rekeningkd character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
declare 
  rekening_out character varying;
begin

  rekening_out := replace(rekeningkd, '.', '');
  rekening_out := concat(
    coalesce(nullif(substring(rekeningkd,1,1)||'.','.'),''),
    coalesce(nullif(substring(rekeningkd,2,1)||'.','.'),''),
    coalesce(nullif(substring(rekeningkd,3,1)||'.','.'),''),
    coalesce(nullif(substring(rekeningkd,4,2)||'.','.'),''),
    coalesce(nullif(substring(rekeningkd,6,2)||'.','.'),''),
    coalesce(nullif(substring(rekeningkd,8,2)||'.','.'),'')
  );
  rekening_out := substring(rekening_out,1,length(rekening_out)-1);
  rekening_out := '1.20.05.00.00.'||rekening_out;
return rekening_out;
   
end
$$;


ALTER FUNCTION pad.get_rekening(rekeningkd character varying) OWNER TO [nama_daerah] ;

--
-- TOC entry 287 (class 1255 OID 28678)
-- Name: get_sptno(bigint); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_sptno(id bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare sptno_out character varying;
begin

select tahun||'-'||lpad(sptno::text, 6, '0') into sptno_out
from pad_spt s where s.id=$1;

return sptno_out;
   
end
$_$;


ALTER FUNCTION pad.get_sptno(id bigint) OWNER TO [nama_daerah] ;

--
-- TOC entry 288 (class 1255 OID 28679)
-- Name: get_sspdno(bigint); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_sspdno(spt_id bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare sspdno_out character varying;
begin

select ss.tahun||'-'||lpad(sspdno::text, 6, '0') into sspdno_out
from pad_sspd ss
inner join pad_spt s on s.id=ss.spt_id
where s.id=$1 and ss.is_valid=1;

return sspdno_out;
   
end
$_$;


ALTER FUNCTION pad.get_sspdno(spt_id bigint) OWNER TO [nama_daerah] ;

--
-- TOC entry 289 (class 1255 OID 28680)
-- Name: get_stpno(bigint); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION get_stpno(id bigint) RETURNS character varying
    LANGUAGE plpgsql
    AS $_$
declare stpno_out character varying;
begin

select max(tahun)||'-'||lpad(max(stpdno)::text, 6, '0') into stpno_out
from pad_stpd where spt_id=$1;

return stpno_out;
   
end
$_$;


ALTER FUNCTION pad.get_stpno(id bigint) OWNER TO [nama_daerah] ;

--
-- TOC entry 290 (class 1255 OID 28681)
-- Name: sspd_batal(); Type: FUNCTION; Schema: pad; Owner: [nama_daerah] 
--

CREATE FUNCTION sspd_batal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        -- irul@20160413
        -- agak aneh trigernya, karena menyesuaikan code di aplikasi yg mengupdate by spt_id
        IF (TG_OP='UPDATE' AND NEW.is_valid=0 AND OLD.is_valid=1) THEN
            NEW.cancel_jml_bayar=OLD.jml_bayar;
            NEW.cancel_bunga=OLD.bunga;
            NEW.cancel_denda=OLD.denda;

            NEW.jml_bayar=0;
            NEW.bunga=0;
            NEW.denda=0;
        END IF;
        
        IF (TG_OP='UPDATE' AND NEW.is_valid=0 AND OLD.is_valid=0) THEN
            NEW.cancel_uid=OLD.cancel_uid;
            NEW.cancel_date=OLD.cancel_date;
        END IF;
        
        RETURN NEW;
    END;
$$;


ALTER FUNCTION pad.sspd_batal() OWNER TO [nama_daerah] ;

SET search_path = public, pg_catalog;

--
-- TOC entry 291 (class 1255 OID 28682)
-- Name: hit_denda(bigint, integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hit_denda(pokok bigint, persen integer, jth_tempo date) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE 
  denda bigint;
  x integer;
  y integer;
  z integer;
  
begin
        
        x   = (extract(year from now()) - extract(year from jth_tempo)) * 12;
        y   = (extract(month from now()) - extract(month from jth_tempo));
        z   = x + y + 1;
        
        if (extract(day from now()) <= extract(day from jth_tempo)) then
            z = z - 1;
        end if;
        if (z < 1) then
            z = 0;
        end if;
        if (z > 24) then
            z = 24;
        end if;

            
        denda  = round(z * (persen / 100.0) * pokok);
        return denda;
   
end
$$;


ALTER FUNCTION public.hit_denda(pokok bigint, persen integer, jth_tempo date) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 28683)
-- Name: sync_psppt_pg_func(); Type: FUNCTION; Schema: public; Owner: [nama_daerah] 
--

CREATE FUNCTION sync_psppt_pg_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        IF TG_OP='INSERT' THEN
            INSERT INTO sync_psppt_pg (kd_propinsi, kd_dati2, kd_kecamatan,
                kd_kelurahan, kd_blok, no_urut, kd_jns_op, thn_pajak_sppt, pembayaran_sppt_ke, jns_sinkron)
            SELECT new.kd_propinsi, new.kd_dati2, new.kd_kecamatan,
                new.kd_kelurahan, new.kd_blok, new.no_urut, new.kd_jns_op,
                new.thn_pajak_sppt, new.pembayaran_sppt_ke, '2';
            RETURN NEW;
        ELSIF TG_OP='UPDATE' THEN
            INSERT INTO sync_psppt_pg (kd_propinsi, kd_dati2, kd_kecamatan,
                kd_kelurahan, kd_blok, no_urut, kd_jns_op, thn_pajak_sppt, pembayaran_sppt_ke, jns_sinkron)
            SELECT new.kd_propinsi, new.kd_dati2, new.kd_kecamatan,
                new.kd_kelurahan, new.kd_blok, new.no_urut, new.kd_jns_op,
                new.thn_pajak_sppt, new.pembayaran_sppt_ke, '3';
            RETURN NEW;

        END IF;
    END;

    $$;


ALTER FUNCTION public.sync_psppt_pg_func() OWNER TO [nama_daerah] ;

SET search_path = app, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 28684)
-- Name: app_status; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE app_status (
    id integer NOT NULL,
    tahun integer,
    app_id smallint,
    step character varying(25),
    operator smallint DEFAULT 0 NOT NULL,
    review smallint DEFAULT 0 NOT NULL,
    manager smallint DEFAULT 0 NOT NULL
);


ALTER TABLE app_status OWNER TO [nama_daerah] ;

--
-- TOC entry 176 (class 1259 OID 28690)
-- Name: app_status_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE app_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_status_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 176
-- Name: app_status_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE app_status_id_seq OWNED BY app_status.id;


--
-- TOC entry 177 (class 1259 OID 28692)
-- Name: apps; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE apps (
    id integer NOT NULL,
    nama character varying(50),
    app_path character varying(50),
    disabled smallint DEFAULT 1
);


ALTER TABLE apps OWNER TO [nama_daerah] ;

--
-- TOC entry 178 (class 1259 OID 28696)
-- Name: apps_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE apps_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 178
-- Name: apps_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE apps_id_seq OWNED BY apps.id;


--
-- TOC entry 179 (class 1259 OID 28698)
-- Name: group_modules; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE group_modules (
    group_id integer,
    id integer NOT NULL,
    module_id integer,
    reads smallint DEFAULT 0 NOT NULL,
    writes smallint DEFAULT 0 NOT NULL,
    deletes smallint DEFAULT 0 NOT NULL,
    inserts smallint DEFAULT 0 NOT NULL
);


ALTER TABLE group_modules OWNER TO [nama_daerah] ;

--
-- TOC entry 180 (class 1259 OID 28705)
-- Name: group_modules_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE group_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_modules_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 180
-- Name: group_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE group_modules_id_seq OWNED BY group_modules.id;


--
-- TOC entry 181 (class 1259 OID 28707)
-- Name: groups; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    nama character varying(50),
    locked smallint DEFAULT 0,
    kode character varying(10)
);


ALTER TABLE groups OWNER TO [nama_daerah] ;

--
-- TOC entry 182 (class 1259 OID 28711)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 182
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- TOC entry 183 (class 1259 OID 28713)
-- Name: modules; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE modules (
    id integer NOT NULL,
    nama character varying(50),
    app_id smallint,
    kode character varying(20)
);


ALTER TABLE modules OWNER TO [nama_daerah] ;

--
-- TOC entry 184 (class 1259 OID 28716)
-- Name: modules_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modules_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 184
-- Name: modules_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE modules_id_seq OWNED BY modules.id;


--
-- TOC entry 185 (class 1259 OID 28718)
-- Name: user_groups; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE user_groups (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE user_groups OWNER TO [nama_daerah] ;

--
-- TOC entry 186 (class 1259 OID 28721)
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_groups_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE user_groups_id_seq OWNED BY user_groups.id;


--
-- TOC entry 187 (class 1259 OID 28723)
-- Name: users; Type: TABLE; Schema: app; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE users (
    userid character varying(25),
    nama character varying(50),
    created timestamp without time zone,
    disabled smallint,
    passwd character varying(50),
    id integer NOT NULL,
    kd_kantor character(2),
    kd_kanwil character(2),
    kd_tp character(2),
    kd_kanwil_bank character(2),
    kd_kppbb_bank character(2),
    kd_bank_tunggal character(2),
    kd_bank_persepsi character(2),
    nip character(18),
    jabatan character varying(50)
);


ALTER TABLE users OWNER TO [nama_daerah] ;

--
-- TOC entry 188 (class 1259 OID 28726)
-- Name: users_id_seq; Type: SEQUENCE; Schema: app; Owner: [nama_daerah] 
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: app; Owner: [nama_daerah] 
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


SET search_path = pad, pg_catalog;

--
-- TOC entry 189 (class 1259 OID 28890)
-- Name: pad_air_hda; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_air_hda (
    id integer NOT NULL,
    zona_id integer,
    manfaat_id integer,
    volume_id integer,
    hda double precision
);


ALTER TABLE pad_air_hda OWNER TO [nama_daerah] ;

--
-- TOC entry 190 (class 1259 OID 28893)
-- Name: pad_air_hda_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_air_hda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_air_hda_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 190
-- Name: pad_air_hda_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_air_hda_id_seq OWNED BY pad_air_hda.id;


--
-- TOC entry 191 (class 1259 OID 28895)
-- Name: pad_air_manfaat; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_air_manfaat (
    id integer NOT NULL,
    manfaatnm character varying(108)
);


ALTER TABLE pad_air_manfaat OWNER TO [nama_daerah] ;

--
-- TOC entry 192 (class 1259 OID 28898)
-- Name: pad_air_manfaat_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_air_manfaat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_air_manfaat_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 192
-- Name: pad_air_manfaat_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_air_manfaat_id_seq OWNED BY pad_air_manfaat.id;


--
-- TOC entry 193 (class 1259 OID 28900)
-- Name: pad_air_volume; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_air_volume (
    id integer NOT NULL,
    volume integer
);


ALTER TABLE pad_air_volume OWNER TO [nama_daerah] ;

--
-- TOC entry 194 (class 1259 OID 28903)
-- Name: pad_air_volume_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_air_volume_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_air_volume_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 194
-- Name: pad_air_volume_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_air_volume_id_seq OWNED BY pad_air_volume.id;


--
-- TOC entry 195 (class 1259 OID 28905)
-- Name: pad_air_zona; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_air_zona (
    id integer NOT NULL,
    zonanm character varying(50),
    nindex double precision
);


ALTER TABLE pad_air_zona OWNER TO [nama_daerah] ;

--
-- TOC entry 196 (class 1259 OID 28908)
-- Name: pad_air_zona_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_air_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_air_zona_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 196
-- Name: pad_air_zona_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_air_zona_id_seq OWNED BY pad_air_zona.id;


--
-- TOC entry 197 (class 1259 OID 28910)
-- Name: pad_customer; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_customer (
    id bigint NOT NULL,
    parent bigint,
    npwpd character varying(21),
    rp character(1),
    pb smallint,
    formno integer NOT NULL,
    reg_date timestamp without time zone,
    customernm character varying(100),
    kecamatan_id integer,
    kelurahan_id integer,
    kabupaten character varying(25),
    alamat character varying(100),
    kodepos character varying(5),
    telphone character(20),
    wpnama character varying(100),
    wpalamat character varying(100),
    wpkelurahan character varying(25),
    wpkecamatan character varying(25),
    wpkabupaten character varying(25),
    wptelp character varying(20),
    wpkodepos character varying(5),
    pnama character varying(50),
    palamat character varying(50),
    pkelurahan character varying(25),
    pkecamatan character varying(25),
    pkabupaten character varying(25),
    ptelp character varying(20),
    pkodepos character varying(5),
    ijin1 character varying(100),
    ijin1no character varying(100),
    ijin1tgl timestamp without time zone,
    ijin1tglakhir timestamp without time zone,
    ijin2 character varying(100),
    ijin2no character varying(100),
    ijin2tgl timestamp without time zone,
    ijin2tglakhir timestamp without time zone,
    ijin3 character varying(100),
    ijin3no character varying(100),
    ijin3tgl timestamp without time zone,
    ijin3tglakhir timestamp without time zone,
    ijin4 character varying(100),
    ijin4no character varying(100),
    ijin4tgl timestamp without time zone,
    ijin4tglakhir timestamp without time zone,
    kukuhno character(30),
    kukuhnip bigint,
    kukuhtgl timestamp without time zone,
    kukuh_jabat_id integer,
    kukuhprinted smallint,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    tmt timestamp without time zone,
    customer_status_id integer,
    kembalitgl timestamp without time zone,
    kembalioleh character(30),
    kartuprinted smallint,
    kembalinip bigint,
    penerimanm character varying(50),
    penerimaalamat character varying(50),
    penerimatgl timestamp without time zone,
    catatnip bigint,
    kirimtgl timestamp without time zone,
    batastgl timestamp without time zone,
    petugas_jabat_id integer,
    pencatat_jabat_id integer,
    kd_restojmlmeja integer,
    kd_restojmlkursi integer,
    kd_restojmltamu integer,
    kd_filmkursi integer,
    kd_filmpertunjukan integer,
    kd_filmtarif double precision,
    kd_bilyarmeja integer,
    kd_bilyartarif double precision,
    kd_bilyarkegiatan integer,
    kd_diskopengunjung integer,
    kd_diskotarif double precision,
    kd_waletvolume integer
);


ALTER TABLE pad_customer OWNER TO [nama_daerah] ;

--
-- TOC entry 198 (class 1259 OID 28916)
-- Name: pad_customer_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_customer_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 198
-- Name: pad_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_customer_id_seq OWNED BY pad_customer.id;


--
-- TOC entry 199 (class 1259 OID 28918)
-- Name: pad_customer_kd_det; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_customer_kd_det (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    nourut integer NOT NULL,
    notes character varying(50),
    tarif double precision,
    kamar integer,
    volume integer
);


ALTER TABLE pad_customer_kd_det OWNER TO [nama_daerah] ;

--
-- TOC entry 200 (class 1259 OID 28921)
-- Name: pad_customer_kd_det_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_customer_kd_det_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_customer_kd_det_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 200
-- Name: pad_customer_kd_det_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_customer_kd_det_id_seq OWNED BY pad_customer_kd_det.id;


--
-- TOC entry 201 (class 1259 OID 28923)
-- Name: pad_customer_usaha; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_customer_usaha (
    id bigint NOT NULL,
    konterid smallint DEFAULT 0 NOT NULL,
    reg_date timestamp without time zone,
    customer_id bigint NOT NULL,
    usaha_id integer NOT NULL,
    so character varying(1),
    kecamatan_id integer,
    kelurahan_id integer,
    notes character varying(50),
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    customer_status_id integer,
    aktifnotes character varying(200),
    tmt timestamp without time zone,
    air_zona_id integer,
    air_manfaat_id integer,
    def_pajak_id integer,
    opnm character varying(100),
    opalamat character varying(100),
    latitude numeric,
    longitude numeric
);


ALTER TABLE pad_customer_usaha OWNER TO [nama_daerah] ;

--
-- TOC entry 202 (class 1259 OID 28930)
-- Name: pad_customer_usaha_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_customer_usaha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_customer_usaha_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 202
-- Name: pad_customer_usaha_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_customer_usaha_id_seq OWNED BY pad_customer_usaha.id;


--
-- TOC entry 203 (class 1259 OID 28932)
-- Name: pad_rek_jalan; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_rek_jalan (
    id integer NOT NULL,
    jalan_klas_id integer,
    jalankd character(3) NOT NULL,
    jalannm character varying(108),
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_rek_jalan OWNER TO [nama_daerah] ;

--
-- TOC entry 204 (class 1259 OID 28935)
-- Name: pad_jalan_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_jalan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_jalan_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 204
-- Name: pad_jalan_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_jalan_id_seq OWNED BY pad_rek_jalan.id;


--
-- TOC entry 205 (class 1259 OID 28937)
-- Name: pad_rek_jalan_klas; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_rek_jalan_klas (
    id integer NOT NULL,
    kelasnm character varying(254),
    nilai double precision
);


ALTER TABLE pad_rek_jalan_klas OWNER TO [nama_daerah] ;

--
-- TOC entry 206 (class 1259 OID 28940)
-- Name: pad_jalan_klas_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_jalan_klas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_jalan_klas_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 206
-- Name: pad_jalan_klas_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_jalan_klas_id_seq OWNED BY pad_rek_jalan_klas.id;


--
-- TOC entry 207 (class 1259 OID 28942)
-- Name: pad_kohir; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_kohir (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    usaha_id integer,
    kohirno integer NOT NULL,
    kohirtgl timestamp without time zone NOT NULL,
    spt_id bigint NOT NULL,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_kohir OWNER TO [nama_daerah] ;

--
-- TOC entry 208 (class 1259 OID 28945)
-- Name: pad_kohir_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_kohir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_kohir_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 208
-- Name: pad_kohir_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_kohir_id_seq OWNED BY pad_kohir.id;


--
-- TOC entry 209 (class 1259 OID 28947)
-- Name: pad_rek_lokasi_pasang; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_rek_lokasi_pasang (
    id integer NOT NULL,
    lokasinm character varying(50),
    nilai double precision
);


ALTER TABLE pad_rek_lokasi_pasang OWNER TO [nama_daerah] ;

--
-- TOC entry 210 (class 1259 OID 28950)
-- Name: pad_lokasi_pasang_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_lokasi_pasang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_lokasi_pasang_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 210
-- Name: pad_lokasi_pasang_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_lokasi_pasang_id_seq OWNED BY pad_rek_lokasi_pasang.id;


--
-- TOC entry 211 (class 1259 OID 28952)
-- Name: pad_pajak; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_pajak (
    id integer NOT NULL,
    usaha_id integer DEFAULT 0 NOT NULL,
    pajaknm character varying(100),
    rekening_id integer NOT NULL,
    rekeningkdsub character varying(5) DEFAULT '00'::character varying,
    rekdenda_id integer,
    masapajak smallint DEFAULT 2 NOT NULL,
    jatuhtempo smallint DEFAULT 0,
    multiple smallint DEFAULT 0,
    jalan_klas_id integer,
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_pajak OWNER TO [nama_daerah] ;

--
-- TOC entry 212 (class 1259 OID 28960)
-- Name: pad_pajak_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_pajak_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_pajak_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 212
-- Name: pad_pajak_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_pajak_id_seq OWNED BY pad_pajak.id;


--
-- TOC entry 213 (class 1259 OID 28962)
-- Name: pad_pajak_tarif; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_pajak_tarif (
    id integer NOT NULL,
    pajak_id integer NOT NULL,
    tarif double precision,
    reklame double precision DEFAULT 0 NOT NULL,
    minomset double precision DEFAULT 0,
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_pajak_tarif OWNER TO [nama_daerah] ;

--
-- TOC entry 214 (class 1259 OID 28967)
-- Name: pad_pajak_tarif_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_pajak_tarif_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_pajak_tarif_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 214
-- Name: pad_pajak_tarif_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_pajak_tarif_id_seq OWNED BY pad_pajak_tarif.id;


--
-- TOC entry 215 (class 1259 OID 28969)
-- Name: pad_rek_nsr; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_rek_nsr (
    id integer NOT NULL,
    nsrnm character varying(50),
    nilai numeric
);


ALTER TABLE pad_rek_nsr OWNER TO [nama_daerah] ;

--
-- TOC entry 216 (class 1259 OID 28975)
-- Name: pad_rek_nsr_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_rek_nsr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_rek_nsr_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 216
-- Name: pad_rek_nsr_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_rek_nsr_id_seq OWNED BY pad_rek_nsr.id;


--
-- TOC entry 217 (class 1259 OID 28977)
-- Name: pad_rek_sudut_pandang; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_rek_sudut_pandang (
    id integer NOT NULL,
    sudutnm character varying(50),
    nilai double precision
);


ALTER TABLE pad_rek_sudut_pandang OWNER TO [nama_daerah] ;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pad_rek_sudut_pandang.nilai; Type: COMMENT; Schema: pad; Owner: [nama_daerah] 
--

COMMENT ON COLUMN pad_rek_sudut_pandang.nilai IS '
';


--
-- TOC entry 218 (class 1259 OID 28980)
-- Name: pad_reklame; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_reklame (
    id integer NOT NULL,
    kode character varying(6) NOT NULL,
    kecamatan_id integer NOT NULL,
    kelurahan_id integer NOT NULL,
    latitude double precision DEFAULT 0,
    longitude double precision DEFAULT 0,
    pemilik_nama character varying(50),
    pemilik_alamat character varying(255),
    pemilik_kecamatan character varying(50),
    pemilik_kelurahan character varying(50),
    pemilik_kota character varying(50)
);


ALTER TABLE pad_reklame OWNER TO [nama_daerah] ;

--
-- TOC entry 219 (class 1259 OID 28985)
-- Name: pad_reklame_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_reklame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_reklame_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 219
-- Name: pad_reklame_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_reklame_id_seq OWNED BY pad_reklame.id;


--
-- TOC entry 220 (class 1259 OID 28987)
-- Name: pad_report; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_report (
    id integer NOT NULL,
    spt_type_id integer NOT NULL,
    usaha_id integer NOT NULL,
    sptnm character varying(50),
    sknm character varying(50),
    nhnm character varying(50),
    sspdnm character varying(50),
    stpnm character varying(50),
    kartudtnm character varying(50)
);


ALTER TABLE pad_report OWNER TO [nama_daerah] ;

--
-- TOC entry 221 (class 1259 OID 28990)
-- Name: pad_report_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_report_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 221
-- Name: pad_report_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_report_id_seq OWNED BY pad_report.id;


--
-- TOC entry 222 (class 1259 OID 28992)
-- Name: pad_spt; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_spt (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    sptno integer NOT NULL,
    customer_id bigint NOT NULL,
    customer_usaha_id bigint NOT NULL,
    rekening_id bigint,
    pajak_id bigint NOT NULL,
    type_id integer,
    so character(1) NOT NULL,
    masadari timestamp without time zone NOT NULL,
    masasd timestamp without time zone NOT NULL,
    jatuhtempotgl timestamp without time zone,
    r_bayarid smallint,
    minomset double precision DEFAULT 0,
    dasar double precision DEFAULT 0 NOT NULL,
    tarif double precision DEFAULT 0 NOT NULL,
    denda double precision DEFAULT 0,
    bunga double precision DEFAULT 0 NOT NULL,
    setoran double precision DEFAULT 0,
    kenaikan double precision DEFAULT 0 NOT NULL,
    kompensasi double precision DEFAULT 0,
    lain2 double precision DEFAULT 0 NOT NULL,
    pajak_terhutang bigint DEFAULT 0 NOT NULL,
    air_manfaat_id integer,
    air_zona_id integer,
    meteran_awal integer DEFAULT 0,
    meteran_akhir integer DEFAULT 0,
    volume integer DEFAULT 0,
    satuan character varying,
    r_panjang double precision,
    r_lebar double precision,
    r_muka double precision,
    r_banyak double precision,
    r_luas double precision,
    r_tarifid smallint,
    r_kontrak double precision,
    r_lama integer,
    r_jalan_id integer,
    r_jalanklas_id integer,
    r_lokasi character varying(250),
    r_judul character varying(200),
    r_kelurahan_id integer,
    r_lokasi_id integer,
    r_calculated double precision,
    r_nsr numeric,
    r_nsrno character varying(30),
    r_nsrtgl timestamp without time zone,
    r_nsl_kecamatan_id integer,
    r_nsl_type_id integer,
    r_nsl_nilai double precision,
    notes character varying(255),
    unit_id bigint,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    terimanip character varying(50),
    terimatgl timestamp without time zone NOT NULL,
    kirimtgl timestamp without time zone,
    isprint_dc boolean DEFAULT false,
    r_nsr_id integer,
    r_lokasi_pasang_id integer,
    r_lokasi_pasang_val numeric,
    r_jalanklas_val numeric,
    r_sudut_pandang_id integer,
    r_sudut_pandang_val numeric,
    r_tinggi numeric,
    r_njop numeric,
    r_status character varying(20),
    r_njop_ketinggian numeric,
    status_pembayaran integer DEFAULT 0 NOT NULL,
    rek_no_paneng character varying(50),
    sptno_lengkap character varying(20),
    sptno_lama integer,
    r_nama character varying(100),
    r_alamat character varying(255),
    m_tonase double precision,
    m_njop double precision,
    r_kontrak_bulan double precision,
    nm_skpd character varying(220),
    nm_keg character varying(550),
    anggaran bigint
);


ALTER TABLE pad_spt OWNER TO [nama_daerah] ;

--
-- TOC entry 223 (class 1259 OID 29013)
-- Name: pad_spt_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_spt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_spt_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 223
-- Name: pad_spt_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_spt_id_seq OWNED BY pad_spt.id;


--
-- TOC entry 224 (class 1259 OID 29015)
-- Name: pad_spt_type; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_spt_type (
    id smallint NOT NULL,
    typenm character varying(20) NOT NULL,
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_spt_type OWNER TO [nama_daerah] ;

--
-- TOC entry 225 (class 1259 OID 29018)
-- Name: pad_sspd; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_sspd (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    sspdno integer NOT NULL,
    sspdtgl timestamp without time zone NOT NULL,
    spt_id bigint NOT NULL,
    bunga double precision DEFAULT 0,
    bulan_telat integer DEFAULT 0,
    hitung_bunga smallint DEFAULT 1,
    printed smallint DEFAULT 0,
    enabled smallint DEFAULT 1,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    sspdjam time without time zone,
    tp_id integer,
    is_validated integer DEFAULT 0,
    keterangan character varying(255),
    denda bigint DEFAULT 0,
    jml_bayar bigint DEFAULT 0,
    is_valid integer DEFAULT 1,
    cancel_jml_bayar bigint,
    cancel_bunga bigint,
    cancel_denda bigint,
    cancel_date timestamp without time zone,
    cancel_uid integer
);


ALTER TABLE pad_sspd OWNER TO [nama_daerah] ;

--
-- TOC entry 226 (class 1259 OID 29030)
-- Name: pad_sspd_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_sspd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_sspd_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 226
-- Name: pad_sspd_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_sspd_id_seq OWNED BY pad_sspd.id;


--
-- TOC entry 227 (class 1259 OID 29032)
-- Name: pad_stpd; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_stpd (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    stpdno bigint NOT NULL,
    stpdtgl timestamp without time zone NOT NULL,
    spt_id bigint NOT NULL,
    jatuhtempotgl timestamp without time zone,
    printed smallint DEFAULT 0 NOT NULL,
    stpdcount smallint DEFAULT 0 NOT NULL,
    bunga numeric DEFAULT 0,
    enabled smallint DEFAULT 1,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_stpd OWNER TO [nama_daerah] ;

--
-- TOC entry 228 (class 1259 OID 29042)
-- Name: pad_stpd_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_stpd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_stpd_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 228
-- Name: pad_stpd_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_stpd_id_seq OWNED BY pad_stpd.id;


--
-- TOC entry 229 (class 1259 OID 29044)
-- Name: pad_sudut_reklame_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_sudut_reklame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_sudut_reklame_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 229
-- Name: pad_sudut_reklame_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_sudut_reklame_id_seq OWNED BY pad_rek_sudut_pandang.id;


--
-- TOC entry 230 (class 1259 OID 29046)
-- Name: pad_terima; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_terima (
    id bigint NOT NULL,
    tahun integer NOT NULL,
    terimano bigint NOT NULL,
    terimatgl timestamp without time zone NOT NULL,
    jmlterima numeric DEFAULT 0 NOT NULL,
    customer_id bigint DEFAULT 0 NOT NULL,
    npwpd character varying DEFAULT 0 NOT NULL,
    nobukti character varying(15),
    notes character varying(200),
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_terima OWNER TO [nama_daerah] ;

--
-- TOC entry 231 (class 1259 OID 29055)
-- Name: pad_terima_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_terima_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_terima_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 231
-- Name: pad_terima_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_terima_id_seq OWNED BY pad_terima.id;


--
-- TOC entry 232 (class 1259 OID 29057)
-- Name: pad_terima_line; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_terima_line (
    id bigint NOT NULL,
    terima_id bigint NOT NULL,
    spt_id bigint NOT NULL,
    rekening_id integer,
    pajak_id integer NOT NULL,
    amount numeric,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_terima_line OWNER TO [nama_daerah] ;

--
-- TOC entry 233 (class 1259 OID 29063)
-- Name: pad_terima_line_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_terima_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_terima_line_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 233
-- Name: pad_terima_line_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_terima_line_id_seq OWNED BY pad_terima_line.id;


--
-- TOC entry 234 (class 1259 OID 29065)
-- Name: pad_usaha; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_usaha (
    id integer NOT NULL,
    usahanm character varying(50) NOT NULL,
    so character(1),
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer
);


ALTER TABLE pad_usaha OWNER TO [nama_daerah] ;

--
-- TOC entry 235 (class 1259 OID 29068)
-- Name: pad_usaha_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_usaha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_usaha_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 235
-- Name: pad_usaha_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_usaha_id_seq OWNED BY pad_usaha.id;


--
-- TOC entry 236 (class 1259 OID 29070)
-- Name: rka_kegiatan_line; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE rka_kegiatan_line (
    id bigint NOT NULL,
    rekening_id integer,
    unit_id integer,
    tahun integer,
    murni double precision,
    perubahan double precision
);


ALTER TABLE rka_kegiatan_line OWNER TO [nama_daerah] ;

--
-- TOC entry 237 (class 1259 OID 29073)
-- Name: rka_kegiatan_line_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE rka_kegiatan_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rka_kegiatan_line_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 237
-- Name: rka_kegiatan_line_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE rka_kegiatan_line_id_seq OWNED BY rka_kegiatan_line.id;


--
-- TOC entry 238 (class 1259 OID 29075)
-- Name: tblkecamatan; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE tblkecamatan (
    id integer NOT NULL,
    kecamatankd character varying(3) NOT NULL,
    kecamatannm character varying(50),
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    kecamatankd_old character varying(3)
);


ALTER TABLE tblkecamatan OWNER TO [nama_daerah] ;

--
-- TOC entry 239 (class 1259 OID 29078)
-- Name: tblkecamatan_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE tblkecamatan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblkecamatan_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 239
-- Name: tblkecamatan_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE tblkecamatan_id_seq OWNED BY tblkecamatan.id;


--
-- TOC entry 240 (class 1259 OID 29080)
-- Name: tblkelurahan; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE tblkelurahan (
    id integer NOT NULL,
    kecamatan_id integer NOT NULL,
    kelurahankd character varying(3) NOT NULL,
    kelurahannm character varying(25),
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    kelurahankd_old character varying(3)
);


ALTER TABLE tblkelurahan OWNER TO [nama_daerah] ;

--
-- TOC entry 241 (class 1259 OID 29083)
-- Name: tblkelurahan_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE tblkelurahan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblkelurahan_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 241
-- Name: tblkelurahan_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE tblkelurahan_id_seq OWNED BY tblkelurahan.id;


--
-- TOC entry 242 (class 1259 OID 29085)
-- Name: tblpejabat; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE tblpejabat (
    id integer NOT NULL,
    nip character varying(30),
    pejabatnm character varying(50),
    jabatan character varying(150),
    golongan character varying(5),
    pangkat character varying(30),
    tmt timestamp without time zone,
    enabled smallint
);


ALTER TABLE tblpejabat OWNER TO [nama_daerah] ;

--
-- TOC entry 243 (class 1259 OID 29088)
-- Name: tblpejabat_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE tblpejabat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblpejabat_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 243
-- Name: tblpejabat_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE tblpejabat_id_seq OWNED BY tblpejabat.id;


--
-- TOC entry 244 (class 1259 OID 29090)
-- Name: tblpemda; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE tblpemda (
    id integer NOT NULL,
    type character varying(100),
    kepalanm character varying(100),
    alamat character varying(255),
    telp character varying(100),
    pemdanm character varying(255),
    ibukota character varying(100),
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    jabatan character varying(20),
    ppkd_id bigint,
    sptyearly smallint,
    sspdyearly smallint,
    skpdyearly smallint,
    kasiryearly smallint,
    reklame_id smallint,
    pendapatan_id integer,
    pemdanmskt character varying(50),
    hda double precision,
    airtanah_id smallint,
    self_dok_id integer,
    office_dok_id integer,
    tgl_jatuhtempo_self integer,
    spt_denda double precision,
    tgl_spt integer,
    pad_bunga double precision,
    mineral_id integer,
    fax character varying(100),
    website character varying(255),
    email character varying(100),
    daerah character varying(255),
    alamat_lengkap character varying(255),
    sewatanah_id smallint
);


ALTER TABLE tblpemda OWNER TO [nama_daerah] ;

--
-- TOC entry 245 (class 1259 OID 29096)
-- Name: tblpemda_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE tblpemda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblpemda_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 245
-- Name: tblpemda_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE tblpemda_id_seq OWNED BY tblpemda.id;


--
-- TOC entry 246 (class 1259 OID 29098)
-- Name: tblrekening; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE tblrekening (
    id integer NOT NULL,
    rekeningkd character varying(15) NOT NULL,
    rekeningnm character varying(150),
    levelid integer,
    issummary smallint NOT NULL,
    defsign smallint,
    isppkd smallint DEFAULT 0 NOT NULL,
    tmt timestamp without time zone,
    enabled smallint,
    create_date timestamp without time zone,
    create_uid integer,
    write_date timestamp without time zone,
    write_uid integer,
    insidentil smallint DEFAULT 0
);


ALTER TABLE tblrekening OWNER TO [nama_daerah] ;

--
-- TOC entry 247 (class 1259 OID 29103)
-- Name: tblrekening_id_seq1; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE tblrekening_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblrekening_id_seq1 OWNER TO [nama_daerah] ;

--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 247
-- Name: tblrekening_id_seq1; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE tblrekening_id_seq1 OWNED BY tblrekening.id;


--
-- TOC entry 248 (class 1259 OID 29105)
-- Name: units; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE units (
    kode character varying(20),
    nama character varying(220),
    kategori character varying(50),
    singkat character varying(50),
    id integer NOT NULL,
    urusan_id smallint
);


ALTER TABLE units OWNER TO [nama_daerah] ;

--
-- TOC entry 249 (class 1259 OID 29108)
-- Name: units_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE units_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 249
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE units_id_seq OWNED BY units.id;


--
-- TOC entry 250 (class 1259 OID 29110)
-- Name: user_pad; Type: TABLE; Schema: pad; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE user_pad (
    id integer NOT NULL,
    user_id integer,
    customer_id bigint,
    passwd character varying(50),
    created timestamp without time zone,
    disabled smallint
);


ALTER TABLE user_pad OWNER TO [nama_daerah] ;

--
-- TOC entry 251 (class 1259 OID 29113)
-- Name: user_pad_id_seq; Type: SEQUENCE; Schema: pad; Owner: [nama_daerah] 
--

CREATE SEQUENCE user_pad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_pad_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 251
-- Name: user_pad_id_seq; Type: SEQUENCE OWNED BY; Schema: pad; Owner: [nama_daerah] 
--

ALTER SEQUENCE user_pad_id_seq OWNED BY user_pad.id;


SET search_path = public, pg_catalog;

--
-- TOC entry 252 (class 1259 OID 29173)
-- Name: inquiry; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE inquiry (
    id integer NOT NULL,
    tgl timestamp without time zone NOT NULL,
    nop character varying(32) NOT NULL,
    propinsi character varying(2) NOT NULL,
    kabupaten character varying(2) NOT NULL,
    kecamatan character varying(3) NOT NULL,
    kelurahan character varying(3) NOT NULL,
    blok character varying(3) NOT NULL,
    urut character varying(4) NOT NULL,
    jenis character varying(1) NOT NULL,
    tahun integer NOT NULL,
    tagihan double precision NOT NULL,
    jatuh_tempo date NOT NULL,
    bulan_tunggakan integer NOT NULL,
    persen_denda double precision NOT NULL,
    denda double precision NOT NULL,
    transmission timestamp without time zone,
    stan integer,
    settlement timestamp without time zone,
    pengirim character varying(16) NOT NULL
);


ALTER TABLE inquiry OWNER TO [nama_daerah] ;

--
-- TOC entry 253 (class 1259 OID 29176)
-- Name: inquiry_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE inquiry_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inquiry_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 254 (class 1259 OID 29178)
-- Name: pad_channel; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_channel (
    id integer NOT NULL,
    nama character varying(20) NOT NULL
);


ALTER TABLE pad_channel OWNER TO [nama_daerah] ;

--
-- TOC entry 255 (class 1259 OID 29181)
-- Name: pad_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_channel_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 255
-- Name: pad_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_channel_id_seq OWNED BY pad_channel.id;


--
-- TOC entry 256 (class 1259 OID 29183)
-- Name: pad_payment; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_payment (
    id bigint NOT NULL,
    sspd_id bigint NOT NULL,
    tgl timestamp with time zone NOT NULL,
    iso_request character varying(1024) NOT NULL,
    transmission timestamp with time zone NOT NULL,
    settlement date NOT NULL,
    stan integer NOT NULL,
    invoice_no character varying(32) NOT NULL,
    ntb character varying(32) NOT NULL,
    ntp character varying(32) NOT NULL,
    bank_id integer NOT NULL,
    channel_id integer NOT NULL,
    bank_ip character varying(15) NOT NULL
);


ALTER TABLE pad_payment OWNER TO [nama_daerah] ;

--
-- TOC entry 257 (class 1259 OID 29189)
-- Name: pad_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_payment_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 257
-- Name: pad_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_payment_id_seq OWNED BY pad_payment.id;


--
-- TOC entry 258 (class 1259 OID 29191)
-- Name: pad_reversal; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_reversal (
    id integer NOT NULL,
    tgl timestamp with time zone NOT NULL,
    iso_request character varying(1024) NOT NULL
);


ALTER TABLE pad_reversal OWNER TO [nama_daerah] ;

--
-- TOC entry 259 (class 1259 OID 29197)
-- Name: pad_tp; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pad_tp (
    id integer NOT NULL,
    singkatan character varying(16) NOT NULL,
    nama character varying(32) NOT NULL
);


ALTER TABLE pad_tp OWNER TO [nama_daerah] ;

--
-- TOC entry 260 (class 1259 OID 29200)
-- Name: pad_tp_id_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE pad_tp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pad_tp_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 260
-- Name: pad_tp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: [nama_daerah] 
--

ALTER SEQUENCE pad_tp_id_seq OWNED BY pad_tp.id;


--
-- TOC entry 261 (class 1259 OID 29202)
-- Name: payment; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE payment (
    id character varying(32) NOT NULL,
    inquiry_id integer NOT NULL,
    propinsi character varying(2) NOT NULL,
    kabupaten character varying(2) NOT NULL,
    kecamatan character varying(3) NOT NULL,
    kelurahan character varying(3) NOT NULL,
    blok character varying(3) NOT NULL,
    urut character varying(4) NOT NULL,
    jenis character varying(1) NOT NULL,
    tahun integer NOT NULL,
    ke integer NOT NULL,
    kd_kanwil_bank character varying(2) NOT NULL,
    kd_kppbb_bank character varying(2) NOT NULL,
    kd_bank_tunggal character varying(2) NOT NULL,
    kd_bank_persepsi character varying(2) NOT NULL,
    kd_tp character varying(2) NOT NULL,
    channel character varying(4),
    ntb character varying(64),
    iso_request character varying(1024) NOT NULL
);


ALTER TABLE payment OWNER TO [nama_daerah] ;

--
-- TOC entry 262 (class 1259 OID 29208)
-- Name: pembayaran_sppt_h2h; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE pembayaran_sppt_h2h (
    kd_propinsi character(2),
    kd_dati2 character(2),
    kd_kecamatan character(3),
    kd_kelurahan character(3),
    kd_blok character(3),
    no_urut character(4),
    kd_jns_op character(1),
    thn_pajak_sppt character(4),
    pembayaran_sppt_ke integer,
    kd_kanwil character(2),
    kd_kantor character(2),
    kd_tp character(2),
    denda_sppt double precision,
    jml_sppt_yg_dibayar double precision,
    tgl_pembayaran_sppt date,
    tgl_rekam_byr_sppt timestamp without time zone,
    nip_rekam_byr_sppt character(18),
    user_id integer
);


ALTER TABLE pembayaran_sppt_h2h OWNER TO [nama_daerah] ;

--
-- TOC entry 263 (class 1259 OID 29211)
-- Name: reversal; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE reversal (
    payment_id character varying(32) NOT NULL,
    tgl timestamp without time zone NOT NULL,
    iso_request character varying(1024) NOT NULL
);


ALTER TABLE reversal OWNER TO [nama_daerah] ;

--
-- TOC entry 264 (class 1259 OID 29217)
-- Name: sync_psppt_pg; Type: TABLE; Schema: public; Owner: [nama_daerah] ; Tablespace: 
--

CREATE TABLE sync_psppt_pg (
    id bigint NOT NULL,
    kd_propinsi character varying(2) NOT NULL,
    kd_dati2 character varying(2) NOT NULL,
    kd_kecamatan character varying(3) NOT NULL,
    kd_kelurahan character varying(3) NOT NULL,
    kd_blok character varying(3) NOT NULL,
    no_urut character varying(4) NOT NULL,
    kd_jns_op character varying(1) NOT NULL,
    thn_pajak_sppt character varying(4) NOT NULL,
    pembayaran_sppt_ke numeric(2,0) NOT NULL,
    jns_sinkron character varying(1) NOT NULL
);


ALTER TABLE sync_psppt_pg OWNER TO [nama_daerah] ;

--
-- TOC entry 265 (class 1259 OID 29220)
-- Name: sync_psppt_pg_id_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE sync_psppt_pg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sync_psppt_pg_id_seq OWNER TO [nama_daerah] ;

--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 265
-- Name: sync_psppt_pg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: [nama_daerah] 
--

ALTER SEQUENCE sync_psppt_pg_id_seq OWNED BY sync_psppt_pg.id;


--
-- TOC entry 266 (class 1259 OID 29222)
-- Name: sync_psppt_pg_seq; Type: SEQUENCE; Schema: public; Owner: [nama_daerah] 
--

CREATE SEQUENCE sync_psppt_pg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sync_psppt_pg_seq OWNER TO [nama_daerah] ;

SET search_path = app, pg_catalog;

--
-- TOC entry 2186 (class 2604 OID 29224)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY app_status ALTER COLUMN id SET DEFAULT nextval('app_status_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 29225)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY apps ALTER COLUMN id SET DEFAULT nextval('apps_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 29226)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY group_modules ALTER COLUMN id SET DEFAULT nextval('group_modules_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 29227)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 29228)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY modules ALTER COLUMN id SET DEFAULT nextval('modules_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 29229)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY user_groups ALTER COLUMN id SET DEFAULT nextval('user_groups_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 29230)
-- Name: id; Type: DEFAULT; Schema: app; Owner: [nama_daerah] 
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


SET search_path = pad, pg_catalog;

--
-- TOC entry 2199 (class 2604 OID 29246)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_air_hda ALTER COLUMN id SET DEFAULT nextval('pad_air_hda_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 29247)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_air_manfaat ALTER COLUMN id SET DEFAULT nextval('pad_air_manfaat_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 29248)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_air_volume ALTER COLUMN id SET DEFAULT nextval('pad_air_volume_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 29249)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_air_zona ALTER COLUMN id SET DEFAULT nextval('pad_air_zona_id_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 29250)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_customer ALTER COLUMN id SET DEFAULT nextval('pad_customer_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 29251)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_customer_kd_det ALTER COLUMN id SET DEFAULT nextval('pad_customer_kd_det_id_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 29252)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_customer_usaha ALTER COLUMN id SET DEFAULT nextval('pad_customer_usaha_id_seq'::regclass);


--
-- TOC entry 2209 (class 2604 OID 29253)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_kohir ALTER COLUMN id SET DEFAULT nextval('pad_kohir_id_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 29254)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_pajak ALTER COLUMN id SET DEFAULT nextval('pad_pajak_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 29255)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_pajak_tarif ALTER COLUMN id SET DEFAULT nextval('pad_pajak_tarif_id_seq'::regclass);


--
-- TOC entry 2207 (class 2604 OID 29256)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_rek_jalan ALTER COLUMN id SET DEFAULT nextval('pad_jalan_id_seq'::regclass);


--
-- TOC entry 2208 (class 2604 OID 29257)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_rek_jalan_klas ALTER COLUMN id SET DEFAULT nextval('pad_jalan_klas_id_seq'::regclass);


--
-- TOC entry 2210 (class 2604 OID 29258)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_rek_lokasi_pasang ALTER COLUMN id SET DEFAULT nextval('pad_lokasi_pasang_id_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 29259)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_rek_nsr ALTER COLUMN id SET DEFAULT nextval('pad_rek_nsr_id_seq'::regclass);


--
-- TOC entry 2221 (class 2604 OID 29260)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_rek_sudut_pandang ALTER COLUMN id SET DEFAULT nextval('pad_sudut_reklame_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 29261)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_reklame ALTER COLUMN id SET DEFAULT nextval('pad_reklame_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 29262)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_report ALTER COLUMN id SET DEFAULT nextval('pad_report_id_seq'::regclass);


--
-- TOC entry 2241 (class 2604 OID 29263)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_spt ALTER COLUMN id SET DEFAULT nextval('pad_spt_id_seq'::regclass);


--
-- TOC entry 2251 (class 2604 OID 29264)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_sspd ALTER COLUMN id SET DEFAULT nextval('pad_sspd_id_seq'::regclass);


--
-- TOC entry 2256 (class 2604 OID 29265)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_stpd ALTER COLUMN id SET DEFAULT nextval('pad_stpd_id_seq'::regclass);


--
-- TOC entry 2260 (class 2604 OID 29266)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_terima ALTER COLUMN id SET DEFAULT nextval('pad_terima_id_seq'::regclass);


--
-- TOC entry 2261 (class 2604 OID 29267)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_terima_line ALTER COLUMN id SET DEFAULT nextval('pad_terima_line_id_seq'::regclass);


--
-- TOC entry 2262 (class 2604 OID 29268)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_usaha ALTER COLUMN id SET DEFAULT nextval('pad_usaha_id_seq'::regclass);


--
-- TOC entry 2263 (class 2604 OID 29269)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY rka_kegiatan_line ALTER COLUMN id SET DEFAULT nextval('rka_kegiatan_line_id_seq'::regclass);


--
-- TOC entry 2264 (class 2604 OID 29270)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY tblkecamatan ALTER COLUMN id SET DEFAULT nextval('tblkecamatan_id_seq'::regclass);


--
-- TOC entry 2265 (class 2604 OID 29271)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY tblkelurahan ALTER COLUMN id SET DEFAULT nextval('tblkelurahan_id_seq'::regclass);


--
-- TOC entry 2266 (class 2604 OID 29272)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY tblpejabat ALTER COLUMN id SET DEFAULT nextval('tblpejabat_id_seq'::regclass);


--
-- TOC entry 2267 (class 2604 OID 29273)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY tblpemda ALTER COLUMN id SET DEFAULT nextval('tblpemda_id_seq'::regclass);


--
-- TOC entry 2270 (class 2604 OID 29274)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY tblrekening ALTER COLUMN id SET DEFAULT nextval('tblrekening_id_seq1'::regclass);


--
-- TOC entry 2271 (class 2604 OID 29275)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY units ALTER COLUMN id SET DEFAULT nextval('units_id_seq'::regclass);


--
-- TOC entry 2272 (class 2604 OID 29276)
-- Name: id; Type: DEFAULT; Schema: pad; Owner: [nama_daerah] 
--

ALTER TABLE ONLY user_pad ALTER COLUMN id SET DEFAULT nextval('user_pad_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2273 (class 2604 OID 29282)
-- Name: id; Type: DEFAULT; Schema: public; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_channel ALTER COLUMN id SET DEFAULT nextval('pad_channel_id_seq'::regclass);


--
-- TOC entry 2274 (class 2604 OID 29283)
-- Name: id; Type: DEFAULT; Schema: public; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_payment ALTER COLUMN id SET DEFAULT nextval('pad_payment_id_seq'::regclass);


--
-- TOC entry 2275 (class 2604 OID 29284)
-- Name: id; Type: DEFAULT; Schema: public; Owner: [nama_daerah] 
--

ALTER TABLE ONLY pad_tp ALTER COLUMN id SET DEFAULT nextval('pad_tp_id_seq'::regclass);


--
-- TOC entry 2276 (class 2604 OID 29285)
-- Name: id; Type: DEFAULT; Schema: public; Owner: [nama_daerah] 
--

ALTER TABLE ONLY sync_psppt_pg ALTER COLUMN id SET DEFAULT nextval('sync_psppt_pg_id_seq'::regclass);


SET search_path = app, pg_catalog;

--
-- TOC entry 2386 (class 0 OID 28684)
-- Dependencies: 175
-- Data for Name: app_status; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--

COPY app_status (id, tahun, app_id, step, operator, review, manager) FROM stdin;
1	2011	4	renja	0	0	0
2	2012	1	1	0	0	0
\.


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 176
-- Name: app_status_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('app_status_id_seq', 2, true);


--
-- TOC entry 2388 (class 0 OID 28692)
-- Dependencies: 177
-- Data for Name: apps; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--



--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 178
-- Name: apps_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('apps_id_seq', 22, true);


--
-- TOC entry 2390 (class 0 OID 28698)
-- Dependencies: 179
-- Data for Name: group_modules; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--



--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 180
-- Name: group_modules_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('group_modules_id_seq', 106, true);


--
-- TOC entry 2392 (class 0 OID 28707)
-- Dependencies: 181
-- Data for Name: groups; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--

COPY groups (id, nama, locked, kode) FROM stdin;
1	Sys Admin	1	sa

\.


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 182
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('groups_id_seq', 27, true);


--
-- TOC entry 2394 (class 0 OID 28713)
-- Dependencies: 183
-- Data for Name: modules; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--



--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 184
-- Name: modules_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('modules_id_seq', 57, true);


--
-- TOC entry 2396 (class 0 OID 28718)
-- Dependencies: 185
-- Data for Name: user_groups; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--



--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('user_groups_id_seq', 183, true);


--
-- TOC entry 2398 (class 0 OID 28723)
-- Dependencies: 187
-- Data for Name: users; Type: TABLE DATA; Schema: app; Owner: [nama_daerah] 
--


--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: app; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('users_id_seq', 149, true);


SET search_path = pad, pg_catalog;

--
-- TOC entry 2400 (class 0 OID 28890)
-- Dependencies: 189
-- Data for Name: pad_air_hda; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_air_hda (id, zona_id, manfaat_id, volume_id, hda) FROM stdin;
\.


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 190
-- Name: pad_air_hda_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_air_hda_id_seq', 600, true);


--
-- TOC entry 2402 (class 0 OID 28895)
-- Dependencies: 191
-- Data for Name: pad_air_manfaat; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_air_manfaat (id, manfaatnm) FROM stdin;
\.


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 192
-- Name: pad_air_manfaat_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_air_manfaat_id_seq', 20, true);


--
-- TOC entry 2404 (class 0 OID 28900)
-- Dependencies: 193
-- Data for Name: pad_air_volume; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_air_volume (id, volume) FROM stdin;
\.


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 194
-- Name: pad_air_volume_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_air_volume_id_seq', 12, true);


--
-- TOC entry 2406 (class 0 OID 28905)
-- Dependencies: 195
-- Data for Name: pad_air_zona; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_air_zona (id, zonanm, nindex) FROM stdin;
\.


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 196
-- Name: pad_air_zona_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_air_zona_id_seq', 10, true);


--
-- TOC entry 2408 (class 0 OID 28910)
-- Dependencies: 197
-- Data for Name: pad_customer; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 198
-- Name: pad_customer_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_customer_id_seq', 21795, true);


--
-- TOC entry 2410 (class 0 OID 28918)
-- Dependencies: 199
-- Data for Name: pad_customer_kd_det; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_customer_kd_det (id, customer_id, nourut, notes, tarif, kamar, volume) FROM stdin;
\.


--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 200
-- Name: pad_customer_kd_det_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_customer_kd_det_id_seq', 2, true);


--
-- TOC entry 2412 (class 0 OID 28923)
-- Dependencies: 201
-- Data for Name: pad_customer_usaha; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 202
-- Name: pad_customer_usaha_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_customer_usaha_id_seq', 14437, true);


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 204
-- Name: pad_jalan_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_jalan_id_seq', 172, true);


--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 206
-- Name: pad_jalan_klas_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_jalan_klas_id_seq', 8, true);


--
-- TOC entry 2418 (class 0 OID 28942)
-- Dependencies: 207
-- Data for Name: pad_kohir; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 212
-- Name: pad_pajak_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_pajak_id_seq', 1212, true);


--
-- TOC entry 2424 (class 0 OID 28962)
-- Dependencies: 213
-- Data for Name: pad_pajak_tarif; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 214
-- Name: pad_pajak_tarif_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_pajak_tarif_id_seq', 705, true);


--
-- TOC entry 2414 (class 0 OID 28932)
-- Dependencies: 203
-- Data for Name: pad_rek_jalan; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_rek_jalan (id, jalan_klas_id, jalankd, jalannm, tmt, enabled, create_date, create_uid, write_date, write_uid) FROM stdin;
\.


--
-- TOC entry 2416 (class 0 OID 28937)
-- Dependencies: 205
-- Data for Name: pad_rek_jalan_klas; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_rek_jalan_klas (id, kelasnm, nilai) FROM stdin;
\.


--
-- TOC entry 2420 (class 0 OID 28947)
-- Dependencies: 209
-- Data for Name: pad_rek_lokasi_pasang; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_rek_lokasi_pasang (id, lokasinm, nilai) FROM stdin;
\.


--
-- TOC entry 2426 (class 0 OID 28969)
-- Dependencies: 215
-- Data for Name: pad_rek_nsr; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_rek_nsr (id, nsrnm, nilai) FROM stdin;
\.


--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 216
-- Name: pad_rek_nsr_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_rek_nsr_id_seq', 1, false);


--
-- TOC entry 2428 (class 0 OID 28977)
-- Dependencies: 217
-- Data for Name: pad_rek_sudut_pandang; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_rek_sudut_pandang (id, sudutnm, nilai) FROM stdin;
\.


--
-- TOC entry 2429 (class 0 OID 28980)
-- Dependencies: 218
-- Data for Name: pad_reklame; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_reklame (id, kode, kecamatan_id, kelurahan_id, latitude, longitude, pemilik_nama, pemilik_alamat, pemilik_kecamatan, pemilik_kelurahan, pemilik_kota) FROM stdin;
\.


--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 219
-- Name: pad_reklame_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_reklame_id_seq', 1, false);


--
-- TOC entry 2431 (class 0 OID 28987)
-- Dependencies: 220
-- Data for Name: pad_report; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 221
-- Name: pad_report_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_report_id_seq', 34, true);


--
-- TOC entry 2433 (class 0 OID 28992)
-- Dependencies: 222
-- Data for Name: pad_spt; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 223
-- Name: pad_spt_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_spt_id_seq', 26459, true);


--
-- TOC entry 2435 (class 0 OID 29015)
-- Dependencies: 224
-- Data for Name: pad_spt_type; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_spt_type (id, typenm, tmt, enabled, create_date, create_uid, write_date, write_uid) FROM stdin;
1	SELF	\N	1	\N	\N	\N	\N
2	SKPD	\N	1	\N	\N	\N	\N
5	SKPDKB	\N	1	\N	\N	\N	\N
8	SKPDLB	\N	1	\N	\N	\N	\N
9	SKRD	\N	0	\N	\N	\N	\N
11	SKRDLB	\N	0	\N	\N	\N	\N
12	SKRDT	\N	0	\N	\N	\N	\N
14	STRD	\N	0	\N	\N	\N	\N
13	STPD	\N	0	\N	\N	\N	\N
7	SKPDKBT	\N	1	\N	\N	\N	\N
4	SKPDN	\N	0	\N	\N	\N	\N
10	SKRDJ	\N	0	\N	\N	\N	\N
6	SKPDKBJ	\N	1	\N	\N	\N	\N
3	SKPDJ	\N	1	\N	\N	\N	\N
\.


--
-- TOC entry 2436 (class 0 OID 29018)
-- Dependencies: 225
-- Data for Name: pad_sspd; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 226
-- Name: pad_sspd_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_sspd_id_seq', 12631, true);


--
-- TOC entry 2438 (class 0 OID 29032)
-- Dependencies: 227
-- Data for Name: pad_stpd; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 228
-- Name: pad_stpd_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_stpd_id_seq', 422, true);


--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 229
-- Name: pad_sudut_reklame_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_sudut_reklame_id_seq', 20, true);


--
-- TOC entry 2441 (class 0 OID 29046)
-- Dependencies: 230
-- Data for Name: pad_terima; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_terima (id, tahun, terimano, terimatgl, jmlterima, customer_id, npwpd, nobukti, notes, enabled, create_date, create_uid, write_date, write_uid) FROM stdin;
\.


--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 231
-- Name: pad_terima_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_terima_id_seq', 1, false);


--
-- TOC entry 2443 (class 0 OID 29057)
-- Dependencies: 232
-- Data for Name: pad_terima_line; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_terima_line (id, terima_id, spt_id, rekening_id, pajak_id, amount, enabled, create_date, create_uid, write_date, write_uid) FROM stdin;
\.


--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 233
-- Name: pad_terima_line_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_terima_line_id_seq', 1, false);


--
-- TOC entry 2445 (class 0 OID 29065)
-- Dependencies: 234
-- Data for Name: pad_usaha; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY pad_usaha (id, usahanm, so, tmt, enabled, create_date, create_uid, write_date, write_uid) FROM stdin;
19	PBB	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
20	BPHTB	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
10	HOTEL	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
11	HIBURAN	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
12	REKLAME	O	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
14	SARANG BURUNG WALET	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
15	PENERANGAN JALAN	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
16	MINERAL BUKAN LOGAM & BATUAN	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
17	PARKIR	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
18	AIR TANAH	O	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
13	RESTORAN	S	2010-01-01 00:00:00	1	2014-12-13 00:00:00	999	\N	\N
21	SEWA TANAH	S	2015-01-01 00:00:00	1	2015-08-07 00:00:00	1	2015-08-07 00:00:00	1
\.


--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 235
-- Name: pad_usaha_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_usaha_id_seq', 21, true);


--
-- TOC entry 2447 (class 0 OID 29070)
-- Dependencies: 236
-- Data for Name: rka_kegiatan_line; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 237
-- Name: rka_kegiatan_line_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('rka_kegiatan_line_id_seq', 148, true);


--
-- TOC entry 2449 (class 0 OID 29075)
-- Dependencies: 238
-- Data for Name: tblkecamatan; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 239
-- Name: tblkecamatan_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('tblkecamatan_id_seq', 173, true);


--
-- TOC entry 2451 (class 0 OID 29080)
-- Dependencies: 240
-- Data for Name: tblkelurahan; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 241
-- Name: tblkelurahan_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('tblkelurahan_id_seq', 1490, true);


--
-- TOC entry 2453 (class 0 OID 29085)
-- Dependencies: 242
-- Data for Name: tblpejabat; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--



--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 243
-- Name: tblpejabat_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('tblpejabat_id_seq', 287, true);


--
-- TOC entry 2455 (class 0 OID 29090)
-- Dependencies: 244
-- Data for Name: tblpemda; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY tblpemda (id, type, kepalanm, alamat, telp, pemdanm, ibukota, tmt, enabled, create_date, create_uid, write_date, write_uid, jabatan, ppkd_id, sptyearly, sspdyearly, skpdyearly, kasiryearly, reklame_id, pendapatan_id, pemdanmskt, hda, airtanah_id, self_dok_id, office_dok_id, tgl_jatuhtempo_self, spt_denda, tgl_spt, pad_bunga, mineral_id, fax, website, email, daerah, alamat_lengkap, sewatanah_id) FROM stdin;
2	DINAS	-	Jl. Aruji Kartawinata No.12A	(0232) 871620	DINAS PENDAPATAN DAERAH	[nama_daerah] 	2014-12-13 00:00:00	1	\N	\N	2013-01-14 13:31:15	1	-	1	1	1	1	1	12	3	DIPENDA	597	18	1	2	15	0	20	0.02	16	(0232) 871620	www.[nama_daerah] .opensipkd.com	dipenda@[nama_daerah] .org	PEMERINTAH KABUPATEN [nama_daerah] 	Jl. Aruji Kartawinata No.12A Telp. (0232) 871620, 876511 Fax. 871620 [nama_daerah]  - 45512	21
\.


--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 245
-- Name: tblpemda_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('tblpemda_id_seq', 2, true);


--
-- TOC entry 2457 (class 0 OID 29098)
-- Dependencies: 246
-- Data for Name: tblrekening; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 247
-- Name: tblrekening_id_seq1; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('tblrekening_id_seq1', 1341, true);


--
-- TOC entry 2459 (class 0 OID 29105)
-- Dependencies: 248
-- Data for Name: units; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY units (kode, nama, kategori, singkat, id, urusan_id) FROM stdin;
\.


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 249
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('units_id_seq', 1, false);


--
-- TOC entry 2461 (class 0 OID 29110)
-- Dependencies: 250
-- Data for Name: user_pad; Type: TABLE DATA; Schema: pad; Owner: [nama_daerah] 
--

COPY user_pad (id, user_id, customer_id, passwd, created, disabled) FROM stdin;
\.


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 251
-- Name: user_pad_id_seq; Type: SEQUENCE SET; Schema: pad; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('user_pad_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 2463 (class 0 OID 29173)
-- Dependencies: 252
-- Data for Name: inquiry; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY inquiry (id, tgl, nop, propinsi, kabupaten, kecamatan, kelurahan, blok, urut, jenis, tahun, tagihan, jatuh_tempo, bulan_tunggakan, persen_denda, denda, transmission, stan, settlement, pengirim) FROM stdin;
\.


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 253
-- Name: inquiry_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('inquiry_seq', 1, false);


--
-- TOC entry 2465 (class 0 OID 29178)
-- Dependencies: 254
-- Data for Name: pad_channel; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY pad_channel (id, nama) FROM stdin;
\.


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 255
-- Name: pad_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_channel_id_seq', 1, false);


--
-- TOC entry 2467 (class 0 OID 29183)
-- Dependencies: 256
-- Data for Name: pad_payment; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY pad_payment (id, sspd_id, tgl, iso_request, transmission, settlement, stan, invoice_no, ntb, ntp, bank_id, channel_id, bank_ip) FROM stdin;
\.


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 257
-- Name: pad_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_payment_id_seq', 1, false);


--
-- TOC entry 2469 (class 0 OID 29191)
-- Dependencies: 258
-- Data for Name: pad_reversal; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY pad_reversal (id, tgl, iso_request) FROM stdin;
\.


--
-- TOC entry 2470 (class 0 OID 29197)
-- Dependencies: 259
-- Data for Name: pad_tp; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY pad_tp (id, singkatan, nama) FROM stdin;
\.


--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 260
-- Name: pad_tp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('pad_tp_id_seq', 1, false);


--
-- TOC entry 2472 (class 0 OID 29202)
-- Dependencies: 261
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY payment (id, inquiry_id, propinsi, kabupaten, kecamatan, kelurahan, blok, urut, jenis, tahun, ke, kd_kanwil_bank, kd_kppbb_bank, kd_bank_tunggal, kd_bank_persepsi, kd_tp, channel, ntb, iso_request) FROM stdin;
\.


--
-- TOC entry 2473 (class 0 OID 29208)
-- Dependencies: 262
-- Data for Name: pembayaran_sppt_h2h; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY pembayaran_sppt_h2h (kd_propinsi, kd_dati2, kd_kecamatan, kd_kelurahan, kd_blok, no_urut, kd_jns_op, thn_pajak_sppt, pembayaran_sppt_ke, kd_kanwil, kd_kantor, kd_tp, denda_sppt, jml_sppt_yg_dibayar, tgl_pembayaran_sppt, tgl_rekam_byr_sppt, nip_rekam_byr_sppt, user_id) FROM stdin;
\.


--
-- TOC entry 2474 (class 0 OID 29211)
-- Dependencies: 263
-- Data for Name: reversal; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY reversal (payment_id, tgl, iso_request) FROM stdin;
\.


--
-- TOC entry 2475 (class 0 OID 29217)
-- Dependencies: 264
-- Data for Name: sync_psppt_pg; Type: TABLE DATA; Schema: public; Owner: [nama_daerah] 
--

COPY sync_psppt_pg (id, kd_propinsi, kd_dati2, kd_kecamatan, kd_kelurahan, kd_blok, no_urut, kd_jns_op, thn_pajak_sppt, pembayaran_sppt_ke, jns_sinkron) FROM stdin;
\.


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 265
-- Name: sync_psppt_pg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('sync_psppt_pg_id_seq', 1, false);


--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 266
-- Name: sync_psppt_pg_seq; Type: SEQUENCE SET; Schema: public; Owner: [nama_daerah] 
--

SELECT pg_catalog.setval('sync_psppt_pg_seq', 1, false);


--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-12-09 23:22:43

--
-- PostgreSQL database dump complete
--

