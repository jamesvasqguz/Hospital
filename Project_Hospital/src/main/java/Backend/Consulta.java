package Backend;

/**
 *
 * @author jara
 */
public class Consulta {

    private String especialidad;
    private double costo;

    public Consulta(String especialidad, double costo) {
        this.especialidad = especialidad;
        this.costo = costo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
}
