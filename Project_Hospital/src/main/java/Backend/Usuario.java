package Backend;

/**
 *
 * @author jara
 */
public class Usuario {

    private String id;
    private String role;
    private String contraseña;

    public Usuario(String id, String role, String contraseña) {
        this.id = id;
        this.role = role;
        this.contraseña = contraseña;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

}
