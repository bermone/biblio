// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Edition;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect Edition_Roo_Jpa_Entity {
    
    declare @type: Edition: @Entity;
    
    @Id
    @SequenceGenerator(name = "editionGen", sequenceName = "SEQ_EDITION")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "editionGen")
    @Column(name = "id")
    private Long Edition.id;
    
    @Version
    @Column(name = "version")
    private Integer Edition.version;
    
    public Long Edition.getId() {
        return this.id;
    }
    
    public void Edition.setId(Long id) {
        this.id = id;
    }
    
    public Integer Edition.getVersion() {
        return this.version;
    }
    
    public void Edition.setVersion(Integer version) {
        this.version = version;
    }
    
}
