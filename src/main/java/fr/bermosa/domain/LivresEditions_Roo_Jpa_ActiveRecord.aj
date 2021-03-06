// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.LivresEditions;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LivresEditions_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager LivresEditions.entityManager;
    
    public static final List<String> LivresEditions.fieldNames4OrderClauseFilter = java.util.Arrays.asList("dtFinUsage", "dtCreation", "edition", "livre");
    
    public static final EntityManager LivresEditions.entityManager() {
        EntityManager em = new LivresEditions().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long LivresEditions.countLivresEditionses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LivresEditions o", Long.class).getSingleResult();
    }
    
    public static List<LivresEditions> LivresEditions.findAllLivresEditionses() {
        return entityManager().createQuery("SELECT o FROM LivresEditions o", LivresEditions.class).getResultList();
    }
    
    public static List<LivresEditions> LivresEditions.findAllLivresEditionses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresEditions o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresEditions.class).getResultList();
    }
    
    public static LivresEditions LivresEditions.findLivresEditions(Long id) {
        if (id == null) return null;
        return entityManager().find(LivresEditions.class, id);
    }
    
    public static List<LivresEditions> LivresEditions.findLivresEditionsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LivresEditions o", LivresEditions.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<LivresEditions> LivresEditions.findLivresEditionsEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresEditions o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresEditions.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void LivresEditions.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void LivresEditions.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            LivresEditions attached = LivresEditions.findLivresEditions(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void LivresEditions.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void LivresEditions.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public LivresEditions LivresEditions.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LivresEditions merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
