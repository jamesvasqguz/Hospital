package Backend;

/**
 *
 * @author jara
 */
public class Doctor {

    private String idDoc;
    private String nombreDoc;
    private String colegiadoDoc;
    private String dpiDoc;
    private String telefonoDoc;
    private String correoDoc;
    private String horaI;
    private String horaF;
    private String fechaI;

    public Doctor(String idDoc, String nombreDoc, String colegiadoDoc, String dpiDoc, String telefonoDoc, String correoDoc, String horaI, String horaF, String fechaI) {
        this.idDoc = idDoc;
        this.nombreDoc = nombreDoc;
        this.colegiadoDoc = colegiadoDoc;
        this.dpiDoc = dpiDoc;
        this.telefonoDoc = telefonoDoc;
        this.correoDoc = correoDoc;
        this.horaI = horaI;
        this.horaF = horaF;
        this.fechaI = fechaI;
    }

    public String getIdDoc() {
        return idDoc;
    }

    public void setIdDoc(String idDoc) {
        this.idDoc = idDoc;
    }

    public String getNombreDoc() {
        return nombreDoc;
    }

    public void setNombreDoc(String nombreDoc) {
        this.nombreDoc = nombreDoc;
    }

    public String getColegiadoDoc() {
        return colegiadoDoc;
    }

    public void setColegiadoDoc(String colegiadoDoc) {
        this.colegiadoDoc = colegiadoDoc;
    }

    public String getDpiDoc() {
        return dpiDoc;
    }

    public void setDpiDoc(String dpiDoc) {
        this.dpiDoc = dpiDoc;
    }

    public String getTelefonoDoc() {
        return telefonoDoc;
    }

    public void setTelefonoDoc(String telefonoDoc) {
        this.telefonoDoc = telefonoDoc;
    }

    public String getCorreoDoc() {
        return correoDoc;
    }

    public void setCorreoDoc(String correoDoc) {
        this.correoDoc = correoDoc;
    }

    public String getHoraI() {
        return horaI;
    }

    public void setHoraI(String horaI) {
        this.horaI = horaI;
    }

    public String getHoraF() {
        return horaF;
    }

    public void setHoraF(String horaF) {
        this.horaF = horaF;
    }

    public String getFechaI() {
        return fechaI;
    }

    public void setFechaI(String fechaI) {
        this.fechaI = fechaI;
    }

}
