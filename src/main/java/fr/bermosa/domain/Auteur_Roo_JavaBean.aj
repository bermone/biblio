// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Acteur;
import fr.bermosa.domain.Auteur;
import fr.bermosa.domain.LivresAuteurs;
import java.util.Date;
import java.util.Set;

privileged aspect Auteur_Roo_JavaBean {
    
    public String Auteur.getPrenom() {
        return this.prenom;
    }
    
    public void Auteur.setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    public String Auteur.getNom() {
        return this.nom;
    }
    
    public void Auteur.setNom(String nom) {
        this.nom = nom;
    }
    
    public Date Auteur.getDtModification() {
        return this.dtModification;
    }
    
    public void Auteur.setDtModification(Date dtModification) {
        this.dtModification = dtModification;
    }
    
    public Date Auteur.getDtCreation() {
        return this.dtCreation;
    }
    
    public void Auteur.setDtCreation(Date dtCreation) {
        this.dtCreation = dtCreation;
    }
    
    public Date Auteur.getDtFinUsage() {
        return this.dtFinUsage;
    }
    
    public void Auteur.setDtFinUsage(Date dtFinUsage) {
        this.dtFinUsage = dtFinUsage;
    }
    
    public Acteur Auteur.getCreerPar() {
        return this.creerPar;
    }
    
    public void Auteur.setCreerPar(Acteur creerPar) {
        this.creerPar = creerPar;
    }
    
    public Set<LivresAuteurs> Auteur.getLivresAuteurs() {
        return this.livresAuteurs;
    }
    
    public void Auteur.setLivresAuteurs(Set<LivresAuteurs> livresAuteurs) {
        this.livresAuteurs = livresAuteurs;
    }
    
    public Acteur Auteur.getModifierPar() {
        return this.modifierPar;
    }
    
    public void Auteur.setModifierPar(Acteur modifierPar) {
        this.modifierPar = modifierPar;
    }
    
}
