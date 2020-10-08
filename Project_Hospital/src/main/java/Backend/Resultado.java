package Backend;

import java.io.InputStream;

/**
 *
 * @author jara
 */
public class Resultado {
    private int idRslt;
    private int idAgex;
    private int pacRslt;
    private String docRslt;
    private String examRslt;
    private String labRslt;
    private String ordenRslt;
    private InputStream inptArchivo;
    private byte[] archivo;
    private String fechaRslt;
    private String horaRslt;

    public Resultado(int idRslt, int idAgex, int pacRslt, String docRslt, String examRslt, String labRslt, String ordenRslt, byte[] archivo, String fechaRslt, String horaRslt) {
        this.idRslt = idRslt;
        this.idAgex = idAgex;
        this.pacRslt = pacRslt;
        this.docRslt = docRslt;
        this.examRslt = examRslt;
        this.labRslt = labRslt;
        this.ordenRslt = ordenRslt;
        this.archivo = archivo;
        this.fechaRslt = fechaRslt;
        this.horaRslt = horaRslt;
    }
    
    public String getDocRslt() {
        return docRslt;
    }

    public void setDocRslt(String docRslt) {
        this.docRslt = docRslt;
    }

    public int getIdAgex() {
        return idAgex;
    }

    public void setIdAgex(int idAgex) {
        this.idAgex = idAgex;
    }
   
    public Resultado(){}

    public int getIdRslt() {
        return idRslt;
    }

    public void setIdRslt(int idRslt) {
        this.idRslt = idRslt;
    }

    public int getPacRslt() {
        return pacRslt;
    }

    public void setPacRslt(int pacRslt) {
        this.pacRslt = pacRslt;
    }
    


    public String getExamRslt() {
        return examRslt;
    }

    public void setExamRslt(String examRslt) {
        this.examRslt = examRslt;
    }

    public String getLabRslt() {
        return labRslt;
    }

    public void setLabRslt(String labRslt) {
        this.labRslt = labRslt;
    }

    public String getOrdenRslt() {
        return ordenRslt;
    }

    public void setOrdenRslt(String ordenRslt) {
        this.ordenRslt = ordenRslt;
    }

    public InputStream getInptArchivo() {
        return inptArchivo;
    }

    public void setInptArchivo(InputStream inptArchivo) {
        this.inptArchivo = inptArchivo;
    }

    public byte[] getArchivo() {
        return archivo;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }

    public String getFechaRslt() {
        return fechaRslt;
    }

    public void setFechaRslt(String fechaRslt) {
        this.fechaRslt = fechaRslt;
    }

    public String getHoraRslt() {
        return horaRslt;
    }

    public void setHoraRslt(String horaRslt) {
        this.horaRslt = horaRslt;
    }
    

}
