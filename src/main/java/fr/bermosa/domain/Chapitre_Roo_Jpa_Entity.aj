// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Chapitre;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect Chapitre_Roo_Jpa_Entity {
    
    declare @type: Chapitre: @Entity;
    
    @Id
    @SequenceGenerator(name = "chapitreGen", sequenceName = "SEQ_CHAPITRE")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "chapitreGen")
    @Column(name = "id")
    private Long Chapitre.id;
    
    @Version
    @Column(name = "version")
    private Integer Chapitre.version;
    
    public Long Chapitre.getId() {
        return this.id;
    }
    
    public void Chapitre.setId(Long id) {
        this.id = id;
    }
    
    public Integer Chapitre.getVersion() {
        return this.version;
    }
    
    public void Chapitre.setVersion(Integer version) {
        this.version = version;
    }
    
}
