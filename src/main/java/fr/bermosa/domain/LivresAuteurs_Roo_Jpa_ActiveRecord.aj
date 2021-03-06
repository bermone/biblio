// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.LivresAuteurs;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LivresAuteurs_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager LivresAuteurs.entityManager;
    
    public static final List<String> LivresAuteurs.fieldNames4OrderClauseFilter = java.util.Arrays.asList("dtFinUsage", "dtCreation", "auteur", "livre");
    
    public static final EntityManager LivresAuteurs.entityManager() {
        EntityManager em = new LivresAuteurs().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long LivresAuteurs.countLivresAuteurses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LivresAuteurs o", Long.class).getSingleResult();
    }
    
    public static List<LivresAuteurs> LivresAuteurs.findAllLivresAuteurses() {
        return entityManager().createQuery("SELECT o FROM LivresAuteurs o", LivresAuteurs.class).getResultList();
    }
    
    public static List<LivresAuteurs> LivresAuteurs.findAllLivresAuteurses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresAuteurs o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresAuteurs.class).getResultList();
    }
    
    public static LivresAuteurs LivresAuteurs.findLivresAuteurs(Long id) {
        if (id == null) return null;
        return entityManager().find(LivresAuteurs.class, id);
    }
    
    public static List<LivresAuteurs> LivresAuteurs.findLivresAuteursEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LivresAuteurs o", LivresAuteurs.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<LivresAuteurs> LivresAuteurs.findLivresAuteursEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresAuteurs o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresAuteurs.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void LivresAuteurs.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void LivresAuteurs.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            LivresAuteurs attached = LivresAuteurs.findLivresAuteurs(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void LivresAuteurs.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void LivresAuteurs.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public LivresAuteurs LivresAuteurs.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LivresAuteurs merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
