CREATE TABLE src_isvz.etl (
	name VARCHAR PRIMARY KEY,
	url VARCHAR NOT NULL,
	size NUMERIC
);

CREATE TABLE src_isvz.vestnik_vz (
	rok SMALLINT,
	id_zadani VARCHAR,
	id_zakazky VARCHAR,
	evidencni_cislo_v_zna_vvz VARCHAR,
	cislo_formulare_na_vvz VARCHAR,
	druh_formulare VARCHAR,
	cislo_casti_zadani_vz VARCHAR,
	nazev_casti_vz TEXT,
	zadani_casti_zakazky BOOLEAN,
	informace_o_nezadani_casti_zakazky VARCHAR,
	datum_zadani_vz DATE,
	pocet_obdrzenych_nabidek NUMERIC,
	puvodni_odhadovana_celkova_hodnota_vz DECIMAL(18,2),
	puvodni_odhadovana_celkova_hodnota_vz_mena CHAR(3),
	celkova_konecna_hodnota_v_zza_zadani DECIMAL(18,2),
	celkova_konecna_hodnota_v_zmena_za_zadani CHAR(3),
	hodnota_nejnizsi_nabidky DECIMAL(18,2),
	hodnota_nejnizsi_nabidky_mena CHAR(3),
	hodnota_nejvyssi_nabidky DECIMAL(18,2),
	subdodavky_hodnota_bez_dph DECIMAL(18,2),
	subdodavky_mena CHAR(3),
	subdodavky_pomer NUMERIC,
	datum_odeslani_formulare_na_vvz DATE,
	platny_formular BOOLEAN,
)