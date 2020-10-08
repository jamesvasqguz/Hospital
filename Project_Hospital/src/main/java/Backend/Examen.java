package Backend;

/**
 *
 * @author jara
 */
public class Examen {
    private String idExam;
    private String nombreExam;
    private boolean ordenExam;
    private String descExam;
    private double costoExam;
    private String tipo_informeExam;
    
    public Examen(){}
    
    public Examen(String idExam, String nombreExam, boolean ordenExam, String descExam, double costoExam, String tipo_informeExam) {
        this.idExam = idExam;
        this.nombreExam = nombreExam;
        this.ordenExam = ordenExam;
        this.descExam = descExam;
        this.costoExam = costoExam;
        this.tipo_informeExam = tipo_informeExam;
    }

    public String getIdExam() {
        return idExam;
    }

    public void setIdExam(String idExam) {
        this.idExam = idExam;
    }

    public String getNombreExam() {
        return nombreExam;
    }

    public void setNombreExam(String nombreExam) {
        this.nombreExam = nombreExam;
    }

    public boolean isOrdenExam() {
        return ordenExam;
    }

    public void setOrdenExam(boolean ordenExam) {
        this.ordenExam = ordenExam;
    }

    public String getDescExam() {
        return descExam;
    }

    public void setDescExam(String descExam) {
        this.descExam = descExam;
    }

    public double getCostoExam() {
        return costoExam;
    }

    public void setCostoExam(double costoExam) {
        this.costoExam = costoExam;
    }

    public String getTipo_informeExam() {
        return tipo_informeExam;
    }

    public void setTipo_informeExam(String tipo_informeExam) {
        this.tipo_informeExam = tipo_informeExam;
    }
    
}
