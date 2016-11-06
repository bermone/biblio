// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Partie;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Partie_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Partie.entityManager;
    
    public static final List<String> Partie.fieldNames4OrderClauseFilter = java.util.Arrays.asList("dtCreation", "titre", "resume", "dtModification", "chapitre", "creerPar", "modifierPar");
    
    public static final EntityManager Partie.entityManager() {
        EntityManager em = new Partie().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Partie.countParties() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Partie o", Long.class).getSingleResult();
    }
    
    public static List<Partie> Partie.findAllParties() {
        return entityManager().createQuery("SELECT o FROM Partie o", Partie.class).getResultList();
    }
    
    public static List<Partie> Partie.findAllParties(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Partie o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Partie.class).getResultList();
    }
    
    public static Partie Partie.findPartie(Long id) {
        if (id == null) return null;
        return entityManager().find(Partie.class, id);
    }
    
    public static List<Partie> Partie.findPartieEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Partie o", Partie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Partie> Partie.findPartieEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Partie o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Partie.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Partie.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Partie.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Partie attached = Partie.findPartie(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Partie.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Partie.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Partie Partie.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Partie merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}