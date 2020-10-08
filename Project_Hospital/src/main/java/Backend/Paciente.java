package Backend;

/**
 *
 * @author jara
 */
public class Paciente {

    private String idPac;
    private String nombrePac;
    private String sexoPac;
    private String fechaN;
    private String dpiPac;
    private String telefonoPac;
    private double pesoPac;
    private String tipoSangre;
    private String correoPac;

    public Paciente(String idPac, String nombrePac, String sexoPac, String fechaN, String dpiPac, String telefonoPac, double pesoPac, String tipoSangre, String correoPac) {
        this.idPac = idPac;
        this.nombrePac = nombrePac;
        this.sexoPac = sexoPac;
        this.fechaN = fechaN;
        this.dpiPac = dpiPac;
        this.telefonoPac = telefonoPac;
        this.pesoPac = pesoPac;
        this.tipoSangre = tipoSangre;
        this.correoPac = correoPac;
    }

    public String getIdPac() {
        return idPac;
    }

    public void setIdPac(String idPac) {
        this.idPac = idPac;
    }

    public String getNombrePac() {
        return nombrePac;
    }

    public void setNombrePac(String nombrePac) {
        this.nombrePac = nombrePac;
    }

    public String getSexoPac() {
        return sexoPac;
    }

    public void setSexoPac(String sexoPac) {
        this.sexoPac = sexoPac;
    }

    public String getFechaN() {
        return fechaN;
    }

    public void setFechaN(String fechaN) {
        this.fechaN = fechaN;
    }

    public String getDpiPac() {
        return dpiPac;
    }

    public void setDpiPac(String dpiPac) {
        this.dpiPac = dpiPac;
    }

    public String getTelefonoPac() {
        return telefonoPac;
    }

    public void setTelefonoPac(String telefonoPac) {
        this.telefonoPac = telefonoPac;
    }

    public double getPesoPac() {
        return pesoPac;
    }

    public void setPesoPac(double pesoPac) {
        this.pesoPac = pesoPac;
    }

    public String getTipoSangre() {
        return tipoSangre;
    }

    public void setTipoSangre(String tipoSangre) {
        this.tipoSangre = tipoSangre;
    }

    public String getCorreoPac() {
        return correoPac;
    }

    public void setCorreoPac(String correoPac) {
        this.correoPac = correoPac;
    }

}
