package Backend;

/**
 *
 * @author jara
 */
public class Informe {
    private int idInfo;
    private int pacInfo;
    private String docInfo;
    private String informe;
    private String fechaInfo;
    private String horaInfo;

    public Informe(int idInfo, int pacInfo, String docInfo, String informe, String fechaInfo, String horaInfo) {
        this.idInfo = idInfo;
        this.pacInfo = pacInfo;
        this.docInfo = docInfo;
        this.informe = informe;
        this.fechaInfo = fechaInfo;
        this.horaInfo = horaInfo;
    }
    public Informe(){}
    
    public int getIdInfo() {
        return idInfo;
    }

    public void setIdInfo(int idInfo) {
        this.idInfo = idInfo;
    }

    public int getPacInfo() {
        return pacInfo;
    }

    public void setPacInfo(int pacInfo) {
        this.pacInfo = pacInfo;
    }

    
    public String getDocInfo() {
        return docInfo;
    }

    public void setDocInfo(String docInfo) {
        this.docInfo = docInfo;
    }

    public String getInforme() {
        return informe;
    }

    public void setInforme(String informe) {
        this.informe = informe;
    }

    public String getFechaInfo() {
        return fechaInfo;
    }

    public void setFechaInfo(String fechaInfo) {
        this.fechaInfo = fechaInfo;
    }

    public String getHoraInfo() {
        return horaInfo;
    }

    public void setHoraInfo(String horaInfo) {
        this.horaInfo = horaInfo;
    }

}
