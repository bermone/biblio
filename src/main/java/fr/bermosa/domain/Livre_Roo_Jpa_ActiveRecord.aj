// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.bermosa.domain;

import fr.bermosa.domain.Livre;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Livre_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Livre.entityManager;
    
    public static final List<String> Livre.fieldNames4OrderClauseFilter = java.util.Arrays.asList("titre", "dtSortie", "isbn", "dtModification", "dtCreation", "dtFinUsage", "chapitres", "creerPar", "livresAuteurs", "livresEditions", "livresGroupes", "modifierPar");
    
    public static final EntityManager Livre.entityManager() {
        EntityManager em = new Livre().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Livre.countLivres() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Livre o", Long.class).getSingleResult();
    }
    
    public static List<Livre> Livre.findAllLivres() {
        return entityManager().createQuery("SELECT o FROM Livre o", Livre.class).getResultList();
    }
    
    public static List<Livre> Livre.findAllLivres(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Livre o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Livre.class).getResultList();
    }
    
    public static Livre Livre.findLivre(Long id) {
        if (id == null) return null;
        return entityManager().find(Livre.class, id);
    }
    
    public static List<Livre> Livre.findLivreEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Livre o", Livre.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Livre> Livre.findLivreEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Livre o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Livre.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Livre.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Livre.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Livre attached = Livre.findLivre(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Livre.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Livre.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Livre Livre.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Livre merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
