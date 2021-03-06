CREATE TABLE m_fakultas(
  id character varying(255) NOT NULL,
  keterangan character varying(255),
  nama character varying(255) NOT NULL
);

ALTER TABLE ONLY m_fakultas
    ADD CONSTRAINT m_fakultas_pkey PRIMARY KEY (id);

ALTER TABLE program_studi
    ADD COLUMN id_fakultas character varying(255);

ALTER TABLE ONLY program_studi
    ADD CONSTRAINT fksukwm0lnhl9g0vigm5unme7l8 FOREIGN KEY (id_fakultas)
      REFERENCES m_fakultas (id);

CREATE TABLE t_pengajuan_dosen(
  id character varying(255) NOT NULL,
  angka_kredit_dibutuhkan integer NOT NULL,
  angka_kredit_sekarang integer NOT NULL,
  angka_kredit_usulan integer NOT NULL,
  golongan character varying(255) NOT NULL,
  jenis_usulan character varying(255) NOT NULL,
  karpeg character varying(255) NOT NULL,
  kategori_dosen character varying(255) NOT NULL,
  kode_bidang_ilmu character varying(255) NOT NULL,
  lampiran_lengkap boolean NOT NULL,
  nama_bidang_ilmu character varying(255) NOT NULL,
  nip character varying(255) NOT NULL,
  nomor_surat character varying(255) NOT NULL,
  pangkat character varying(255) NOT NULL,
  pendidikan_tertinggi_sebelumnya character varying(255) NOT NULL,
  pendidikan_tertinggi_sekarang character varying(255) NOT NULL,
  status character varying(255) NOT NULL,
  tanggal_surat date,
  tmt_pangkat date,
  usulan_menjadi character varying(255) NOT NULL,
  id_dosen character varying(255) NOT NULL,
  id_mata_kuliah character varying(255) NOT NULL,
  id_program_studi character varying(255) NOT NULL
);

CREATE TABLE m_jenis_pengajuan_dokumen(
  id character varying(255) NOT NULL,
  keterangan character varying(255),
  nama character varying(255) NOT NULL,
  required boolean NOT NULL
);

CREATE TABLE t_pengajuan_document
(
  id character varying(255) NOT NULL,
  filename character varying(255) NOT NULL,
  status character varying(255) NOT NULL,
  id_jenis_dokumen character varying(255) NOT NULL,
  id_pengajuan_dosen character varying(255) NOT NULL
);

ALTER TABLE ONLY t_pengajuan_dosen
    ADD CONSTRAINT t_pengajuan_dosen_pkey PRIMARY KEY (id);

ALTER TABLE ONLY m_jenis_pengajuan_dokumen
    ADD CONSTRAINT m_jenis_pengajuan_dokumen_pkey PRIMARY KEY (id);

ALTER TABLE ONLY t_pengajuan_document
    ADD CONSTRAINT t_pengajuan_document_pkey PRIMARY KEY (id);


ALTER TABLE ONLY t_pengajuan_dosen
    ADD CONSTRAINT fk4v74m1lq6pyy41tw1u56qfcbu FOREIGN KEY (id_dosen)
         REFERENCES dosen (id);

ALTER TABLE ONLY t_pengajuan_dosen
    ADD CONSTRAINT fka2sltmrvpakny2h24xxs6fp4t FOREIGN KEY (id_program_studi)
         REFERENCES program_studi (id);

ALTER TABLE ONLY t_pengajuan_dosen
    ADD CONSTRAINT fkor6qki9sb76qjndd5yl5abwt9 FOREIGN KEY (id_mata_kuliah)
         REFERENCES mata_kuliah (id);

ALTER TABLE ONLY t_pengajuan_document
    ADD CONSTRAINT fkctib070e8dlidyf4xvm9jf4xa FOREIGN KEY (id_jenis_dokumen)
        REFERENCES m_jenis_pengajuan_dokumen (id);

ALTER TABLE ONLY t_pengajuan_document
    ADD CONSTRAINT fkdwl2bpek80bat2ijo64okfbyj FOREIGN KEY (id_pengajuan_dosen)
        REFERENCES t_pengajuan_dosen (id);

ALTER TABLE ONLY t_pengajuan_document
    ADD CONSTRAINT ukmot5j8tnpwqs59o9iftxbl31q UNIQUE (id_pengajuan_dosen, id_jenis_dokumen);