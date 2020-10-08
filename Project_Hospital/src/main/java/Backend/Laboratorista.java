package Backend;

/**
 *
 * @author jara
 */
public class Laboratorista {

    private String idLabo;
    private String nombreLabo;
    private String registroLabo;
    private String dpiLabo;
    private String telegonoLabo;
    private String examenLabo;
    private String correoLabo;
    private String fechaI;

    public Laboratorista(String idLabo, String nombreLabo, String registroLabo, String dpiLabo, String telegonoLabo, String examenLabo, String correoLabo, String fechaI) {
        this.idLabo = idLabo;
        this.nombreLabo = nombreLabo;
        this.registroLabo = registroLabo;
        this.dpiLabo = dpiLabo;
        this.telegonoLabo = telegonoLabo;
        this.examenLabo = examenLabo;
        this.correoLabo = correoLabo;
        this.fechaI = fechaI;
    }

    public String getIdLabo() {
        return idLabo;
    }

    public void setIdLabo(String idLabo) {
        this.idLabo = idLabo;
    }

    public String getNombreLabo() {
        return nombreLabo;
    }

    public void setNombreLabo(String nombreLabo) {
        this.nombreLabo = nombreLabo;
    }

    public String getRegistroLabo() {
        return registroLabo;
    }

    public void setRegistroLabo(String registroLabo) {
        this.registroLabo = registroLabo;
    }

    public String getDpiLabo() {
        return dpiLabo;
    }

    public void setDpiLabo(String dpiLabo) {
        this.dpiLabo = dpiLabo;
    }

    public String getTelegonoLabo() {
        return telegonoLabo;
    }

    public void setTelegonoLabo(String telegonoLabo) {
        this.telegonoLabo = telegonoLabo;
    }

    public String getExamenLabo() {
        return examenLabo;
    }

    public void setExamenLabo(String examenLabo) {
        this.examenLabo = examenLabo;
    }

    public String getCorreoLabo() {
        return correoLabo;
    }

    public void setCorreoLabo(String correoLabo) {
        this.correoLabo = correoLabo;
    }

    public String getFechaI() {
        return fechaI;
    }

    public void setFechaI(String fechaI) {
        this.fechaI = fechaI;
    }
}
