package id.ac.tazkia.dosen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author jimmy
 * Entity ini digunakan untuk relasi kegiatan dosen, sedangkan
 * untuk kegiatan belajar mengajar menggunakan class entity BuktiKinerja
 * @see id.ac.tazkia.dosen.entity.BuktiKinerja
 */
@Entity
@Table(name = "t_bukti_kinerja_kegiatan")
public class BuktiKinerjaKegiatan {
    
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @NotNull
    @NotEmpty
    private String nama;

    @NotNull
    @NotEmpty
    private String url;
    
    @NotNull
    @ManyToOne
    @JoinColumn(name = "id_kegiatan_dosen")
    private KegiatanDosen kegiatanDosen;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public KegiatanDosen getKegiatanDosen() {
        return kegiatanDosen;
    }

    public void setKegiatanDosen(KegiatanDosen kegiatanDosen) {
        this.kegiatanDosen = kegiatanDosen;
    }
    
}
