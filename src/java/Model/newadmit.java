/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author SHATTER
 */
public class newadmit {
    private String pnic, did, gname, gtp, bid;

    public newadmit(String pnic, String did, String gname, String gtp, String bid) {
        this.pnic = pnic;
        this.did = did;
        this.gname = gname;
        this.gtp = gtp;
        this.bid = bid;
    }

    public String getPnic() {
        return pnic;
    }

    public void setPnic(String pnic) {
        this.pnic = pnic;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGtp() {
        return gtp;
    }

    public void setGtp(String gtp) {
        this.gtp = gtp;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }
    
    
}
