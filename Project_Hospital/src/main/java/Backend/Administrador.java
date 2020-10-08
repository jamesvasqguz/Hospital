package Backend;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jara
 */
@XmlRootElement(name = "admin")
public class Administrador {
    private String idAdmin;
    private String dpiAdmin;
    private String nombreAdmin;

    public Administrador(String idAdmin, String dpiAdmin, String nombreAdmin) {
        this.idAdmin = idAdmin;
        this.dpiAdmin = dpiAdmin;
        this.nombreAdmin = nombreAdmin;
    }
    
    public Administrador(){}
    
    public String getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(String idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getDpiAdmin() {
        return dpiAdmin;
    }

    public void setDpiAdmin(String dpiAdmin) {
        this.dpiAdmin = dpiAdmin;
    }

    public String getNombreAdmin() {
        return nombreAdmin;
    }

    public void setNombreAdmin(String nombreAdmin) {
        this.nombreAdmin = nombreAdmin;
    }
}
