// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.LivresGroupes;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect LivresGroupes_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager LivresGroupes.entityManager;
    
    public static final List<String> LivresGroupes.fieldNames4OrderClauseFilter = java.util.Arrays.asList("dtFinUsage", "dtCreation", "groupe", "livre");
    
    public static final EntityManager LivresGroupes.entityManager() {
        EntityManager em = new LivresGroupes().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long LivresGroupes.countLivresGroupeses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LivresGroupes o", Long.class).getSingleResult();
    }
    
    public static List<LivresGroupes> LivresGroupes.findAllLivresGroupeses() {
        return entityManager().createQuery("SELECT o FROM LivresGroupes o", LivresGroupes.class).getResultList();
    }
    
    public static List<LivresGroupes> LivresGroupes.findAllLivresGroupeses(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresGroupes o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresGroupes.class).getResultList();
    }
    
    public static LivresGroupes LivresGroupes.findLivresGroupes(Long id) {
        if (id == null) return null;
        return entityManager().find(LivresGroupes.class, id);
    }
    
    public static List<LivresGroupes> LivresGroupes.findLivresGroupesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LivresGroupes o", LivresGroupes.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<LivresGroupes> LivresGroupes.findLivresGroupesEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM LivresGroupes o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, LivresGroupes.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void LivresGroupes.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void LivresGroupes.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            LivresGroupes attached = LivresGroupes.findLivresGroupes(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void LivresGroupes.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void LivresGroupes.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public LivresGroupes LivresGroupes.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LivresGroupes merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}