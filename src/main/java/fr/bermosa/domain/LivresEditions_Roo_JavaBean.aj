// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Edition;
import fr.bermosa.domain.Livre;
import fr.bermosa.domain.LivresEditions;
import java.util.Date;

privileged aspect LivresEditions_Roo_JavaBean {
    
    public Date LivresEditions.getDtFinUsage() {
        return this.dtFinUsage;
    }
    
    public void LivresEditions.setDtFinUsage(Date dtFinUsage) {
        this.dtFinUsage = dtFinUsage;
    }
    
    public Date LivresEditions.getDtCreation() {
        return this.dtCreation;
    }
    
    public void LivresEditions.setDtCreation(Date dtCreation) {
        this.dtCreation = dtCreation;
    }
    
    public Edition LivresEditions.getEdition() {
        return this.edition;
    }
    
    public void LivresEditions.setEdition(Edition edition) {
        this.edition = edition;
    }
    
    public Livre LivresEditions.getLivre() {
        return this.livre;
    }
    
    public void LivresEditions.setLivre(Livre livre) {
        this.livre = livre;
    }
    
}
